CREATE TABLE student (rollNo varchar2(5),name varchar2(10),degree varchar2(10) ,year number,sex varchar2(6),deptNo varchar2(10),advisor varchar2(10));
CREATE TABLE department (deptId varchar2(20),name varchar2(20),hod varchar2(5),phone number);
CREATE TABLE professor (empId varchar2(5) ,name varchar2(20) ,sex varchar2(6),startYear number,deptNo varchar2(20) ,phone number);
CREATE TABLE course(courseId varchar(8), cname varchar(50),credits number, deptNo varchar (20));
CREATE TABLE enrollment (rollNo varchar(10) ,courseId varchar(8),sem varchar(6) ,year number,grade varchar(2));
CREATE TABLE teaching (empId varchar2(5), courseId varchar2(8),sem varchar2(6),year number,classRoom varchar2(5));
CREATE TABLE prerequisite (preReqCourse varchar(8) ,courseId varchar(8));
--INSERTION DATA ALREADY EXIST IN DATABASE
--Q1
SELECT cname FROM course WHERE courseId IN (SELECT courseId FROM enrollment WHERE grade='W' GROUP BY courseId HAVING COUNT(grade)>=10);
--Q2
SELECT rollNo FROM enrollment GROUP BY rollNo,courseId HAVING COUNT(courseId)>1;
--Q3
SELECT rollNo FROM enrollment WHERE grade='S' GROUP BY rollNo HAVING COUNT(grade)=(SELECT MAX(count) FROM (SELECT COUNT(grade) AS count FROM enrollment WHERE grade='S' GROUP BY rollNo));
--Q4
CREATE TABLE emp (id varchar(10),salary number);
INSERT INTO emp VALUES('1',1000);
INSERT INTO emp VALUES('2',2000);
INSERT INTO emp VALUES('3',3000);
INSERT INTO emp VALUES('4',4000);
INSERT INTO emp VALUES('5',5000);
INSERT INTO emp VALUES('6',6000);
INSERT INTO emp VALUES('7',7000);
INSERT INTO emp VALUES('8',8000);
INSERT INTO emp VALUES('9',9000);
INSERT INTO emp VALUES('10',10000);
INSERT INTO emp VALUES('11',11000);
SELECT * FROM (SELECT * FROM emp ORDER BY salary DESC) WHERE ROWNUM=10;
--Q5
set serveroutput ON
DECLARE
grade char(4);
BEGIN
grade := '&grade';
IF(grade='A') THEN
dbms_output.put_line('Outstanding');
ELSIF(grade='B') THEN
dbms_output.put_line('Excellent');
ELSIF(grade='C') THEN
dbms_output.put_line('Very Good');
ELSIF(grade='D') THEN
dbms_output.put_line('Average');
ELSIF(grade='E') THEN
dbms_output.put_line('Poor');
ELSE
dbms_output.put_line('Invalid grade');
END IF;
END;
/
