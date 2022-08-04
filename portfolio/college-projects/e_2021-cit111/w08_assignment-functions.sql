USE magazine;
SELECT * FROM magazine;

-- 1
-- List the magazine name and then take 3% off the magazine price and round to 2 decimal places. 
SELECT magazineName, magazinePrice, magazinePrice - magazinePrice * 0.03 AS 'Discounted', ROUND(magazinePrice - magazinePrice * 0.03, 2) AS 'Rounded'
FROM magazine;

-- 2
-- Show the primary key of id from the subscriber table and using the date of 2020-12-20 as if it were today's date,
-- how long in years, ROUNDED to the nearest year, has it been since their subscription started?
SELECT * FROM subscriber JOIN subscription;

SELECT
	subscriber.subscriberKey,
	-- concat(subscriberFirstName, ' ', subscriberLastName) AS 'Subscriber',
    -- datediff('2020-12-20', subscriptionStartDate) AS 'Days',
    round(datediff('2020-12-20', subscriptionStartDate) / 365, 0) AS 'Years Rounded'
FROM subscriber
	JOIN subscription ON subscriber.subscriberKey = subscription.subscriberKey;

-- 3
-- Show the subscriptionStartDate and subscriptionLength
-- and add the  subscriptionLength to the subscriptionStartDate to see the date of how long their subscription will go.
-- Format that date so it takes the format of Month name, number day with comma and then a 4 digit year.
SELECT * FROM subscriber JOIN subscription;

SELECT
	-- subscriber.subscriberKey,
    subscriptionStartDate, subscriptionLength,
	@var_name := date_add(subscriptionStartDate, INTERVAL subscriptionLength MONTH) AS 'Expire Date',
    date_format(@var_name, '%M %e, %Y') AS 'New Date Formatted'
FROM subscriber
	JOIN subscription ON subscriber.subscriberKey = subscription.subscriberKey;

USE bike;
-- 4
-- We need a list of all the products without the year at the end of the product_name string.
-- Notice that some have two years listed, make sure you take those off as well.
-- Order your results by product_id and limit your results to the first 14.
SELECT * FROM product;
SELECT 
	-- product_id, product_name,
    -- @position := locate(' - ', product_name) AS 'Position',
    -- substring(product_name, 1, @position) AS 'Name'
    substring(product_name, 1, locate(' - ', product_name)) AS 'Name'
FROM product
ORDER BY product_id
LIMIT 14;

-- 5
-- List the product name and then take the 2019 model year bikes and divide the price into 3 equal payments.
-- Display one of the payments with a dollar sign, comma at the thousands place and two decimal places.
SELECT 
	product_name,
    concat('$ ', format(list_price / 3 , 2, 'en_US')) AS 'One of 3 payments'
FROM product
WHERE model_year = 2019;