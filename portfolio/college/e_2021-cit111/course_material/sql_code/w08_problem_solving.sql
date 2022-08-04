-- A few similar to Homework for practice, have students use problem solving techniques to think through these practice queries.

-- 1. --parameters for DATEDIFF(date, date)--
-- Show the cust_order_id and using today's date. How long in years, ROUNDED to the nearest year, has it been since the product shipped.

SELECT cust_order_id, ROUND(DATEDIFF(NOW(), shipped_date)/365) AS 'Years since product shipped'
FROM cust_order;

-- 2. -- parameters for DATE_FORMAT(date, format)--
	  -- parameters for DATE_ADD(date, interval)--
-- Show the shipped_date
-- Add 2 months to each shipped_date 
-- Format that date so it takes the format of Month name, number day with comma and then a 4 digit year January 14, 2019

SELECT shipped_date, DATE_FORMAT(DATE_ADD(shipped_date, INTERVAL 2 MONTH), '%c / %e / %y') AS '2 months after shipped'
FROM cust_order;

-- download magazine.sql and import it into Workbench

USE magazine;
 
SELECT * from magazine;

-- 3. -- parameters for LOCATE(find, search, start)
-- any string with 'Ma", we want to take from that word on and take if off the magazine name
SELECT LEFT(magazineName, LOCATE(' Ma', magazineName))
FROM magazine
WHERE magazineName LIKE '%Ma%';

-- OR

SELECT SUBSTRING(magazineName, 1, Locate(' Ma', magazineName))
FROM magazine;

-- What if we just wanted that 'Ma' word and beyond?
SELECT RIGHT(magazineName,LENGTH(magazineName) - LOCATE(' Ma', magazineName))
FROM magazine
WHERE magazineName LIKE '%Ma%';

-- OR

SELECT SUBSTRING(magazineName, Locate(' Ma', magazineName))
FROM magazine;
