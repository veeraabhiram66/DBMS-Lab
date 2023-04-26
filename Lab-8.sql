DROP TABLE Course_Taken;
DROP TABLE Course_Required;
DROP TABLE Bank;
DROP TABLE Account_Holder;
SET LINESIZE 100;
SET PAGESIZE 20;
--Q1)
CREATE TABLE Course_Taken ( Student_name varchar(15),Course varchar(30));
INSERT INTO Course_Taken VALUES('Robert','Databases');
INSERT INTO Course_Taken VALUES('Robert','Programming Languages');
INSERT INTO Course_Taken VALUES('David','Databases');
INSERT INTO Course_Taken VALUES('Hannah','Programming Languages');
INSERT INTO Course_Taken VALUES('Hannah','Programming Languages');
INSERT INTO Course_Taken VALUES('Tom','Operating systems');
INSERT INTO Course_Taken VALUES('David','Operating systems');
SELECT * FROM Course_Taken;
CREATE TABLE Course_Required (Course varchar(30));
INSERT INTO Course_Required VALUES('Databases');
INSERT INTO Course_Required VALUES('Programming Languages');
SELECT * from Course_Required;

--a)
CREATE TABLE T1 AS (SELECT DISTINCT (Student_name) FROM Course_Taken);
SELECT * FROM T1;
--b)
CREATE TABLE T2 AS (SELECT * FROM T1,Course_Required);
SELECT * FROM T2;
--c)
CREATE TABLE T3 AS ((SELECT * FROM T2) MINUS (SELECT * FROM Course_Taken));
SELECT * FROM T3;
--d)
CREATE TABLE T4 AS (SELECT * FROM T2 MINUS SELECT * FROM Course_Taken);
SELECT DISTINCT (Student_name) FROM T4;
--e)
CREATE TABLE T5 AS (SELECT * FROM T1 MINUS SELECT DISTINCT (Student_name) FROM T4);
SELECT * FROM T5;

--Q2)
SELECT DISTINCT(student_name) FROM (SELECT * FROM
(SELECT DISTINCT(student_name) FROM Course_Taken),
(SELECT course FROM Course_Required)
MINUS
SELECT student_name, course FROM Course_Taken);

CREATE TABLE tab AS (SELECT * FROM Course_Taken WHERE course = ANY(SELECT course FROM Course_Required));
CREATE TABLE Non_Graduate AS SELECT DISTINCT(student_name) FROM (SELECT * FROM T2 MINUS SELECT * FROM tab);
SELECT * FROM Non_Graduate;

SELECT * FROM T1 INTERSECT SELECT DISTINCT(student_name) FROM T3;
--Q3)
CREATE TABLE Bank (Bank_name varchar(5),State_name varchar(15));
INSERT INTO Bank VALUES('SBI','Andhra Pradesh');
INSERT INTO Bank VALUES('SBI','Tamilnadu');
INSERT INTO Bank VALUES('SBI','Karnataka');
INSERT INTO Bank VALUES('ICICI','Tamilnadu');
INSERT INTO Bank VALUES('ICICI','Karnataka');
SELECT * FROM Bank;

CREATE TABLE Account_Holder ( Account_name varchar(15),Bank_name varchar(5),State_name varchar(15));
INSERT INTO Account_Holder VALUES('Ramesh','ICICI','Tamilnadu');
INSERT INTO Account_Holder VALUES('Dinesh','SBI','Andhra Pradesh');
INSERT INTO Account_Holder VALUES('Robert','SBI','Tamilnadu');
INSERT INTO Account_Holder VALUES('Robert','ICICI','Karnataka');
INSERT INTO Account_Holder VALUES('Robert','SBI','Andhra Pradesh');
INSERT INTO Account_Holder VALUES('Karthik','SBI','Andhra Pradesh');
SELECT * FROM Account_Holder;

--a)
CREATE TABLE A1 AS (SELECT DISTINCT (Account_name) FROM Account_Holder);
SELECT * FROM A1;
CREATE TABLE A2 AS (SELECT * FROM A1,Bank);
CREATE TABLE A3 AS(SELECT * from A2 MINUS SELECT * FROM Account_Holder);
CREATE TABLE A4 AS (SELECT DISTINCT(Account_name) FROM A3);
SELECT * FROM A1 MINUS SELECT * FROM A4;
DROP TABLE A1;
DROP TABLE A2;
DROP TABLE A3;
DROP TABLE A4;
DROP TABLE A5;
--b)
CREATE TABLE A1 AS (SELECT DISTINCT(State_name) FROM Bank);
CREATE TABLE A2 AS (SELECT DISTINCT(Bank_name) FROM Bank);
SELECT * FROM A2;
CREATE TABLE A3 AS
(SELECT * FROM A2, A1);
CREATE TABLE A4 AS
(SELECT * FROM A3
MINUS 
SELECT * FROM Bank);
CREATE TABLE A5 AS (SELECT DISTINCT(Bank_name) FROM A4);
SELECT * FROM A2
MINUS
SELECT * FROM A5;

--c)
SELECT * FROM A5;
DROP TABLE A2;
DROP TABLE A3;
DROP TABLE A4;
DROP TABLE A5;

--d)

CREATE TABLE A2 AS (SELECT Account_Name, State_name FROM Account_Holder);

CREATE TABLE A3 AS (SELECT DISTINCT(Account_Name) FROM Account_Holder);
SELECT * FROM A3;
CREATE TABLE A4 AS
(SELECT * FROM A3, A1);
CREATE TABLE A5 AS
(SELECT * FROM A4
MINUS 
SELECT * FROM A2);
CREATE TABLE A6 AS (SELECT DISTINCT(Account_Name) FROM A5);
SELECT * FROM A3
MINUS
SELECT * FROM A6;

