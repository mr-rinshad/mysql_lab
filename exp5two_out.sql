mysql> create table customer(customer_id int primary key,name varchar(50),city varchar(50),credits int);
Query OK, 0 rows affected (0.03 sec)

mysql> insert into customer values
    -> (1,'Rinshad','manjeri',3000),
    -> (2,'Mishal','valamur',6000),
    -> (3,'Fidha','manarkad',800);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> source /home/ubuntu/mysql_lab/exp5two_pro;
Query OK, 0 rows affected (0.01 sec)

mysql> call get_customer('rinshad');
+-------------+---------+---------+---------+
| customer_id | name    | city    | credits |
+-------------+---------+---------+---------+
|           1 | Rinshad | manjeri |    3000 |
+-------------+---------+---------+---------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


