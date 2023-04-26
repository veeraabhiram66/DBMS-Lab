mysql> CREATE DATABASE Lab-1;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| lab-1              |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
7 rows in set (0.00 sec)

mysql> use lab-1;
Database changed
mysql> show TABLES;
Empty set (0.01 sec)

mysql> CREATE TABLE Orders(
    -> Ord_num int,
    -> Ord_amount int,
    -> Advance_amount int,
    -> Ord_date varchar(20),
    -> Cust_code varchar(10),
    -> Agent_code varchar(10),
    -> Description varchar(20));
Query OK, 0 rows affected (0.02 sec)

mysql> DESCRIBE Orders;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Ord_num        | int         | YES  |     | NULL    |       |
| Ord_amount     | int         | YES  |     | NULL    |       |
| Advance_amount | int         | YES  |     | NULL    |       |
| Ord_date       | varchar(20) | YES  |     | NULL    |       |
| Cust_code      | varchar(10)  | YES  |     | NULL    |       |
| Agent_code     | varchar(10)  | YES  |     | NULL    |       |
| Description    | varchar(20) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)
mysql> INSERT INTO Orders VALUES
    -> (004,200,3000,'15-aug-2020','C004','Ac001','Masala kulcha'),
    -> (007,600,5000,'17-sept-2020','C006','Ac003','Biriyani'),
    -> (008,700,100,'19-feb-2019','C007','Ac005','Biriyani'),
    -> (009,10000,600,'21-mar-2010','C009','Ac002','Masala dosa'),
    -> (010, 20, 600, '21-apr-2012','C006','Ac005','Chicken Tikka');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Orders;
+---------+------------+----------------+--------------+-----------+------------+---------------+
| Ord_num | Ord_amount | Advance_amount | Ord_date     | Cust_code | Agent_code | Description   |
+---------+------------+----------------+--------------+-----------+------------+---------------+
|       4 |        200 |           3000 | 15-aug-2020  | C004      | Ac001      | Masala kulcha |
|       7 |        600 |           5000 | 17-sept-2020 | C006      | Ac003      | Biriyani      |
|       8 |        700 |            100 | 19-feb-2019  | C007      | Ac005      | Biriyani      |
|       9 |      10000 |            600 | 21-mar-2010  | C009      | Ac002      | Masala dosa   |
|      10 |         20 |            600 | 21-apr-2012  | C006      | Ac005      | Chicken Tikka |
+---------+------------+----------------+--------------+-----------+------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT Description FROM Orders;
+---------------+
| Description   |
+---------------+
| Masala kulcha |
| Biriyani      |
| Biriyani      |
| Masala dosa   |
| Chicken Tikka |
+---------------+
5 rows in set (0.00 sec)

mysql> SELECT Ord_num,Cust_code FROM Orders;
+---------+-----------+
| Ord_num | Cust_code |
+---------+-----------+
|       4 | C004      |
|       7 | C006      |
|       8 | C007      |
|       9 | C009      |
|      10 | C006      |
+---------+-----------+
5 rows in set (0.00 sec)

mysql> DELETE FROM Orders WHERE Ord_num=10;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Orders;
+---------+------------+----------------+--------------+-----------+------------+---------------+
| Ord_num | Ord_amount | Advance_amount | Ord_date     | Cust_code | Agent_code | Description   |
+---------+------------+----------------+--------------+-----------+------------+---------------+
|       4 |        200 |           3000 | 15-aug-2020  | C004      | Ac001      | Masala kulcha |
|       7 |        600 |           5000 | 17-sept-2020 | C006      | Ac003      | Biriyani      |
|       8 |        700 |            100 | 19-feb-2019  | C007      | Ac005      | Biriyani      |
|       9 |      10000 |            600 | 21-mar-2010  | C009      | Ac002      | Masala dosa   |
+---------+------------+----------------+--------------+-----------+------------+---------------+
4 rows in set (0.00 sec)

mysql>mysql> CREATE TABLE Agent(
    -> Agent_code varchar(10),
    -> Agent_name varchar(10),
    -> Working_area varchar(10),
    -> Commision float,
    -> Phone_no int,
    -> Country varchar(10));
Query OK, 0 rows affected (0.02 sec)

mysql> DESCRIBE Agent;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Agent_code   | varchar(10)  | YES  |     | NULL    |       |
| Agent_name   | varchar(10) | YES  |     | NULL    |       |
| Working_area | varchar(10) | YES  |     | NULL    |       |
| Commision    | float       | YES  |     | NULL    |       |
| Phone_no     | int         | YES  |     | NULL    |       |
| Country      | varchar(10) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)
mysql> INSERT INTO Agent VALUES
    -> ('Ac001','Ramesh','Bangalore',0.15,0331234567,'India'),
    -> ('Ac002','Dinesh','Bangalore',0.25,0331234568,''),
    -> ('Ac003','Suresh','Mumbai',0.35,0331234569,'London'),
    -> ('Ac004','Kamlesh','New jersey',0.68,0331234564,''),
    -> ('Ac005','Kartik','Chennai',0.73,0331234563,'India');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Agent;
+------------+------------+--------------+-----------+-----------+---------+
| Agent_code | Agent_name | Working_area | Commision | Phone_no  | Country |
+------------+------------+--------------+-----------+-----------+---------+
| Ac001      | Ramesh     | Bangalore    |      0.15 | 331234567 | India   |
| Ac002      | Dinesh     | Bangalore    |      0.25 | 331234568 |         |
| Ac003      | Suresh     | Mumbai       |      0.35 | 331234569 | London  |
| Ac004      | Kamlesh    | New jersey   |      0.68 | 331234564 |         |
| Ac005      | Kartik     | Chennai      |      0.73 | 331234563 | India   |
+------------+------------+--------------+-----------+-----------+---------+
5 rows in set (0.00 sec)

mysql> SELECT Commision,Phone_no FROM Agent;
+-----------+-----------+
| Commision | Phone_no  |
+-----------+-----------+
|      0.15 | 331234567 |
|      0.25 | 331234568 |
|      0.35 | 331234569 |
|      0.68 | 331234564 |
|      0.73 | 331234563 |
+-----------+-----------+
5 rows in set (0.00 sec)

mysql> DELETE FROM Agent WHERE Agent_name='Ramesh';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Agent;
+------------+------------+--------------+-----------+-----------+---------+
| Agent_code | Agent_name | Working_area | Commision | Phone_no  | Country |
+------------+------------+--------------+-----------+-----------+---------+
| Ac002      | Dinesh     | Bangalore    |      0.25 | 331234568 |         |
| Ac003      | Suresh     | Mumbai       |      0.35 | 331234569 | London  |
| Ac004      | Kamlesh    | New jersey   |      0.68 | 331234564 |         |
| Ac005      | Kartik     | Chennai      |      0.73 | 331234563 | India   |
+------------+------------+--------------+-----------+-----------+---------+
4 rows in set (0.00 sec)

