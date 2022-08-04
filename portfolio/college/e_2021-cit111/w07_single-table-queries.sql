-- V_ART DATABASE
USE v_art;
SELECT * FROM artist;

-- 1
-- What would the insert statement look like that would run as the manager adds a new artist to the system?
INSERT INTO artist
(artist_id, fname, mname, lname, dob, dod, country, local)
VALUES
(DEFAULT, 'Johannes', NULL, 'Vermeer', 1632, 1674, 'Netherlands', 'n');

-- 2
-- What query would allow all seven columns of values to show up on the screen alphabetically by the last name?
SELECT artist_id, fname, mname, lname, dob, dod, country, local
FROM artist
ORDER BY lname;

-- 3
-- What SQL statement will run in the background to accomplish this edit? (Don't forget a WHERE clause!)
UPDATE artist
SET dod = 1675
WHERE lname = 'Vermeer';

-- 4
--  What SQL statement will run in the code that would delete Johannes Vermeer from the database when the manager selects 'Confirm Deletion'? (Don't forget a WHERE clause!)
DELETE FROM artist
WHERE lname = 'Vermeer';


-- BIKE DATABASE
USE bike;
SELECT * FROM customer;
SELECT * FROM product;

-- 5
--  You need a list of their first and last names and phone numbers.
SELECT first_name, last_name, phone
FROM customer;

-- 6
-- . You need to have a list showing the bike name, list price and discount price with an alias of 'Discount Price'. Sort the list showing the most expensive bike first.
SELECT product_name, list_price, list_price - 500 AS 'Discount Price'
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;

-- 7
-- You need a list of all the staff and their email who are not from your store.
SELECT first_name, last_name, email
-- , store_id
FROM staff
WHERE store_id <> 1;

-- 8
-- You need to list the name, model year, and list price of all the bikes with the word 'spider' somewhere in the name. 
SELECT product_name, model_Year, list_price
FROM product
WHERE product_name LIKE '%spider%';

-- 9
-- You need to list all bikes names that have a range of prices from $500–$550 sorted with the lowest price first.
SELECT product_name
-- , list_price
FROM product
WHERE list_price >= 500 and list_price <= 550
ORDER BY list_price;


-- 10
-- Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
-- have a phone number listed // and whose city has the letters 'ach' or 'och' somewhere in their name of the city // or whose last name is William. 
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL
AND (city LIKE '%ach%' OR '%och%')
-- AND last_name = 'Colon';
AND last_name = 'William';
