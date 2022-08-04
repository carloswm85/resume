USE datawinter;
 
SELECT * FROM student;

SELECT lname, fname, major
FROM student
WHERE major = 'CIT'
ORDER BY lname;

SELECT lname, fname, dist_category
FROM student
WHERE dist_category = 'internet';

SELECT lname, fname, worry_category
FROM student
WHERE worry_category = 'family';

