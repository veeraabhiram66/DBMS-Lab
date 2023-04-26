DROP TABLE Agent;
DROP TABLE Orders;
--Q1
CREATE TABLE Agent(Agent_code varchar(5), Agent_name varchar(10), Working_area varchar(10), commision number(2,2), Phone_no number, country varchar(10) null);
CREATE TABLE Orders(Ord_num varchar(3), Ord_amount number, Advance_amount number, Ord_date date, Cust_code varchar(4), Agent_code varchar(5), Description varchar(20) null);
INSERT INTO Agent VALUES('Ac001','Ramesh','Bangalore',0.15,0331234567,'India');
INSERT INTO Agent VALUES('Ac002','Dinesh','Bangalore',0.25,0331234568,'');
INSERT INTO Agent VALUES('Ac003','Suresh','Mumbai',0.35,0331234569,'London');
INSERT INTO Agent VALUES('Ac004','Kamlesh','Newjersey',0.68,0331234564,'');
INSERT INTO Agent VALUES('Ac005','Kartik','Chennai',0.73,0331234563,'India');
INSERT INTO Orders VALUES('004', 200, 3000, '15-aug-2020','C004','Ac001','Masala kulcha');
INSERT INTO Orders VALUES('007', 600, 5000, '17-sep-2020','C006','Ac003','Biriyani');
INSERT INTO Orders VALUES('008', 700, 100, '19-feb-2019','C007','Ac005','');
INSERT INTO Orders VALUES('009', 10000, 600, '21-march-2010','C009','Ac008','Masala dosa');
INSERT INTO Orders VALUES('010', 20, 600, '21-april-2012','C006','Ac005','');
SELECT * FROM Agent;
SELECT * FROM Orders;
--a)
SELECT Ord_num, Ord_amount, Ord_date, Cust_code, Agent_code FROM Orders WHERE Agent_code in
(SELECT Agent_code FROM Agent WHERE Working_area='Bangalore');
--b)
SELECT Ord_num, Ord_amount, Cust_code, Agent_code FROM Orders WHERE Agent_code in
(SELECT Agent_code FROM Agent WHERE Agent_name='Ramesh');
--Q2
CREATE TABLE employees(employee_id varchar(3), first_name varchar(10), last_name varchar(10), email varchar(15), phone_number number, hire_date date , job_id varchar(6), salary number, manager_id varchar(5) null, department_id number);
INSERT INTO employees VALUES( '700', 'Hasmukh', 'Patel', 'hp@gmail.com', 7003216160, '15-aug-2020', 'Hp003', 7000, '', 90);
INSERT INTO employees VALUES( '800', 'Kamlesh', 'Paul', 'kp@gmail.com', 7003216170, '17-feb-2020', 'Kp004', 8000, '506', 90);
INSERT INTO employees VALUES( '900', 'Dinesh', 'Gandhi', 'dp@yahoo', 9136278563, '19-mar-2101', 'Dg006', 20000, '508', 80);
INSERT INTO employees VALUES( '701', 'Suresh', 'Modi', 'sm@dg.com', 9187653294, '20-april-2015', 'Sp003', 15000, '', 80);
--a)
SELECT employee_id, manager_id, first_name, last_name FROM employees WHERE manager_id!=null;
--b)
SELECT employee_id, manager_id, first_name, last_name FROM employees WHERE manager_id=null;

--Q3
DROP TABLE Orders;
CREATE TABLE salesman(salesman_id varchar(10), name varchar(10), city varchar(10), commision number(2,2));
CREATE TABLE Orders(Ord_num varchar(3), Purch_amt number, Ord_date date, Customer_id varchar(5), salesman_id varchar(10));
INSERT INTO salesman VALUES('si123@06', 'Lakshmi', 'Kolkata', 0.5);
INSERT INTO salesman VALUES('si123@09', 'Ganesh', 'London', 0.6);
INSERT INTO salesman VALUES('si123@90', 'Dinesh', 'London', 0.3);
INSERT INTO salesman VALUES('si123@10', 'Joseph', 'Chennai', 0.6);
INSERT INTO salesman VALUES('si123@19', 'Mahesh', 'Hyderabad', 0.65);
INSERT INTO salesman VALUES('si123@26', 'Paul Adam', 'London', 0.1);
INSERT INTO salesman VALUES('si123@67', 'Rahul', 'Delhi', 0.4);
INSERT INTO Orders VALUES('123', 600, '20-aug-2010', '003cd', 'si123@19');
INSERT INTO Orders VALUES('576', 750, '20-feb-2018', '004cd', 'si123@19');
INSERT INTO Orders VALUES('579', 800, '20-may-2012', '004cd', 'si123@26');
INSERT INTO Orders VALUES('600', 60000, '20-jan-2021', '006cd', 'si123@10');
INSERT INTO Orders VALUES('700', 745, '26-jan-2021', '007cd', 'si123@09');
INSERT INTO Orders VALUES('800', 860, '29-jan-2019', '007cd', 'si123@26');

SELECT * FROM salesman;
SELECT * FROM Orders;
--a)
SELECT * FROM Orders WHERE salesman_id in
(SELECT salesman_id FROM salesman WHERE name='Paul Adam');
--b)
SELECT * FROM Orders WHERE salesman_id in
(SELECT salesman_id FROM salesman WHERE city='London');