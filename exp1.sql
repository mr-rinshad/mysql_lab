#A
CREATE DATABASE college;

USE college;

CREATE TABLE student(
     roll_no INT,
     name VARCHAR(50),
     dob DATE,
     address TEXT,
     phone_no VARCHAR(10),
     blood_grp VARCHAR(5)
     );

CREATE TABLE course(
     course_id INT,
     cource_name VARCHAR(50),
     cource_duration INT
     );

SHOW TABLES;

DESCRIBE student;

ALTER TABLE student
DROP COLUMN blood_grp;

ALTER TABLE student
ADD adhar_no BIGINT;

ALTER TABLE student
MODIFY phone_no INT;

DROP TABLE student;

DROP TABLE course;

DROP DATABASE college;

#B
CREATE DATABASE organization;

USE  organization;

CREATE TABLE employee(emp_no VARCHAR(10),
	emp_name VARCHAR(50),
	dob DATE, address TEXT ,
       	mobile_no INT,
	dep_no VARCHAR(10),
	salary INT
       );

CREATE TABLE department(dept_no VARCHAR(10),
	dept_name VARCHAR(50),
	location VARCHAR(50) 
        );

SHOW TABLES;

DESCRIBE employee;

DESCRIBE department;

ALTER TABLE employee
ADD designation VARCHAR(30);

ALTER TABLE department
DROP COLUMN location;



