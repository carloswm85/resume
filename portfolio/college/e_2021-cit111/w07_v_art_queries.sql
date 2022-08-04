USE v_art;

SELECT * FROM artwork;

SELECT title, period
FROM artwork
ORDER BY title DESC
LIMIT 5;

SELECT title, period
FROM artwork
WHERE artist_id = 3;

SELECT title, period, artyear
FROM artwork
WHERE artyear > 1800;

SELECT title, period
FROM artwork
WHERE title > 'J' -- Values, from J and on
ORDER BY title;

SELECT title, period, artyear
FROM artwork
WHERE artyear > 1800 AND artyear < 1900;

SELECT title, period
FROM artwork
WHERE period IN ('Modern', 'Baroque'); -- Where perior equals that in parehthesis

-- LIKE, and REGEX, work with strings
SELECT title, period
FROM artwork
WHERE period LIKE "%impression%"; -- Anything that is close to that.

SELECT title, period
FROM artwork
WHERE period LIKE '_ode_n'; -- With any of those missing letters.

SELECT title, period
FROM artwork
WHERE period REGEXP 'impression'; -- The same with REGEX

SELECT title, period
FROM artwork
WHERE period REGEXP '^Post'; -- STARTS with Post

SELECT title, period
FROM artwork
WHERE period REGEXP 'ism$'; -- ENDS in ism

SELECT title, period
FROM artwork
WHERE title REGEXP 'the|in|on'; -- With those somewhere in the title.

-- ALIASES
SELECT * from artist;

SELECT fname, mname, lname
FROM artist;

SELECT fname AS 'First', mname AS Middle, lname AS Last
FROM artist;

SELECT fname AS 'First', mname AS Middle, lname AS Last
FROM artist
ORDER BY Middle; -- Here's using the alias for ordering

SELECT fname AS 'First', mname AS Middle, lname AS Last
FROM artist
WHERE mname IS NOT NULL -- It does not work with aliases → Why? Because of the order in which the code is actually executed (read note below);
ORDER BY Middle;

/*
This is the order of how you must write the code.
	SELECT
	FROM
	WHERE
	ORDER BY
	LIMIT
But the order in which the system actually executes the clauses is different. This is referred to as the Order of Execution.
	FROM
	WHERE
	SELECT 
	ORDER BY
	LIMIT
The latter is the reason why ALIASES can't be used with WHERE.
Aliases are created in SELECT.
https://youtu.be/lHLGrahhrRU?t=1283
*/


