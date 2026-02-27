
mysql> create database company;
Query OK, 1 row affected (0.00 sec)

mysql> use company;
Database changed
mysql> create table regions(
    -> region_id int primary key
    -> ,region_name varchar(50) not null);
Query OK, 0 rows affected (0.02 sec)

mysql> create table countries(
    -> country_id varchar(5) primary key,
    -> country_name varchar(50) not null ,
    -> region_id int , foreign key (region_id)references regions(region_id));
Query OK, 0 rows affected (0.02 sec)

mysql> create table locations(
    -> location_id int primary key,
    -> street_address varchar (100),
    -> postal_code varchar(20),
    -> state_province varchar(50),
    -> country_id varchar(50),foreign key(country_id)references countries(country_id));
Query OK, 0 rows affected (0.02 sec)

mysql> create table department(
    -> dept_id int primary key,
    -> dept_name varchar(50),
    -> location_id int , foreign key(location_id)references locations(location_id));
Query OK, 0 rows affected (0.01 sec)


mysql> create table jobs( job_id varchar(10) primary key, job_title varchar(50), min_salary decimal (10,2), max_salary decimal (10,2) );
Query OK, 0 rows affected (0.01 sec)

mysql> create table employees(
    -> employee_id int primary key,
    -> first_name varchar(50),
    -> last_name varchar(50),
    -> email varchar(100),
    -> phone_no varchar(20),
    -> hire_date date,
    -> job_id varchar(10),
    -> salary decimal(10,2),
    -> manager_id int,
    -> dept_id int,
    -> foreign key(job_id)references jobs(job_id),
    -> foreign key(manager_id)references employees(employee_id),
    -> foreign key(dept_id)references department(dept_id));
Query OK, 0 rows affected (0.02 sec)


mysql> create table dependents( dependent_id int primary key, first_name varchar(50), last_name varchar(50), relationship varchar(50), employee_id int ,foreign key(employee_id)references employees(employee_id));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into regions values(1,'Asia'),
    -> (2,'Europe');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0


mysql> insert into countries values('IN','India',1), ('UK','United Kindom',2);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0


mysql> describe locations;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| location_id    | int(11)      | NO   | PRI | NULL    |       |
| street_address | varchar(100) | YES  |     | NULL    |       |
| postal_code    | varchar(20)  | YES  |     | NULL    |       |
| state_province | varchar(50)  | YES  |     | NULL    |       |
| country_id     | varchar(50)  | YES  | MUL | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)


mysql> alter table locations add column city varchar(50);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe locations;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| location_id    | int(11)      | NO   | PRI | NULL    |       |
| street_address | varchar(100) | YES  |     | NULL    |       |
| postal_code    | varchar(20)  | YES  |     | NULL    |       |
| state_province | varchar(50)  | YES  |     | NULL    |       |
| country_id     | varchar(50)  | YES  | MUL | NULL    |       |
| city           | varchar(50)  | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)


mysql> insert into locations values(1700,'Mg Road','5600061','Karnataka','IN','banglore'), (1800,'Oxford','w1','London','UK','London');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> describe locations;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| location_id    | int(11)      | NO   | PRI | NULL    |       |
| street_address | varchar(100) | YES  |     | NULL    |       |
| postal_code    | varchar(20)  | YES  |     | NULL    |       |
| state_province | varchar(50)  | YES  |     | NULL    |       |
| country_id     | varchar(50)  | YES  | MUL | NULL    |       |
| city           | varchar(50)  | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)


mysql> insert into department values(
    -> 1,'IT',1700),
    -> (2,'HR',1700),
    -> (3,'Finance',1800),
    -> (4,'Marketing',1800);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0


mysql> insert into jobs values ('IT_PROG','programmer',5000,20000),  ('HR_REP','HR Representive',4000,15000),  ('FIN_ACC','Accountant',6000,18000),  ('MRT_MAN','Marketing',8000,25000);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

1
mysql> insert into employees values (101,'Rahul','sharma','rahul@gmail.com','999991','2022-01-10','IT_PROG','15000',NULL,1), (102,'Aisha','Khan','aisha@gmail.com','999992','2021-01-12','HR_REP','9000','101',2), (103,'John','smith','johnsmith@gmail.com','999993','2020-03-15','FIN_ACC','12000','101',3), (104,'Priya','nair','priya@gmail.com','999994','2023-04-18','IT_PROG','7000','101',1), (105,'david','brown','david@gmail.com','999995','2022-05-20','MRT_MAN','22000','103',4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into dependents values
    -> (1,'Anu','sharma','Daughter',101),
    -> (2,'sara','khan','wife',102);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select first_name ,last_name from employees join department using (dept_id) where location_id=1700;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Rahul      | sharma    |
| Priya      | nair      |
| Aisha      | Khan      |
+------------+-----------+
3 rows in set (0.00 sec)

mysql> select first_name ,last_name from employees join department using (dept_id) where location_id<>1700;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| John       | smith     |
| david      | brown     |
+------------+-----------+
2 rows in set (0.00 sec)

mysql> select *from employees
    -> where salary=(select MAX(salary) from employees);
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
| employee_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | manager_id | dept_id |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
|         105 | david      | brown     | david@gmail.com | 999995   | 2022-05-20 | MRT_MAN | 22000.00 |        103 |       4 |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
1 row in set (0.00 sec)




mysql> show tables
    -> ;
+-------------------+
| Tables_in_company |
+-------------------+
| countries         |
| department        |
| dependents        |
| employees         |
| jobs              |
| locations         |
| regions           |
+-------------------+
7 rows in set (0.00 sec)

mysql> select first_name,last_name from employees join department using(dept_id) where location_id =1700;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Rahul      | sharma    |
| Priya      | nair      |
| Aisha      | Khan      |
+------------+-----------+
3 rows in set (0.01 sec)

mysql> select first_name,last_name from employees join department using(dept_id) where location_id <>1700;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| John       | smith     |
| david      | brown     |
+------------+-----------+
2 rows in set (0.00 sec)

mysql> select * from employees where salary=(select MAX(salary)from employees);
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
| employee_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | manager_id | dept_id |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
|         105 | david      | brown     | david@gmail.com | 999995   | 2022-05-20 | MRT_MAN | 22000.00 |        103 |       4 |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
1 row in set (0.01 sec)

mysql> select * from employees where salary>(select AVG(salary)from employees);
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
| employee_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | manager_id | dept_id |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
|         101 | Rahul      | sharma    | rahul@gmail.com | 999991   | 2022-01-10 | IT_PROG | 15000.00 |       NULL |       1 |
|         105 | david      | brown     | david@gmail.com | 999995   | 2022-05-20 | MRT_MAN | 22000.00 |        103 |       4 |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
2 rows in set (0.00 sec)

mysql> select distinct dept_id,dept_name from department join employees using(dept_id) where salary > 1000;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | IT        |
|       2 | HR        |
|       3 | Finance   |
|       4 | Marketing |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> select dept_id,dept_name from department where dept_id NOT IN (select dept_id from employees where salary>100);
Empty set (0.00 sec)

mysql> select dept_id,dept_name from department where dept_id NOT IN (select dept_id from employees where salary>1000);
Empty set (0.00 sec)

mysql> select * from employees where salary>ALL(select MIN(salary) from employees group by dept_id);
Empty set (0.00 sec)

mysql> select * from employees where salary>=ALL(select MIN(salary) from employees group by dept_id);
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
| employee_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | manager_id | dept_id |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
|         105 | david      | brown     | david@gmail.com | 999995   | 2022-05-20 | MRT_MAN | 22000.00 |        103 |       4 |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
1 row in set (0.00 sec)

mysql> select AVG (avg_salary) from (select AVG(salary) AS avg_salary from employees group by dept_id) AS dept_avg;
+------------------+
| AVG (avg_salary) |
+------------------+
| 13500.0000000000 |
+------------------+
1 row in set (0.00 sec)


mysql> select first_name,salary,(select AVG (salary)from employees) AS avg_salary,salary -(select AVG(salary)from employees) AS different from employees;
+------------+----------+--------------+--------------+
| first_name | salary   | avg_salary   | different    |
+------------+----------+--------------+--------------+
| Rahul      | 15000.00 | 13000.000000 |  2000.000000 |
| Aisha      |  9000.00 | 13000.000000 | -4000.000000 |
| John       | 12000.00 | 13000.000000 | -1000.000000 |
| Priya      |  7000.00 | 13000.000000 | -6000.000000 |
| david      | 22000.00 | 13000.000000 |  9000.000000 |
+------------+----------+--------------+--------------+
5 rows in set (0.01 sec)

mysql> select * from employees e where salary>(select AVG(salary) from employees where dept_id=e.dept_id);
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
| employee_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | manager_id | dept_id |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
|         101 | Rahul      | sharma    | rahul@gmail.com | 999991   | 2022-01-10 | IT_PROG | 15000.00 |       NULL |       1 |
+-------------+------------+-----------+-----------------+----------+------------+---------+----------+------------+---------+
1 row in set (0.00 sec)


mysql> describe dependents;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| dependent_id | int(11)     | NO   | PRI | NULL    |       |
| first_name   | varchar(50) | YES  |     | NULL    |       |
| last_name    | varchar(50) | YES  |     | NULL    |       |
| relationship | varchar(50) | YES  |     | NULL    |       |
| employee_id  | int(11)     | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select * from employees e where not exists(select * from dependents d where d.employee_id = e.employee_id);
+-------------+------------+-----------+---------------------+----------+------------+---------+----------+------------+---------+
| employee_id | first_name | last_name | email               | phone_no | hire_date  | job_id  | salary   | manager_id | dept_id |
+-------------+------------+-----------+---------------------+----------+------------+---------+----------+------------+---------+
|         103 | John       | smith     | johnsmith@gmail.com | 999993   | 2020-03-15 | FIN_ACC | 12000.00 |        101 |       3 |
|         104 | Priya      | nair      | priya@gmail.com     | 999994   | 2023-04-18 | IT_PROG |  7000.00 |        101 |       1 |
|         105 | david      | brown     | david@gmail.com     | 999995   | 2022-05-20 | MRT_MAN | 22000.00 |        103 |       4 |
+-------------+------------+-----------+---------------------+----------+------------+---------+----------+------------+---------+
3 rows in set (0.00 sec)

mysql> select e.first_name,e.last_name,d.dept_name from employees e join department d on e.dept_id=d.dept_id where e.dept_id in (1,2,3);
+------------+-----------+-----------+
| first_name | last_name | dept_name |
+------------+-----------+-----------+
| Rahul      | sharma    | IT        |
| Aisha      | Khan      | HR        |
| John       | smith     | Finance   |
| Priya      | nair      | IT        |
+------------+-----------+-----------+
4 rows in set (0.00 sec)

mysql> select e.first_name,e.last_name,j.job_title,d.dept_name from employees e join jobs j on e.job_id=j.job_id join department d on e.dept_id=d.dept_id where e.dept_id in (1,2,3) AND e.salary>10000;
+------------+-----------+------------+-----------+
| first_name | last_name | job_title  | dept_name |
+------------+-----------+------------+-----------+
| Rahul      | sharma    | programmer | IT        |
| John       | smith     | Accountant | Finance   |
+------------+-----------+------------+-----------+
2 rows in set (0.00 sec)

mysql> select d.dept_name,
    -> l.street_address,l.postal_code,
    -> c.country_name,
    -> r.region_name
    -> from department d
    -> join locations l
    -> on d.location_id=l.location_id
    -> join countries c
    -> on l.country_id=c.country_id
    -> join regions r
    -> on c.region_id=r.region_id;
+-----------+----------------+-------------+---------------+-------------+
| dept_name | street_address | postal_code | country_name  | region_name |
+-----------+----------------+-------------+---------------+-------------+
| IT        | Mg Road        | 5600061     | India         | Asia        |
| HR        | Mg Road        | 5600061     | India         | Asia        |
| Finance   | Oxford         | w1          | United Kindom | Europe      |
| Marketing | Oxford         | w1          | United Kindom | Europe      |
+-----------+----------------+-------------+---------------+-------------+
4 rows in set (0.00 sec)

mysql> show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| countries         |
| departments       |
| dependants        |
| employees         |
| jobs              |
| locations         |
| regions           |
+-------------------+


mysql> select e.first_name,e.last_name,e.dept_id,d.dept_name from employees e left join departments d on e.dept_id=d.dept_id;
+------------+-----------+---------+-----------+
| first_name | last_name | dept_id | dept_name |
+------------+-----------+---------+-----------+
| rahul      | sharma    |       1 | IT        |
| aisha      | khan      |       2 | HR        |
| john       | smith     |       3 | finance   |
| priya      | nair      |       1 | IT        |
| david      | brown     |       4 | marketing |
+------------+-----------+---------+-----------+



mysql> select e.first_name,e.last_name,d.dept_name,l.city,l.state_province from employees e join departments d on e.dept_id =d.dept_id join locations l  on d.location_id =l.location_id where e.first_name like '%z';
Empty set (0.00 sec)


mysql> select e.first_name,e.last_name,d.dept_id,d.dept_name from departments d  left join employees e on d.dept_id =e.dept_id;
+------------+-----------+---------+-----------+
| first_name | last_name | dept_id | dept_name |
+------------+-----------+---------+-----------+
| rahul      | sharma    |       1 | IT        |
| priya      | nair      |       1 | IT        |
| aisha      | khan      |       2 | HR        |
| john       | smith     |       3 | finance   |
| david      | brown     |       4 | marketing |
+------------+-----------+---------+-----------+



mysql> select e.first_name AS emp_name, m.first_name AS manger_name from employees e left join employees m on e.manager_id=m.emp_id;
+----------+-------------+
| emp_name | manger_name |
+----------+-------------+
| rahul    | NULL        |
| aisha    | rahul       |
| john     | rahul       |
| priya    | rahul       |
| david    | john        |
+----------+-------------+




mysql> select first_name , last_name,dept_id from employees where dept_id= (  select dept_id    from employees    where last_name="brown" );
+------------+-----------+---------+
| first_name | last_name | dept_id |
+------------+-----------+---------+
| david      | brown     |       4 |
+------------+-----------+---------+


mysql> select j.job_title,e.first_name,(j.max_salary-e.salary)AS differnce from employees e join jobs j  on e.job_id=j.job_id;
+---------------+------------+-----------+
| job_title     | first_name | differnce |
+---------------+------------+-----------+
| accountant    | john       |   6000.00 |
| HR repesntive | aisha      |   6000.00 |
| programmer    | rahul      |   5000.00 |
| programmer    | priya      |  13000.00 |
| marketing     | david      |   3000.00 |
+---------------+------------+-----------+



mysql> ALTER TABLE employees
    -> ADD commission DECIMAL(10,2)  AFTER salary;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> describe employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_id     | int           | NO   | PRI | NULL    |       |
| first_name | varchar(50)   | YES  |     | NULL    |       |
| last_name  | varchar(50)   | YES  |     | NULL    |       |
| email      | varchar(100)  | YES  |     | NULL    |       |
| phone_no   | varchar(20)   | YES  |     | NULL    |       |
| hire_date  | date          | YES  |     | NULL    |       |
| job_id     | varchar(10)   | YES  | MUL | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
| commission | decimal(10,2) | YES  |     | NULL    |       |
| manager_id | int           | YES  | MUL | NULL    |       |
| dept_id    | int           | YES  | MUL | NULL    |       |
+------------+---------------+------+-----+---------+-------+

mysql> UPDATE employees SET commission = 1800 WHERE emp_id = 101;
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE employees SET commission = 1000 WHERE emp_id = 102;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employees SET commission = 1500 WHERE emp_id = 103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employees SET commission = 800  WHERE emp_id = 104;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employees SET commission = 3000 WHERE emp_id = 105;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0



mysql> select *from employees;
+--------+------------+-----------+-----------------+----------+------------+---------+----------+------------+------------+---------+
| emp_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | commission | manager_id | dept_id |
+--------+------------+-----------+-----------------+----------+------------+---------+----------+------------+------------+---------+
|    101 | rahul      | sharma    | rahul@gmail.com | 999991   | 2022-01-10 | IT_PROG | 15000.00 |    1800.00 |       NULL |       1 |
|    102 | aisha      | khan      | aisha@gmail.com | 999992   | 2022-01-11 | HR_REP  |  9000.00 |    1000.00 |        101 |       2 |
|    103 | john       | smith     | john@gmail.com  | 999993   | 2022-01-12 | FIN_ACC | 12000.00 |    1500.00 |        101 |       3 |
|    104 | priya      | nair      | priya@gmail.com | 999994   | 2022-01-13 | IT_PROG |  7000.00 |     800.00 |        101 |       1 |
|    105 | david      | brown     | david@gmail.com | 999995   | 2022-01-14 | MRT_MAN | 22000.00 |    3000.00 |        103 |       4 |
+--------+------------+-----------+-----------------+----------+------------+---------+----------+------------+------------+---------+
5 rows in set (0.00 sec)

mysql> select d.dept_name,
    -> AVG(e.salary)AS avg_salary,
    -> count(e.commission)AS commission_count
    -> from departments d
    -> left join employees e
    -> on d.dept_id = e.dept_id
    -> GROUP BY d.dept_name;
+-----------+--------------+------------------+
| dept_name | avg_salary   | commission_count |
+-----------+--------------+------------------+
| IT        | 11000.000000 |                2 |
| HR        |  9000.000000 |                1 |
| finance   | 12000.000000 |                1 |
| marketing | 22000.000000 |                1 |
+-----------+--------------+------------------+
4 rows in set (0.01 sec)


mysql> create view banglore_emp AS select e.emp_id,e.first_name,e.phone_no,j.job_title,d.dept_name,m.first_name AS manager_name from employees e
    -> join jobs j on e.job_id=j.job_id
    -> join departments d on e.dept_id=d.dept_id
    -> join locations l on d.location_id=l.location_id
    -> left join employees m on 
    -> e.manager_id=m.emp_id
    -> where l.city='bangalore';
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM banglore_emp;
+--------+------------+----------+---------------+-----------+--------------+
| emp_id | first_name | phone_no | job_title     | dept_name | manager_name |
+--------+------------+----------+---------------+-----------+--------------+
|    101 | rahul      | 999991   | programmer    | IT        | NULL         |
|    102 | aisha      | 999992   | HR repesntive | HR        | rahul        |
|    104 | priya      | 999994   | programmer    | IT        | rahul        |
+--------+------------+----------+---------------+-----------+--------------+

mysql> select first_name from banglore_emp
    -> where job_title='programmer'
    -> and dept_name ='IT';
+------------+
| first_name |
+------------+
| rahul      |
| priya      |
+------------+


mysql> UPDATE employees
    -> SET phone_no = '8590515247'
    -> WHERE first_name = 'aisha';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM banglore_emp;
+--------+------------+------------+---------------+-----------+--------------+
| emp_id | first_name | phone_no   | job_title     | dept_name | manager_name |
+--------+------------+------------+---------------+-----------+--------------+
|    101 | rahul      | 999991     | programmer    | IT        | NULL         |
|    104 | priya      | 999994     | programmer    | IT        | rahul        |
|    102 | aisha      | 8590515247 | HR repesntive | HR        | rahul        |
+--------+------------+------------+---------------+-----------+--------------+
3 rows in set (0.00 sec)


mysql> select * from employees e where not exists ( select * from dependants d   where d.emp_id=e.emp_id);
+--------+------------+-----------+-----------------+----------+------------+---------+----------+------------+------------+---------+
| emp_id | first_name | last_name | email           | phone_no | hire_date  | job_id  | salary   | commission | manager_id | dept_id |
+--------+------------+-----------+-----------------+----------+------------+---------+----------+------------+------------+---------+
|    103 | john       | smith     | john@gmail.com  | 999993   | 2022-01-12 | FIN_ACC | 12000.00 |    1500.00 |        101 |       3 |
|    104 | priya      | nair      | priya@gmail.com | 999994   | 2022-01-13 | IT_PROG |  7000.00 |     800.00 |        101 |       1 |
|    105 | david      | brown     | david@gmail.com | 999995   | 2022-01-14 | MRT_MAN | 22000.00 |    3000.00 |        103 |       4 |
+--------+------------+-----------+-----------------+----------+------------+---------+----------+------------+------------+---------+
3 rows in set (0.00 sec)



mysql> select * from employees where manager_id=101 UNION select * from employees where manager_id=103;
+--------+------------+-----------+-----------------+------------+------------+---------+----------+------------+------------+---------+
| emp_id | first_name | last_name | email           | phone_no   | hire_date  | job_id  | salary   | commission | manager_id | dept_id |
+--------+------------+-----------+-----------------+------------+------------+---------+----------+------------+------------+---------+
|    102 | aisha      | khan      | aisha@gmail.com | 8590515247 | 2022-01-11 | HR_REP  |  9000.00 |    1000.00 |        101 |       2 |
|    103 | john       | smith     | john@gmail.com  | 999993     | 2022-01-12 | FIN_ACC | 12000.00 |    1500.00 |        101 |       3 |
|    104 | priya      | nair      | priya@gmail.com | 999994     | 2022-01-13 | IT_PROG |  7000.00 |     800.00 |        101 |       1 |
|    105 | david      | brown     | david@gmail.com | 999995     | 2022-01-14 | MRT_MAN | 22000.00 |    3000.00 |        103 |       4 |
+--------+------------+-----------+-----------------+------------+------------+---------+----------+------------+------------+---------+
4 rows in set (0.01 sec)


mysql> select * from employees e where exists ( select * from dependants d where d.emp_id=e.emp_id);
+--------+------------+-----------+-----------------+------------+------------+---------+----------+------------+------------+---------+
| emp_id | first_name | last_name | email           | phone_no   | hire_date  | job_id  | salary   | commission | manager_id | dept_id |
+--------+------------+-----------+-----------------+------------+------------+---------+----------+------------+------------+---------+
|    101 | rahul      | sharma    | rahul@gmail.com | 999991     | 2022-01-10 | IT_PROG | 15000.00 |    1800.00 |       NULL |       1 |
|    102 | aisha      | khan      | aisha@gmail.com | 8590515247 | 2022-01-11 | HR_REP  |  9000.00 |    1000.00 |        101 |       2 |
+--------+------------+-----------+-----------------+------------+------------+---------+----------+------------+------------+---------+
2 rows in set (0.00 sec)



