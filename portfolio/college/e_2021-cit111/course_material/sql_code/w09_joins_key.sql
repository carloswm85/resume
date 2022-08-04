USE v_art;

/* 1.
 when you visit art.ceiwebdev.com and you search by Period/Style
 and choose Impressionism, you get two resulting images
 What query would allow the user to use the term Impressionism and 
 bring up the images of 'Woman in the Garden' and 'Irises'
 no join needed */

SELECT artfile
FROM artwork
WHERE period = "Impressionism";

/* 2.
 when you visit art.ceiwebdev.com and you click on Subject and type in 
 flower, you get three pieces of art that had the keyword flower related to them
 What query would have allowed you to get the results of listing those
 images by file name? (and what if the keyword is flowers 
 and they type flower?) */

SELECT artfile
FROM artwork JOIN artwork_keyword
	ON artwork.artwork_id = artwork_keyword.artwork_id
    JOIN keyword
    ON artwork_keyword.keyword_id = keyword.keyword_id
WHERE keyword LIKE "%flower%";

/* 3.
 list all artists from the artist table but only the related artwork
 from the artwork table. We need the first and last name and artwork title */

SELECT fname, lname, title
FROM artist LEFT JOIN artwork	
	ON artist.artist_id = artwork.artist_id;

USE magazine; 

/* 4. 
 list all subscriptions ordered with magazine name, 
 last and first name and sort alphabetically by magazine name */

SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine JOIN subscription
	ON magazine.magazineKey = subscription.magazineKey
    JOIN subscriber
    ON subscriber.subscriberKey = subscription.subscriberKey
ORDER BY magazineName;

/* 5.
 list all magazine names that Samantha Sanders subscribes to */

SELECT magazineName
FROM magazine JOIN subscription	
	ON magazine.magazineKey = subscription.magazineKey
    JOIN subscriber
    ON subscription.subscriberKey = subscriber.subscriberKey
WHERE subscriberLastName = "Sanders" AND subscriberFirstName = "Samantha";

USE employees;

SELECT * FROM employees.salaries;

-- 6. a list of all employees in the Customer Service department

SELECT first_name, last_name
FROM employees e JOIN dept_emp de
	ON e.emp_no = de.emp_no
    JOIN departments d
    ON de.dept_no = d.dept_no
WHERE dept_name = "Customer Service"
ORDER BY last_name
LIMIT 5;

-- 7. find out the current salary and department of Berni Genin. You can use ORDER BY and LIMIT to get just the most recent salary.

SELECT first_name, last_name, dept_name, salary, s.from_date
FROM departments d JOIN dept_emp de
	ON d.dept_no = de.dept_no
    JOIN employees e
    ON de.emp_no = e.emp_no
    JOIN salaries s
    ON e.emp_no = s.emp_no
WHERE first_name = "Berni" AND last_name = "Genin"
ORDER BY from_date DESC
LIMIT 1;