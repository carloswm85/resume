USE bike;

SELECT * FROM product;

-- Let's try some MATH

SELECT product_name, model_year, round(list_price) AS Rounded
FROM product;

SELECT product_name, model_year, list_price, round(list_price + 100) AS 'Marked up price and rounded'
FROM product;

SELECT product_name, model_year, list_price, round(list_price + 100) AS 'Marked up'
FROM product
WHERE list_price + 100 > 1000
ORDER BY 'Marked up';

SELECT product_name, model_year
FROM product
WHERE product_name LIKE 'Trek%' -- Any number of characters that start with Trek
OR product_name Like 'Surly%'
AND model_year <> 2016; -- But AND has precedence over OR

SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name Like 'Surly%')
AND model_year <> 2016; -- Here the precedence is fixed, and I really not get the 2016 models.

SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name Like 'Surly%')
OR model_year <> 2016; -- OR variation.