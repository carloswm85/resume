 SELECT * FROM magazine;

-- 1.
-- List the magazine name and then
-- Take 3% off the magazine price and round to 2 decimal places.
SELECT magazineName, ROUND(magazinePrice - magazinePrice * .03, 2)AS '3% off'
FROM magazine;

-- 2.
-- Show the subscriberKey and using the date of 2020-12-20 as today. How long in years, ROUNDED to the nearest year, has it been since their subscriptions started

SELECT subscriberKey, ROUND(DATEDIFF('2020-12-20', subscriptionStartDate)/365) AS 'Years since subscription'
FROM subscription;

-- 3.
-- Show the subscriptionStartDate and subscriptionLength and 
-- Add the subscriptionLength to the subscriptionStartDate to see the date of how long their subscription will go
-- Format that date so it takes the format of Month name, number day with comma and then a 4 digit year January 14, 2019

SELECT subscriptionStartDate, subscriptionLength, DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), '%M %e, %Y') AS 'Subscription end'
FROM subscription;

-- 4.
-- We need a list of all the products without the year at the end of the product_name string
-- Notice, some have two years listed, make sure you take those off as well.
-- Limit your results to the first 14 

-- SELECT LOCATE(' -', product_name, 1 ) 
-- FROM product; -- index of where the space before the - starts

SELECT LEFT(product_name, LOCATE(' -', product_name)) AS 'Product Name without Year'
FROM product
LIMIT 14;

-- or

SELECT SUBSTRING(product_name, 1, LOCATE(' -', product_name, 1 ))
FROM product
LIMIT 14;

-- 5.
-- List the product name and then
-- Take the 2019 bikes and divide the price into 3 equal payments. Display one of the payments
-- with a dollar sign, comma at the thousands place and two decimal places.

SELECT product_name, CONCAT('$', FORMAT(list_price / 3, 2, 'en_US')) AS 'One of 3 payments'
FROM product
WHERE model_year = '2019';