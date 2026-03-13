mysql> source /home/ubuntu/mysql_lab/exp5three_pro;
Query OK, 0 rows affected (0.02 sec)

mysql> SET @status = '';
Query OK, 0 rows affected (0.00 sec)

mysql> CALL member_status(2, @status);
Query OK, 1 row affected (0.00 sec)

mysql> select @status;
+----------+
| @status  |
+----------+
| platinum |
+----------+
1 row in set (0.00 sec)

mysql> CALL member_status(3, @status);
Query OK, 1 row affected (0.00 sec)

mysql> select @status;
+---------+
| @status |
+---------+
| silver  |
+---------+
1 row in set (0.00 sec)

mysql> CALL member_status(1, @status);
Query OK, 1 row affected (0.00 sec)

mysql> select @status;
+---------+
| @status |
+---------+
| gold    |
+---------+
1 row in set (0.00 sec)

