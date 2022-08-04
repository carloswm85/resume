USE art_gallery;

SELECT * FROM artwork;

SELECT title, period
FROM artwork
ORDER BY title
LIMIT 3;

SELECT DISTINCT period 
FROM artwork;

SELECT title 
FROM artwork
WHERE artist_id = 3; 

SELECT title
FROM artwork
WHERE title < 'I'     -- try < 'J' to get I's

SELECT title, artyear
FROM artwork
WHERE artyear > 1800 AND artyear < 1900;
-- OR
SELECT title, artyear
FROM artwork
WHERE artyear BETWEEN 1800 AND 1900;

SELECT title 
FROM artwork
WHERE period IN('Modern', 'Baroque');

SELECT title, period
FROM artwork
WHERE period LIKE '%impr%';
-- OR
SELECT title, period
FROM artwork
WHERE period REGEXP 'impr';

SELECT title, period
FROM artwork
WHERE period REGEXP '^Post';

SELECT title, period
FROM artwork
WHERE period REGEXP 'ism$';

SELECT title 
FROM artwork
WHERE title REGEXP '^Old';

SELECT title
FROM artwork
WHERE title REGEXP 'the|in|on';

SELECT fname AS First, mname AS Middle, lname AS Last
FROM artist
WHERE mname IS NOT NULL
ORDER BY Middle; 
-- can't use Middle for WHERE

USE bike;

SELECT * FROM product;

SELECT product_name, model_year, ROUND(list_price) AS 'Rounded Price'
FROM product;
 
SELECT product_name, model_year, list_price + 100
FROM product;

SELECT product_name, list_price + 100 AS price_adjustment
FROM product
WHERE list_price + 100 > 1000   -- can't use price_adjustment here because of Order of Executuion
ORDER BY price_adjustment;     -- can use it here however

SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name LIKE 'Surly%') AND model_year <> 2016;  
-- change AND to OR and now you get other brands that are not 2016
-- Without the ()s is only takes off 2016s for Surly