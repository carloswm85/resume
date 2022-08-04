USE bike;

SELECT * FROM stock;
-- 1. Get the average quantity that we have in all our bike stocks. Round to the nearest whole number. 
SELECT round(avg(quantity))
FROM stock;

-- 2. Show each bike that needs to be reordered. Filter the results to only the lowest quantity of zero.
-- Order by product_name The image below show the first 12 of 24 rows total. You don't need to use a LIMIT.
-- (Hint for this one: Two different stores have the same bike that needs to be reordered. You only need it to show up once.)
SELECT * FROM product;
SELECT * FROM stock ORDER BY quantity;

SELECT product_name
-- , min(quantity)
	FROM product p
    JOIN stock s
ON p.product_id = s.product_id
GROUP BY product_name
HAVING  min(DISTINCT quantity) = 0
ORDER BY product_name;

-- 3. How many of each category of bikes do we have in our "Baldwin Bikes" store, which has the store_id of 2.
-- We need to see the name of the category as well as the number of bikes in the category.
-- Sort it by lowest numbers first. 
USE bike;
SELECT * FROM category;
SELECT * FROM product;
SELECT * FROM stock;
SELECT * FROM store;

SELECT category_name,count(quantity) as 'instock'
	FROM category c
    JOIN product p ON c.category_id = p.category_id
    JOIN stock sk ON sk.product_id =  p.product_id
    JOIN store st ON sk.store_id = st.store_id
WHERE sk.store_id = 2 -- filtering
GROUP BY p.category_id
ORDER BY count(quantity);
 

-- 4. How many employees do we have? (3 points)
USE employees;
SELECT * FROM employees;

SELECT count(emp_no) AS 'Number of Employees' FROM employees;

-- 5. Get the average salaries in each department.
-- We only need those departments that have average salaries that are below 60,000.
-- Format the salary to 2 decimal places and a comma in the thousands place. 
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_emp;

SELECT dept_name, round(avg(salary), 2)
	FROM departments d
		JOIN dept_emp de ON d.dept_no = de.dept_no
        JOIN salaries s ON de.emp_no = s.emp_no
        GROUP BY dept_name
        HAVING avg(salary) < 60000;
	
-- 6. Find out how many females work in each department. Sort by department name.
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;

SELECT dept_name, count(gender)
	FROM departments d
		JOIN dept_emp de ON d.dept_no = de.dept_no
        JOIN employees em ON de.emp_no = em.emp_no
        WHERE gender = 'F'
        GROUP BY dept_name
        ORDER BY dept_name;
        