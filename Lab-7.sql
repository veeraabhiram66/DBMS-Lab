DROP TABLE Agent;
DROP TABLE Orders;
--Q1
SET LINESIZE 100;
SET PAGESIZE 20;
CREATE TABLE Agent(Agent_code varchar(5), Agent_name varchar(10), Working_area varchar(10), commision number(2,2), Phone_no number, country varchar(10) null);
CREATE TABLE Orders(Ord_num varchar(3), Ord_amount number, Advance_amount number, Ord_date date, Cust_code varchar(4), Agent_code varchar(5), Ord_Description varchar(20) null);
INSERT INTO Agent VALUES('Ac001','Ramesh','Bangalore',0.15,0331234567,'India');
INSERT INTO Agent VALUES('Ac002','Dinesh','Bangalore',0.25,0331234568,'India');
INSERT INTO Agent VALUES('Ac003','Suresh','Mumbai',0.35,0331234569,'London');
INSERT INTO Agent VALUES('Ac004','Kamlesh','Newjersey',0.68,0331234564,'London');
INSERT INTO Agent VALUES('Ac005','Kartik','Chennai',0.73,0331234563,'India');
INSERT INTO Orders VALUES('004', 200, 3000, '15-aug-2020','C004','Ac001','Masala kulcha');
INSERT INTO Orders VALUES('007', 600, 5000, '17-sep-2020','C006','Ac003','Biriyani');
INSERT INTO Orders VALUES('008', 700, 100, '19-feb-2019','C007','Ac005','');
INSERT INTO Orders VALUES('009', 10000, 600, '21-march-2010','C009','Ac004','Masala dosa');
INSERT INTO Orders VALUES('010', 20, 600, '21-april-2012','C006','Ac002','');
SELECT * FROM Agent;
SELECT * FROM Orders;
ALTER TABLE Agent ADD CONSTRAINT Agent_pk PRIMARY KEY(Agent_code);
SELECT * FROM Agent;
ALTER TABLE Orders ADD CONSTRAINT Orders_fk FOREIGN KEY(Agent_code) REFERENCES Agent(Agent_code);
--a)
SELECT ord_num, ord_amount, ord_date, cust_code, agent_code FROM Orders WHERE agent_code IN 
(SELECT agent_code FROM Agent WHERE 
country IN (SELECT country FROM Agent GROUP BY country HAVING count(country)>1) 
OR 
working_area IN (SELECT working_area FROM Agent GROUP BY working_area HAVING count(working_area)>1));
--b)
SELECT Ord_num, Ord_amount, Cust_code, Agent_code FROM Orders WHERE Agent_code IN (SELECT Agent_code from Agent WHERE Working_area LIKE '%a%');
 --Q2
DROP TABLE employees;
CREATE TABLE employees(employee_id number(3,0), first_name varchar(10), last_name varchar(10), email varchar(15), phone_number varchar(10), hire_date date, job_id varchar(5), salary number, manager_id number, department_id number,
CONSTRAINT Employee_pk PRIMARY KEY(employee_id));
INSERT INTO employees VALUES( '700', 'Hasmukh', 'Patel', 'hp@gmail.com', 7003216160, '15-aug-2020', 'Hp003', 7000, '', 90);
INSERT INTO employees VALUES( '800', 'Kamlesh', 'Paul', 'kp@gmail.com', 7003216170, '17-feb-2020', 'Kp004', 8000, '506', 90);
INSERT INTO employees VALUES( '900', 'Dinesh', 'Gandhi', 'dp@yahoo', 9136278563, '19-mar-2101', 'Dg006', 20000, '508', 80);
INSERT INTO employees VALUES( '701', 'Suresh', 'Modi', 'sm@dg.com', 9187653294, '20-april-2015', 'Sp003', 15000, '', 80);

SELECT employee_id, manager_id, first_name, last_name FROM employees WHERE manager_id IS NULL AND salary<(SELECT avg(salary) FROM employees WHERE last_name LIKE '%P');

--Q3
DROP TABLE Orders;
DROP TABLE salesman;
CREATE TABLE salesman(salesman_id varchar(8), name varchar(15),city varchar(15),commision float,
CONSTRAINT salesman_pk PRIMARY KEY(salesman_id));
CREATE TABLE Orders(ord_no number, purch_amt number, ord_date date, customer_id varchar(5), salesman_id varchar(8),
CONSTRAINT Orders_fk FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id) ON DELETE SET NULL, CONSTRAINT Orders_pk PRIMARY KEY(ord_no));
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
--a)
SELECT ord_no, purch_amt, ord_date, customer_id FROM Orders WHERE
salesman_id in 
(SELECT a.salesman_id FROM salesman a WHERE a.commision > (SELECT avg(b.commision) FROM salesman b WHERE a.city=b.city GROUP BY city));
--b)
DELETE FROM salesman WHERE commision > 0.2;


ALTER TABLE Orders
DISABLE CONSTRAINT Orders_fk;

UPDATE Orders SET salesman_id = 'NA' WHERE salesman_id is NULL;
SELECT * FROM salesman;
SELECT * FROM Orders;
