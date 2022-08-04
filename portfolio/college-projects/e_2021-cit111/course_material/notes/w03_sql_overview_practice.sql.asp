SELECT * FROM student;

SELECT lname, fname, major
FROM student
WHERE major = "CIT" and group_id = 2;

SELECT lname, fname
FROM student
WHERE dist_category = "social media";

-- notice how even though someone had wife as a worry, they didn't show up because
-- VARCHAR allowed for any characters. The string 'wife' doesn't equal the string 'family'
SELECT lname, fname
FROM student
WHERE worry_category = "family";

-- Top distraction category
SELECT dist_category, COUNT(*)
FROM student
GROUP BY dist_category
ORDER BY COUNT(*) DESC;

-- Top worry category
SELECT worry_category, COUNT(*)
FROM student
GROUP BY worry_category
ORDER BY COUNT(*) DESC;

-- Which group had the most selfies? (I had 2 classes so as I entered data I put a 1 or 2 at the end of location)
SELECT group_name, COUNT(type)
FROM student_group JOIN student
  ON student_group.group_id = student.group_id
  JOIN image
  ON student.student_id = image.student_id
WHERE student_group.location LIKE "%2" AND type="selfie"
GROUP BY group_name
ORDER BY COUNT(type) DESC;

-- Which major had the most documentation type images
SELECT major, COUNT(type)
FROM student
  JOIN image
  ON student.student_id = image.student_id
WHERE type="documentation"
GROUP BY major
ORDER BY COUNT(type) DESC;