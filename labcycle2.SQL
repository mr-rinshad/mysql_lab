
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



