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

# MAKING QUESTIONS to the DB
-- What is the biggest distraction?
SELECT dist_category,  COUNT(*)
FROM student
GROUP BY dist_category
ORDER BY count(*) DESC;

-- What is the biggest worry?
SELECT worry_category,  COUNT(*)
FROM student
GROUP BY worry_category
ORDER BY count(*) DESC;

-- Which group in section 1 had the most selfies?
SELECT group_name, COUNT(type)
FROM student_group JOIN student
	ON student_group.group_id = student.group_id
    JOIN image
    ON student.student_id = image.student_id
WHERE student_group.location LIKE "%1" AND type="selfie"
GROUP BY group_name
ORDER BY COUNT(type) DESC;