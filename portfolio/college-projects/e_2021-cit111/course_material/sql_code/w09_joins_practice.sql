USE v_art;

-- A list of all the artists with each of their art works (can demonstrate alias's and USING if you'd like here, but realize the USING clause isn't universal for all RDBMS and there are some limitations with USING. That is why we teach with ON not USING) 
SELECT fname, lname, title
FROM artist JOIN artwork
	ON artist.artist_id = artwork.artist_id;

-- A list of all the artists even if they don't have any artwork
-- in other words: all artist and only related artwork
SELECT fname, lname, title
FROM artist LEFT JOIN artwork
	ON artist.artist_id = artwork.artist_id;

-- Show them art.ceiwebdev.com

-- What if I only want Leonardo diVinci's?
SELECT fname, lname, title, artfile, period, arttype, artlocation
FROM artist JOIN artwork
	ON artist.artist_id = artwork.artist_id
WHERE lname = 'da Vinci';

-- On their own: A list of all the artwork from artist in the 
-- Netherlands
SELECT title, artfile, period, arttype, artlocation
FROM artwork JOIN artist
	ON artist.artist_id = artwork.artist_id
WHERE country = "Netherlands";

USE bike;

SELECT * FROM category;

SELECT * FROM product;

SELECT product_name, category_name, list_price
FROM product JOIN category
	ON product.category_id = category.category_id;
    
-- I also want the brand as well, this involves 3 tables
SELECT product_name, category_name, brand_name, list_price
FROM product JOIN category
	ON product.category_id = category.category_id
    JOIN brand
    ON product.brand_id = brand.brand_id;
    
-- On their own: All children category bikes
SELECT product_id, product_name
FROM product JOIN category
	ON product.category_id = category.category_id
WHERE category_name = "Children Bicycles";

SELECT * FROM store;
SELECT * FROM staff;

-- On their own: All staff at Rowlett Bikes Store
SELECT first_name, last_name
FROM staff JOIN store
	ON staff.store_id = store.store_id
WHERE store_name = "Rowlett Bikes";

-- All products ordered with price and quantity, shows need for grouping later
SELECT product_name, cust_order_id, product.list_price, quantity
FROM product JOIN cust_order_item
	ON product.product_id = cust_order_item.product_id
ORDER BY cust_order_id;

SELECT * FROM cust_order;

-- All products ordered in March 2016
SELECT product_name, cust_order.cust_order_id, product.list_price, quantity, order_date
FROM product JOIN cust_order_item
	ON product.product_id = cust_order_item.product_id
	JOIN cust_order
    ON cust_order.cust_order_id = cust_order_item.cust_order_id
WHERE order_date BETWEEN '2016-03-01' AND '2016-03-31';

-- More joins (table aliases, more practice with outer joins)

-- show table aliases, AS is an optional keyword with column aliases
-- and with table aliases
SELECT subscriberLastName AS lastname, subscriberFirstName, subscriptionStartDate
FROM subscriber sr
	JOIN subscription sn -- add LEFT OUTER later to review OUTER JOINS Walter shows
		ON sr.subscriberKey = sn.subscriberKey
ORDER BY lastname;

-- reverse the two table's order and show how it's the same with RIGHT
-- There is one magazine with no subscribers. How would you show all magazines
-- and only the related data of the subscription table? (On their own)
-- list out magazineName, magazinePrice, and subscriptionStartDate (use table aliases)
SELECT magazineName, magazinePrice, subscriptionStartDate
FROM magazine m LEFT JOIN subscription s
	ON m.magazineKey = s.magazineKey;
    
-- Now add to the query above the 3rd table of subscribers so you can see
-- their last name (demonstrates using 3 tables in a OUTER JOIN) (On their Own)
-- It should still show the one magazine with  date and name as null
SELECT magazineName, magazinePrice, subscriptionStartDate, subscriberLastName
FROM magazine m 
	LEFT JOIN subscription s
	ON m.magazineKey = s.magazineKey
    LEFT JOIN subscriber sr
    ON s.subscriberKey = sr.subscriberKey;
    
-- need the second JOIN as LEFT otherwise you don't get all the results from 
-- the first join that includes the one magazine with no relations.
-- Because that magazine didn't have a related magazineKey in the first JOIN, it won't
-- show the next join either (no subscriber either), unless we ask for all in the previous join.
-- draw a Venn diagram to explain with 3 circles. 

-- Demonstrate a FULL OUTER JOIN simulated with UNION in MySQL
-- Copy the LEFT OUTER JOIN above and UNION it to Same with ithe RIGHT JOINS
SELECT magazineName, magazinePrice, subscriptionStartDate, subscriberLastName
FROM magazine m 
	LEFT JOIN subscription s
	ON m.magazineKey = s.magazineKey
    LEFT JOIN subscriber sr
    ON s.subscriberKey = sr.subscriberKey
UNION
SELECT magazineName, magazinePrice, subscriptionStartDate, subscriberLastName
FROM magazine m 
	RIGHT JOIN subscription s
	ON m.magazineKey = s.magazineKey
    RIGHT JOIN subscriber sr
    ON s.subscriberKey = sr.subscriberKey;
    
-- show Venn diagrams with two 3 part tables overlapping and shading everything.
-- The first SELECT gets all magazines even with no subscribers.
-- The second SELECT gets all the subscribers even if they haven't subscribed to a magazine.