-- 1.
INSERT INTO artist
	(fname, lname, dob, dod, country)
VALUES
	('Johannes', 'Vermeer', 1632, 1674, 'Netherlands');
    
-- OR
INSERT INTO artist VALUES
	(DEFAULT, 'Johannes', NULL, 'Vermeer', 1632, 1674, 'Netherlands', 'n');

-- 2.
SELECT fname, mname, lname, dob, dod, country, local 
FROM artist;
-- (not SELECT * FROM artist, because artist_id is not listed)

-- 3.
UPDATE artist
SET dod = 1675
WHERE lname = 'Vermeer'; -- this WHERE can use name or artist_id
-- the artist_id number can vary 

-- 4.
DELETE FROM artist
WHERE lname = 'Vermeer'; -- this WHERE can use name or artist_id

-- 5. (9 results)
SELECT first_name, last_name, phone FROM customer
WHERE state='TX' AND city = 'Houston';  -- if they just have city that's fine

-- 6 (13 results)
SELECT product_name, list_price, list_price - 500 AS 'Discount Price'
FROM product
WHERE list_price > 5000
ORDER BY list_price DESC;

-- 7 
SELECT first_name, last_name, email
FROM staff
WHERE store_id <> 1; -- could also be != or store_id = 2 AND store_id = 3

-- 8 
SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%'; -- or REGEXP 'spider'

-- 9.
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price;

-- 10. There are a variety of ways they could do the WHERE
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL AND city REGEXP 'ach|och' OR last_name = 'William'
LIMIT 5;