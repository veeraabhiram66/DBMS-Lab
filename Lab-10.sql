DROP TABLE Student;
DROP TABLE Course;
DROP TABLE Enrolled;
SET linesize 100;
SET pagesize 20;
CREATE TABLE Student( Rollno varchar(8), Sname varchar(20), Gender varchar(1), City varchar(20), CONSTRAINT Student_pk PRIMARY KEY(Rollno));
CREATE TABLE Course( Ccode varchar(5), Cname varchar(20), Credit number, CONSTRAINT Course_pk PRIMARY KEY(Ccode));
CREATE TABLE Enrolled( Rollno varchar(8), Ccode varchar(5), Yoe number, 
CONSTRAINT Enrolled_fk_1 FOREIGN KEY(Rollno) REFERENCES Student(Rollno),
CONSTRAINT Enrolled_fk_2 FOREIGN KEY(Ccode) REFERENCES Course(Ccode));
INSERT INTO Student VALUES ('1901CS99','Bhargav','M','Chennai');
INSERT INTO Student VALUES ('1901CS98','Vennela','F','Delhi');
INSERT INTO Student VALUES ('1901EC97','Nikki','F','Delhi');
INSERT INTO Student VALUES ('1901EC96','Abhi','M','Mumbai');
INSERT INTO Student VALUES ('1901ME95','Mrunal','F','Mumbai');
INSERT INTO Course VALUES ('CS500','DBMS',4);
INSERT INTO Course VALUES ('CS501','AI',3);
INSERT INTO Course VALUES ('EC300','DC',4);
INSERT INTO Course VALUES ('EC301','DSD',3);
INSERT INTO Course VALUES ('ME400','MS',2);
INSERT INTO Course VALUES ('ME401','TM',4);
INSERT INTO Enrolled VALUES ('1901CS99','CS500',2020);
INSERT INTO Enrolled VALUES ('1901CS99','CS501',2020);
INSERT INTO Enrolled VALUES ('1901CS99','EC300',2020);
INSERT INTO Enrolled VALUES ('1901CS99','EC301',2020);
INSERT INTO Enrolled VALUES ('1901CS99','ME400',2020);
INSERT INTO Enrolled VALUES ('1901EC96','CS500',2021);
INSERT INTO Enrolled VALUES ('1901EC96','EC300',2022);
INSERT INTO Enrolled VALUES ('1901EC96','EC301',2021);
INSERT INTO Enrolled VALUES ('1901CS98','CS501',2019);
INSERT INTO Enrolled VALUES ('1901EC97','CS501',2021);
INSERT INTO Enrolled VALUES ('1901ME95','ME401',2021);
--A
ALTER TABLE Student ADD Email varchar(30);
ALTER TABLE Course ADD Ctype varchar(20);
UPDATE Student SET Email='Bhargav@gmail.com' WHERE Sname='Bhargav';
UPDATE Student SET Email='Vennela@yahoo.com' WHERE Sname='Vennela';
UPDATE Student SET Email='Nikki@gmail.com' WHERE Sname='Nikki';
UPDATE Student SET Email='Abhi@gmail.com' WHERE Sname='Abhi';
UPDATE Student SET Email='Mrunal@yahoo.com' WHERE Sname='Mrunal';
UPDATE Course SET Ctype='Core' WHERE Cname='DBMS';
UPDATE Course SET Ctype='Elective' WHERE Cname='AI';
UPDATE Course SET Ctype='Core' WHERE Cname='DC';
UPDATE Course SET Ctype='Openelective' WHERE Cname='MS';
UPDATE Course SET Ctype='Elective' WHERE Cname='DSD';
UPDATE Course SET Ctype='Openelective' WHERE Cname='TM';
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrolled;
--B
CREATE OR REPLACE VIEW startcscode AS(
SELECT Cname FROM Course where Ccode like 'CS%');
SELECT * FROM startcscode;
--C
CREATE OR REPLACE VIEW ainnames AS(
SELECT Sname FROM Student where Sname like '%a%a%');
SELECT * FROM ainnames;
--D
CREATE OR REPLACE VIEW notenrolled AS(
SELECT * FROM Student WHERE Rollno IN 
(SELECT Rollno FROM Enrolled WHERE Yoe NOT IN (2018, 2019)));
SELECT * FROM notenrolled;
--E
CREATE OR REPLACE VIEW leastcredit AS(
    SELECT * FROM Course where Credit IN(SELECT min(Credit) FROM Course));
SELECT * FROM leastcredit;
--F
CREATE OR REPLACE VIEW notin2020 AS(
SELECT Cname FROM Course WHERE Ccode IN (SELECT Ccode FROM Enrolled WHERE Yoe NOT IN (2020)));
SELECT * FROM notin2020;
--G
CREATE OR REPLACE VIEW studentfromcity AS(
SELECT City, COUNT(Rollno) AS numcity FROM Student GROUP BY City);
SELECT * FROM studentfromcity;
--H
CREATE OR REPLACE VIEW enrollin5courses AS(
SELECT Rollno FROM Enrolled GROUP BY Rollno HAVING COUNT(CCode) = 5);
SELECT * FROM enrollin5courses;
--I
CREATE OR REPLACE VIEW coursestakenby1901CS99 AS(
SELECT COUNT(Rollno) AS numcourses FROM Enrolled WHERE Rollno = '1901CS99');
SELECT * FROM coursestakenby1901CS99; 
--J
CREATE OR REPLACE VIEW level5course AS(
    SELECT * FROM Course WHERE Ccode LIKE 'CS5%');
    SELECT * FROM level5course;
--K
CREATE OR REPLACE VIEW roll AS(
    SELECT COUNT(Rollno) AS numstudents FROM Student WHERE Rollno LIKE '%CS%');
    SELECT * FROM roll;
--L
CREATE OR REPLACE VIEW course4in2020 AS(
SELECT Rollno FROM Enrolled WHERE Yoe = 2020 GROUP BY Rollno HAVING COUNT(Ccode)>4);
SELECT * FROM course4in2020;
--M
CREATE OR REPLACE VIEW femaledelhi AS(
SELECT DISTINCT(Ccode) 
FROM Enrolled INNER JOIN Student
ON Enrolled.Rollno = Student.Rollno AND Student.City = 'Delhi' AND Student.Gender = 'F');
SELECT * FROM femaledelhi;
--N
CREATE OR REPLACE VIEW gmail AS(
    SELECT Sname FROM Student WHERE Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com');
    SELECT * FROM gmail;
--O
CREATE OR REPLACE VIEW allcourses AS(
SELECT Rollno FROM Enrolled GROUP BY Rollno HAVING COUNT(Ccode) = (SELECT COUNT(Ccode) FROM Course));
SELECT * FROM allcourses;