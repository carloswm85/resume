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