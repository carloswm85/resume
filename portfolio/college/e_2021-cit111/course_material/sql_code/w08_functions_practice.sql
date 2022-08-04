USE bike;

SELECT * FROM store;

SELECT CONCAT('The ', store_name, ' email is ', email)
FROM store;

-- if we used store_id which is an integer that would become a part of the string and would not be an integer any more.

SELECT LEFT(product_name, 15)
FROM product;  -- try RIGHT

SELECT LENGTH(product_name)  -- includes spaces
FROM product;

SELECT LENGTH(TRIM('  this is it  ')); -- try LTRIM and RTRIM

SELECT LOWER(store_name) -- and UPPER
FROM store;

-- parameters for LOCATE(find, search, start)

SELECT product_name AS 'Girl Bike'
FROM product
WHERE LOCATE('Girl', product_name, 1) > 1;

-- parameters for SUBSTRING(string, start, length)--

SELECT SUBSTRING(product_name, 9, 6)
FROM product;

SELECT SUBSTRING(product_name, LOCATE('Girl', product_name, 1), 6)
FROM product
WHERE LOCATE('Girl', product_name, 1) > 1;

USE art_gallery;

SELECT title
FROM artwork;

SELECT LOCATE('Woman', title, 1)
FROM artwork;

SELECT SUBSTRING(title, LOCATE('Woman', title, 1), 5)
FROM artwork;

-- NUMERIC functions

USE bike;

SELECT list_price
FROM product;

SELECT ROUND(list_price, 2) -- try 3, 2, no 2nd parameter
FROM product;

SELECT FLOOR(list_price) -- CEILING
FROM product;

SELECT CONCAT('$', FORMAT(list_price, 2, 'en_US'))
FROM product;

-- DATE functions

SELECT YEAR(order_date) -- MONTH, DAY 
FROM cust_order;

SELECT HOUR(NOW()); -- MINUTE, SECOND

-- days it took from order to shipped

SELECT DATEDIFF(shipped_date, order_date)
FROM cust_order;

SELECT order_date, DATE_ADD(order_date, INTERVAL 9 DAY)
FROM cust_order;

-- Format Code	Description
-- %c	Month, numeric
-- %M	Month name
-- %e	Day of the month, numeric
-- %D	Day of the month with suffix
-- %y	Year, 2 digits
-- %Y	Year, 4 digits
-- %W	Weekday name

SELECT DATE_FORMAT(order_date, '%M the %D, %Y')
FROM cust_order;

SELECT DATE_FORMAT(order_date, '%c/%e/%y')
FROM cust_order;