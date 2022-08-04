USE art_gallery;

SELECT * FROM artwork;

SELECT title, period
FROM artwork
ORDER BY title
LIMIT 3;

SELECT DISTINCT period 
FROM artwork;

SELECT title 
FROM artwork
WHERE artist_id = 3; 

SELECT title
FROM artwork
WHERE title < 'I'     -- try < 'J' to get I's

SELECT title, artyear
FROM artwork
WHERE artyear > 1800 AND artyear < 1900;
-- OR
SELECT title, artyear
FROM artwork
WHERE artyear BETWEEN 1800 AND 1900;

SELECT title 
FROM artwork
WHERE period IN('Modern', 'Baroque');

SELECT title, period
FROM artwork
WHERE period LIKE '%impr%';
-- OR
SELECT title, period
FROM artwork
WHERE period REGEXP 'impr';

SELECT title, period
FROM artwork
WHERE period REGEXP '^Post';

SELECT title, period
FROM artwork
WHERE period REGEXP 'ism$';

SELECT title 
FROM artwork
WHERE title REGEXP '^Old';

SELECT title
FROM artwork
WHERE title REGEXP 'the|in|on';

SELECT fname AS First, mname AS Middle, lname AS Last
FROM artist
WHERE mname IS NOT NULL
ORDER BY Middle; 
-- can't use Middle for WHERE

