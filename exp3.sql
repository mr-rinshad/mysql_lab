#1
INSERT INTO department (dept_no, dept_name) VALUES
     ('D01', 'Human Resources'),
     ('D02', 'Finance'),
     ('D03', 'IT'),
     ('D04', 'Marketing'),
     ('D05', 'Sales'),
     ('D06', 'Operations'),
     ('D07', 'Customer Support'),
     ('D08', 'Research'),
     ('D09', 'Administration'),
     ('D10', 'Training');

INSERT INTO employee (emp_no, emp_name, mobile_no, salary, dept_no, designation) VALUES
('E001', 'Rinshad', 987650001, 30000, 'D01', 'Manager'),
('E002', 'Mishal',  987650002, 32000, 'D01', 'Assistant Manager'),
('E003', 'Fidha',   987650003, 28000, 'D02', 'Accountant'),
('E004', 'Mizba',   987650004, 35000, 'D02', 'Senior Accountant'),
('E005', 'Rishin',  987650005, 40000, 'D03', 'Software Engineer'),
('E006', 'Jasna',   987650006, 36000, 'D01', 'HR Executive'),
('E007', 'Nidha',   987650007, 29000, 'D03', 'System Analyst'),
('E008', 'Sadha',   987650008, 31000, 'D02', 'Finance Executive'),
('E009', 'Anjum',   987650009, 33000, 'D01', 'Admin Officer'),
('E010', 'Ameena',  987650010, 45000, 'D03', 'Team Lead');


#2

SELECT * FROM employee;
SELECT * FROM department;

#3
SELECT emp_no, emp_name
     FROM employee
     WHERE dept_no = 'D02';

#4
SELECT emp_no, emp_name, designation, dept_no, salary
     FROM employee
     ORDER BY salary DESC;
#5
SELECT emp_no, emp_name
     FROM employee
     WHERE salary BETWEEN 2000 AND 5000;
#6
SELECT DISTINCT designation
FROM employee;

#7
UPDATE employee
SET salary = 45000
WHERE designation = 'Manager';

#8
UPDATE employee
SET mobile_no = 987650111
WHERE emp_name = 'Rinshad';

#9
DELETE FROM employee
WHERE salary = 2500;

#10
SELECT emp_name, mobile_no
FROM employee
WHERE emp_name LIKE 'A%';

#11
SELECT *
FROM employee
WHERE LENGTH(emp_name) >= 3
  AND salary > 30000;

#12
SELECT *
FROM employee
WHERE emp_no IN ('E001', 'E002', 'E006');

#13
SELECT emp_no, emp_name
FROM employee
WHERE salary BETWEEN 20000 AND 30000;

#14
SELECT *
FROM employee
WHERE designation = 'Manager'
   OR designation = 'Team Lead';

#15
SELECT dept_no, COUNT(*) AS total_employees
FROM employee
GROUP BY dept_no;

#16
SELECT dept_no, AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_no;

#17
SELECT dept_no, SUM(salary) AS total_salary
FROM employee
GROUP BY dept_no;

#18
SELECT dept_no,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employee
GROUP BY dept_no;

#19
SELECT dept_no, AVG(salary)
FROM employee
WHERE dept_no != 'D01'
GROUP BY dept_no;

#20
SELECT dept_no, AVG(salary) AS avg_salary
FROM employee
WHERE dept_no != 'D03'
GROUP BY dept_no
HAVING AVG(salary) > 20000
ORDER BY avg_salary ASC;

