source /home/ubuntu/mysql_lab/exp5one;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from account;
+--------+---------+
| acc_id | balance |
+--------+---------+
|    101 |    5000 |
|    102 |    3000 |
|    103 |    1200 |
+--------+---------+
3 rows in set (0.00 sec)

mysql> CALL withdraw(102,2000);
+---------------------+
| message             |
+---------------------+
| Withdraw successful |
+---------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> CALL withdraw(102,20000);
+----------------------------------------------------+
| message                                            |
+----------------------------------------------------+
| Withdraw not allowed, minimum balance must be 1000 |
+----------------------------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> CALL withdraw(104,20000);
+------------------------+
| message                |
+------------------------+
| Account does not exist |
+------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


