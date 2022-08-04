USE art_gallery;

SELECT country, fname, lname
FROM artist;

-- How many artist are from France? What if there were thousands?
SELECT country, fname, lname
FROM artist
WHERE country = ‘France’;

SELECT COUNT(country)
FROM artist
WHERE country = ‘France’;

-- Can't use fname and lname anymore because the summary count doesn't go with one person
SELECT COUNT(country), fname, lname
FROM artist
WHERE country = ‘France’;

-- But I could use country because that is the same for all
SELECT COUNT(country), country
FROM artist
WHERE country = ‘France’;

USE bike;

SELECT list_price
FROM product;

SELECT AVG(list_price)
FROM product;

SELECT FORMAT(AVG(list_price), 2)
FROM product;

SELECT SUM(list_price)
FROM product;

SELECT MAX(list_price), MIN(list_price)
FROM product;

-- If I wanted the average of each model year I could get one year at a time this way
SELECT AVG(list_price)
FROM product
WHERE model_year = 2016;
-- And I'd have to do that for each year. What is I wanted all the years at once?
SELECT AVG(list_price)
FROM product
WHERE model_year = 2017;

-- Answer: use GROUP BY
SELECT AVG(list_price)
FROM product
GROUP BY model_year;

-- can use model_year to clarify. The model year is the same for each row
SELECT model_year, AVG(list_price)
FROM product
GROUP BY model_year;

-- filtering before it's grouped. Look at image here and talk about order of execution. FROM WHERE GROUP BY HAVING SELECT ORDER BY LIMIT
SELECT model_year, AVG(list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year;

-- WITH ROLLUP is a subclause of GROUP BY, average of all the averages
SELECT model_year, AVG(list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- Sum of all the sums 'Grand Total'
SELECT model_year, SUM(list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- if we had bikes the same price we might not want to include the same price twice in the average, we'd use DISTINCT
SELECT model_year, AVG(DISTINCT list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- ALL is the default and is assumed when not there
SELECT model_year, AVG(list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- Works well with COUNT. 
SELECT model_year, COUNT(ALL list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

SELECT model_year, COUNT(DISTINCT list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- Here we can count all the unique list_prices
SELECT model_year, COUNT(DISTINCT list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- HAVING filters after the grouping. Remember you only have access to what has been grouped and aggregated (values and aggregates that are part of the group). It's right there with SELECT in the Order of Execution
SELECT model_year, AVG(list_price)
FROM product
WHERE list_price > 2800
GROUP BY model_year 
HAVING AVG(list_price) > 4000;

-- Be careful using FORMAT in a HAVING clause (it's a string not a number at that point)
SELECT model_year, FORMAT(AVG(list_price), 2)
FROM product
WHERE list_price > 2800
GROUP BY model_year 
HAVING FORMAT(AVG(list_price), 2) > 4000;

-- WHERE can use any column in the base table but HAVING can't
SELECT model_year, FORMAT(AVG(list_price), 2)
FROM product
WHERE product_name LIKE '%speed%'
GROUP BY model_year
HAVING AVG(list_price) > 300;

-- An average of each brand
SELECT brand.brand_name, FORMAT(AVG(list_price), 2) 
FROM product
	JOIN brand
		ON product.brand_id = brand.brand_id
GROUP BY brand.brand_name WITH ROLLUP; 

-- Filtering before and after the grouping
SELECT brand.brand_name, FORMAT(AVG(list_price), 2) AS average
FROM product
	JOIN brand
		ON product.brand_id = brand.brand_id
WHERE model_year > '2016'
GROUP BY brand.brand_name WITH ROLLUP
HAVING AVG(list_price) > 2000; 

USE magazine;

-- on their own -- How many people subscribe to Beautiful Birds
SELECT COUNT(subscriberKey) AS subscribers 
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey
WHERE magazineName = "Beautiful Birds";

-- I can add magazineName because the WHERE does limit it to that magazine
SELECT magazineName, COUNT(subscriberKey) AS subscribers 
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey
WHERE magazineName = "Beautiful Birds";

-- Now how do I see subscribers to all magazines?
SELECT magazineName, COUNT(subscriberKey) AS subscribers
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey
GROUP BY magazineName;

-- what would I add to see just magazines with 2 or more subscribers?
SELECT magazineName, COUNT(subscriberKey) AS subscribers
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey  
GROUP BY magazineName
HAVING subscribers >= 2;  

-- What is the total revenue for each magazine?
SELECT magazineName, COUNT(subscriberKey) AS subscribers, SUM(magazinePrice) AS 'Total Revenue'
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey  
GROUP BY magazineName
ORDER BY magazineName;

USE bike;

-- On their own -- Get the highest and lowest priced bike in each brand

SELECT brand_name, MAX(list_price), MIN(list_price) 
FROM product
	JOIN brand
		ON product.brand_id = brand.brand_id
GROUP BY brand_name; 
-- note Windows machines might let them see brand_name even if they take off the GROUP BY -- it shouldn't


-- On their own -- How many bikes we have total in stock everywhere. 13,511
SELECT SUM(quantity)
FROM stock;

-- How can we group it to see how many of each bike we have in stock everywhere?
SELECT product_name, SUM(quantity)
FROM stock st
	JOIN product p
	ON st.product_id = p.product_id
GROUP BY product_name WITH ROLLUP;

-- We can also see how many we have at of each bike at each store
SELECT store_name, product_name, SUM(quantity)
	FROM store s 
		JOIN stock st
			ON s.store_id = st.store_id
		JOIN product p
			ON st.product_id = p.product_id
GROUP BY product_name, store_name;

-- WITH ROLLUP shows a total of each bike at the stores and grand total at bottom 13,511
SELECT store_name, product_name, SUM(quantity)
	FROM store s 
		JOIN stock st
			ON s.store_id = st.store_id
		JOIN product p
			ON st.product_id = p.product_id
GROUP BY product_name, store_name WITH ROLLUP;

-- If we reverse the grouping with store name as group and product as the sub group we get the total of how many bikes we have at each store.

SELECT store_name, product_name, SUM(quantity)
	FROM store s 
		JOIN stock st
			ON s.store_id = st.store_id
		JOIN product p
			ON st.product_id = p.product_id
GROUP BY store_name, product_name WITH ROLLUP;

-- Now we can see if one specific bike is at any of the stores adding a WHERE
SELECT store_name, product_name, SUM(quantity)
	FROM store s 
		JOIN stock st
			ON s.store_id = st.store_id
		JOIN product p
			ON st.product_id = p.product_id
WHERE product_name LIKE "Electra Cruiser 1 Ladies%"
GROUP BY product_name, store_name;
