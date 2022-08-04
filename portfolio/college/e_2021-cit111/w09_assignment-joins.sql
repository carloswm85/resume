USE v_art;

-- 1
# When you visit the Virtual Art Gallery Database and you search by Period/Style and you choose Impressionism,
# you get two resulting images ("Woman in the Garden" and "Irises").
# What query would be used in the code here to allow the user to see these images? No join is needed. 
SELECT * FROM artwork;
SELECT artfile
-- , period
FROM artwork
WHERE period = 'Impressionism';

-- 2 
# When you visit the Virtual Art Gallery Database, search by Subject and type in the word flower, you get three images.
# What query would have allowed the user to get those results (remember, the keyword might have been 'flowers' but they typed 'flower') .
SELECT * FROM artwork;
SELECT * FROM artwork_keyword;
SELECT * FROM keyword;

SELECT artfile
FROM artwork
	JOIN artwork_keyword
		ON artwork.artwork_id = artwork_keyword.artwork_id
	JOIN keyword
		ON keyword.keyword_id = artwork_keyword.keyword_id
WHERE keyword.keyword LIKE 'flower%';

-- 3
# List all the artists from the artist table, but only the related artwork from the artwork table.
# We need the first name, last name, and artwork title.
SELECT fname, lname, title
FROM artist
	JOIN artwork
		on artist.artist_id = artwork.artist_id;

USE magazine;
-- 4
# List all subscriptions with the magazine name, last name, first name, and sort alphabetically by magazine name. 
SELECT * FROM magazine, subscriber, subscription;
SELECT * FROM magazine;
SELECT * FROM subscriber;
SELECT * FROM subscription;

SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine m
	JOIN subscription s
		ON s.magazineKey = m.magazineKey 
	JOIN subscriber ss
		ON s.subscriberKey = ss.subscriberKey
ORDER BY magazineName;


-- 5
# List all the magazines that Samantha Sanders subscribes to. 
SELECT magazineName
FROM magazine m
	JOIN subscription s
		ON s.magazineKey = m.magazineKey 
	JOIN subscriber ss
		ON s.subscriberKey = ss.subscriberKey
WHERE subscriberFirstName = 'Samantha'
ORDER BY magazineName;


USE employees;
-- 6
# List the first five employees from the Customer Service Department. Put them in alphabetical order by last name.
SELECT * FROM employees;
SELECT * FROM dept_emp; -- middle table
SELECT * FROM departments;

SELECT employees.emp_no, first_name, last_name
FROM employees
	JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no 
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service'
ORDER BY last_name
LIMIT 5;

-- 7
# Find out the current salary and department of Berni Genin. You can use the ORDER BY and LIMIT to get just the most recent salary.
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM departments;
# I'm selecting data from different tables.
SELECT 
	# employees.emp_no, 
    first_name, last_name, dept_name, salary, salaries.from_date
FROM employees
	JOIN salaries
		ON employees.emp_no = salaries.emp_no
	JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no 
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no
WHERE first_name = 'Berni' AND last_name = 'Genin'
ORDER BY salaries.from_date DESC
LIMIT 1;
