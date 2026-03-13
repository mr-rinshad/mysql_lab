mysql> source /home/ubuntu/mysql_lab/exp5six_pro;
Query OK, 0 rows affected (0.01 sec)


mysql> select * from bill;
+-------------+---------+-------------+-------------+------+--------+
| customer_id | name    | pre_reading | cur_reading | unit | amount |
+-------------+---------+-------------+-------------+------+--------+
|           1 | rindhad |         100 |         180 | NULL |   NULL |
|           2 | mishal  |         200 |         320 | NULL |   NULL |
|           3 | mizba   |         150 |         240 | NULL |   NULL |
|           4 | fidha   |         300 |         350 | NULL |   NULL |
+-------------+---------+-------------+-------------+------+--------+
4 rows in set (0.00 sec)

mysql> call calculate_bill();
Query OK, 0 rows affected (0.02 sec)

mysql> select * from bill;
+-------------+---------+-------------+-------------+------+--------+
| customer_id | name    | pre_reading | cur_reading | unit | amount |
+-------------+---------+-------------+-------------+------+--------+
|           1 | rindhad |         100 |         180 |   80 | 160.00 |
|           2 | mishal  |         200 |         320 |  120 | 250.00 |
|           3 | mizba   |         150 |         240 |   90 | 180.00 |
|           4 | fidha   |         300 |         350 |   50 | 100.00 |
+-------------+---------+-------------+-------------+------+--------+
4 rows in set (0.00 sec)


