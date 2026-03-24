mysql> source /home/ubuntu/mysql_lab/exp5five_pro;
Query OK, 0 rows affected (0.01 sec)

mysql> call calculate_salary();
Query OK, 0 rows affected (0.02 sec)

mysql> select* from emp_salary;
+---------+----------+-----------------+------------------------+--------+
| empd_id | emp_name | no_of_worksdays | designation            | salary |
+---------+----------+-----------------+------------------------+--------+
|       1 | amit     |              20 | assistance profosessor |      0 |
|       2 | raj      |              22 | cherk                  |      0 |
|       3 | neha     |              25 | programmer             |  31250 |
+---------+----------+-----------------+------------------------+--------+
3 rows in set (0.00 sec)

