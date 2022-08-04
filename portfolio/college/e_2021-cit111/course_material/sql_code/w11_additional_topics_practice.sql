#1. Use a subquery that returns the faculty_id of those who teach for the college of Physical Science and Engineering.  
#Use the results of the subquery in a WHERE clause with an IN that uses the subquery results as the list of conditions to compare. 
#The main query will find the course(s) name(s) that are taught by those faculty.
USE univ;

SELECT DISTINCT c.name
FROM course c JOIN department d
	ON c.department_code = d.department_code
  JOIN faculty f
  ON d.department_code = f.department_code
WHERE faculty_id IN (SELECT faculty_id
		FROM faculty 
              	JOIN department
		ON faculty.department_code = department.department_code
		JOIN college
		ON department.college_id = college.college_id
		WHERE college.name = "Physical Science and Engineering");
                         
#2. Create an index on course name. 
#It will be referenced a lot so we'd like to create an index for faster retrieval from that column.

CREATE INDEX num_2 ON course(name);

#3. We always want a list of students we have enrolled in the CIT department. 
#Create a view called cit_enrollment that contains this information.

CREATE VIEW cit_enrollment AS
SELECT fname, lname
FROM student st JOIN enrollment en
    ON st.student_id = en.student_id
    JOIN section sec
    ON en.section_id = sec.section_id
    JOIN course cr
    ON cr.course_num = sec.course_num
    JOIN department dep
    ON cr.department_code = dep.department_code
WHERE dep.department_code = "CIT";

#4. Using the cit_enrollment view find out how many students 
#there are enrolled in the CIT department.

SELECT COUNT(*) FROM cit_enrollment;