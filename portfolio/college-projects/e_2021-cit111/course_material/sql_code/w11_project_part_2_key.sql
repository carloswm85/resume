-- 1) Students, and their birthdays, of students born in September.
-- Format the date to look like it is shown in the result set
-- Sorted by student last name

SELECT fname, lname, DATE_FORMAT(dob, '%M %d, %Y') AS 'Sept Birthdays'
FROM student
WHERE MONTH(DOB) = 9
ORDER BY lname;

-- 2) All students' ages in years and days as of Jan. 5, 2017
-- Sorted from oldest to youngest. 
-- Hint use modulus for days left over after after years.

SELECT lname, fname
, FLOOR(datediff('2017-01-05', dob)/365) AS Years
, MOD(datediff('2017-01-05', dob), 365) AS Days
, CONCAT(FLOOR(datediff('2017-01-05', dob)/365), ' - Yrs,  ', MOD(datediff('2017-01-05', DOB), 365), ' - Days') AS 'Years and Days'
FROM student
Order By datediff('2017-01-05', dob) DESC;

-- 3) Students taught by John Jensen
-- Sorted by students last name

SELECT s.fname, s.lname
FROM student s
 JOIN enrollment e
 ON s.student_id = e.student_id
 JOIN section se
 ON e.section_id = se.section_id
 JOIN faculty f
 ON se.faculty_id = f.faculty_id
WHERE f.lname = 'Jensen' and f.fname = 'John'
ORDER BY s.lname;

-- 4) Instructors Bryce will have in Winter 2018.
-- Sort by faculty's last name

SELECT f.fname, f.lname
FROM faculty f
   JOIN section s
      ON f.faculty_id = s.faculty_id
   JOIN term t
      ON s.term_id = t.term_id
   JOIN enrollment e
      ON e.section_id = s.section_id
   JOIN student st
      ON e.student_id = st.student_id
WHERE st.fname = 'Bryce'
   AND t.year = 2018
   AND t.term = 'Winter'
ORDER BY f.lname;


-- 5) Students that take Econometrics in Fall 2019.
-- Order by student last name

SELECT st.fname, st.lname
FROM section s
   JOIN term t
      ON s.term_id = t.term_id
   JOIN enrollment e
      ON e.section_id = s.section_id
   JOIN student st
      ON e.student_id = st.student_id
   JOIN course c
      ON s.course_id = c.course_id
WHERE c.name = 'Econometrics'
   AND t.year = 2019
   AND t.term = 'Fall'
ORDER BY st.lname;

-- 6) Bryce Carlson's courses for Winter 2018.
-- Sort by the name of the course

SELECT c.department_code, c.course_num, c.name
FROM term t
	JOIN section s
	  ON t.term_id = s.term_id
	JOIN course c
	  ON s.course_id = c.course_id
	JOIN enrollment e
	  ON s.section_id = e.section_id
	JOIN student st
	  ON e.student_id = st.student_id
WHERE st.lname = 'Carlson' AND term = 'Winter' AND year = 2018
ORDER BY c.name;

-- 7) The number of students enrolled for Fall 2019

SELECT term, year, COUNT(s.section_id) AS "Enrollment"
FROM term t
	JOIN section s
    ON t.term_id = s.term_id
    JOIN enrollment e
    ON s.section_id = e.section_id
WHERE term = 'Fall' AND year = 2019;


-- 8) The number of courses in each college. 
-- Order by college alphabetically

SELECT c.name as Colleges, COUNT(course_num) As 'Number of Courses'
FROM college c
  JOIN department d
  ON c.college_id = d.college_id
  JOIN course co
  ON d.department_code = co.department_code
GROUP BY c.name
ORDER BY Colleges;

-- 9) The total number of students each professor can teach in Winter 2018. 
-- Order by that total number of students (teaching capacity)

SELECT f.fname, f.lname, SUM(capacity) AS TeachingCapacity
FROM faculty f
   JOIN section s
      ON f.faculty_id = s.faculty_id
   JOIN term t
      ON s.term_id = t.term_id
WHERE term = 'Winter' AND year = 2018
GROUP BY f.lname, f.fname
ORDER BY TeachingCapacity;


-- 10) Each student's total credit load for Fall 2019 but only students with
-- a credit load greater than three.  Sort by credit load in descending order.

SELECT st.lname, st.fname, SUM(c.credit) AS Credits
FROM Section s
   JOIN term t
      ON s.term_id = t.term_id
   JOIN enrollment e
      ON e.section_id = s.section_id
   JOIN student st
      ON e.student_id = st.student_id
   JOIN course c
      ON s.course_id = c.course_id
WHERE term = 'Fall' AND year = 2019
GROUP BY st.lname, st.fname
HAVING Credits > 3
ORDER BY credits DESC;