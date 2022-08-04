USE bike;

-- 1. Get the average quantity that we have in all our bike stocks. Round to the nearest whole number.

SELECT ROUND(AVG(quantity))As 'Stock Average'
FROM stock;

-- 2. Show each bike that needs to be reordered. Filter the results to only the lowest quantity of zero. Order by product_name
-- (instructors: the results should be 24 rows, if there is 25 and they have two rows with "Electra Townie Commute Go! - 2018", 
-- then they forgot to use DISTINCT or GROUP BY)

SELECT DISTINCT product_name
FROM stock s JOIN product p
	ON s.product_id = p.product_id
WHERE quantity < 1
ORDER BY product_name;

-- OR

SELECT product_name
FROM stock s JOIN product p
	ON s.product_id = p.product_id
WHERE quantity < 1
GROUP BY product_name
ORDER BY product_name;

-- 3. We want to see how many of each category of bike we have in our "Baldwin Bikes" store, store_id 2. We need to see the name of the category as well as the number of bikes in the category.Sort it by lowest numbers first.

SELECT category_name, COUNT(p.category_id) AS instock
FROM category c JOIN product p
	ON c.category_id = p.category_id
    JOIN stock s
    ON p.product_id = s.product_id
WHERE store_id = 2
GROUP BY category_name
ORDER BY instock;

USE employees;
-- 4. How many employees do we have?

SELECT COUNT(emp_no)AS 'Number of Employees'
FROM employees;

-- 5. Get the average salaries in each department. We only need those department averages that are below 60,000. Format the salary 2 decimal places and a comma in the thousands place. 

SELECT dept_name, FORMAT(AVG(salary), 2, 'en-US') AS average_salary
FROM salaries s
	JOIN employees e
		ON s.emp_no = e.emp_no
	JOIN dept_emp de
		ON e.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
GROUP BY dept_name
HAVING AVG(salary) < 60000;

-- 6. How many females work in each department?

SELECT dept_name, COUNT(gender)AS 'Number of Females'
FROM employees e JOIN dept_emp de
	ON e.emp_no = de.emp_no
    JOIN departments d
    ON de.dept_no = d.dept_no
WHERE gender = "F"
GROUP BY dept_name;