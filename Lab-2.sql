CREATE TABLE student(rollNo varchar(10),name varchar(20),degree varchar(10),year varchar(10),sex varchar(6),deptNo number(3),advisor varchar(20));
CREATE TABLE department(deptId varchar(10),name varchar(20),hod varchar(20),phone number(10));
CREATE TABLE professor(empId varchar(10),name varchar(20),sex varchar(6),startYear number(4),deptNo number(3),phone number(10));
CREATE TABLE course(courseId varchar(10),cname varchar(10),credits number(3),deptNo number(3));
CREATE TABLE enrollment(rollNo varchar(10),courseId varchar(10),sem varchar(10),year number(4),grade varchar(5));
CREATE TABLE teaching(empId varchar(10),courseId varchar(10),sem varchar(10),year number(4),classRoom varchar(5));
CREATE TABLE preRequisite(preCourseId varchar(10),courseId varchar(10));

INSERT ALL
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS21B2026','Abhiram','B.Tech','2','MALE',2,'Dr.Preet')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS21B2037','Vishnu','B.Tech','2','MALE',2,'Dr.Preet')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS22B2030','Bannu','B.Tech','1','MALE',1,'Dr.Santhanam')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS22B2040','Sai','B.Tech','1','MALE',3,'Dr.Ram prasad')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS20B2019','Siddesh','B.Tech','3','MALE',1,'Dr.Jagaddesh')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS20B2020','Noni','B.Tech','3','MALE',2,'Dr.Venkatesh')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS19B2000','Venkat','B.Tech','4','MALE',4,'Dr.Tapasil')
SELECT 1 FROM dual;
INSERT ALL
    INTO department(deptId, name, hod, phone) VALUES('1','CSE','Masilamani',9876543210)
    INTO department(deptId, name, hod, phone) VALUES('2','CSAI','Ram prasad',1234567890)
    INTO department(deptId, name, hod, phone) VALUES('3','ECE','Santhanam',9996663330)
    INTO department(deptId, name, hod, phone) VALUES('4','MECH','Thimmaraju',0333666999)
    INTO department(deptId, name, hod, phone) VALUES('5','SM','Varadharaju',1111122222)
    INTO department(deptId, name, hod, phone) VALUES('6','SPANISH','Sergio',9898989898)
    INTO department(deptId, name, hod, phone) VALUES('7','IT','Vishnu',7777777777)
SELECT 1 FROM dual;
INSERT ALL
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('01','Jagadeesh','MALE',2019,1,1212121212)
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('02','Masilamani','MALE',2011,2,8989898989)
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('03','Ram Prasad','MALE',2015,3,9999999999)
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('04','Bingi','MALE',2013,4,2122128212)
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('05','Sergio','MALE',2013,5,1234567890)
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('06','Vishnu','MALE',2020,6,6969696969)
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('07','Santhanam','MALE',2012,7,9876543210)
SELECT 1 FROM dual;
INSERT ALL
    INTO course(courseId, cname, credits, deptNo) VALUES('CS2008','DBMS',4,1)
    INTO course(courseId, cname, credits, deptNo) VALUES('CS2003','DSD',4,2)
    INTO course(courseId, cname, credits, deptNo) VALUES('MA2000','OTML','MALE',4,3)
    INTO course(courseId, cname, credits, deptNo) VALUES('AI2007','AI','MALE',4,4)
    INTO course(courseId, cname, credits, deptNo) VALUES('ML2006','DS','MALE',4,5)
    INTO course(courseId, cname, credits, deptNo) VALUES('SP2001','SPANISH','MALE',4,6)
    INTO course(courseId, cname, credits, deptNo) VALUES('IT2004','ITALIAN','MALE',4,7)
SELECT 1 FROM dual;
INSERT ALL
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','CS2008','2ND',2021,'S')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','CS2003','2ND',2021,'A')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','MA2000','2ND',2021,'B')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','AI2007','2ND',2021,'A')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','ML2006','2ND',2021,'B')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','SP2001','2ND',2021,'S')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2026','IT2004','2ND',2021,'S')
SELECT 1 FROM dual;
INSERT ALL
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('01','CS2008','2ND',2023,'H12')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('02','CS2003','2ND',2023,'H12')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('03','MA2000','2ND',2023,'H11')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('04','AI2007','2ND',2023,'H05')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('05','ML2006','2ND',2023,'H25')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('06','SP2001','2ND',2023,'H06')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('01','IT2004','2ND',2023,'H07')
SELECT 1 FROM dual;
INSERT ALL
    INTO preRequisite(preCourseId, courseId) VALUES('11','CS1')
    INTO preRequisite(preCourseId, courseId) VALUES('12','CS2') 
    INTO preRequisite(preCourseId, courseId) VALUES('13','CS3')
    INTO preRequisite(preCourseId, courseId) VALUES('14','CS4')
    INTO preRequisite(preCourseId, courseId) VALUES('15','CS5')
    INTO preRequisite(preCourseId, courseId) VALUES('16','CS6')
    INTO preRequisite(preCourseId, courseId) VALUES('17','CS7')
SELECT 1 FROM dual;
SET LINESIZE 300;
SELECT  * FROM student;
SELECT  * FROM department;
SELECT  * FROM professor;
SELECT  * FROM course;
SELECT  * FROM enrollment;
SELECT  * FROM teaching;
SELECT  * FROM preRequisite;
DELETE FROM student WHERE year='3' OR year='4';
SELECT * FROM student;
ALTER TABLE student ADD(emailid varchar(50));
UPDATE student SET emailid ='CS21B2026@iiitdm.ac.in' WHERE rollNo='CS21B2026';
UPDATE student SET emailid ='CS21B2037@iiitdm.ac.in' WHERE rollNo='CS21B2037';
UPDATE student SET emailid ='CS22B2030@iiitdm.ac.in' WHERE rollNo='CS22B2030';
UPDATE student SET emailid ='CS22B2040@iiitdm.ac.in' WHERE rollNo='CS22B2040';
SELECT  * FROM student;
SELECT * FROM professor;
ALTER TABLE professor ADD(emailid varchar(50));
UPDATE professor SET emailid ='jagadeesh@iiitdm.ac.in' WHERE name ='Jagadeesh';
UPDATE professor SET emailid ='masilamani@iiitdm.ac.in' WHERE name ='Masilamani';
UPDATE professor SET emailid ='ramprasad@iiitdm.ac.in' WHERE name ='Ram Prasad';
UPDATE professor SET emailid ='bingi@iiitdm.ac.in' WHERE name ='Bingi';
UPDATE professor SET emailid ='sergio@iiitdm.ac.in' WHERE name ='Sergio';
UPDATE professor SET emailid ='vishnu@iiitdm.ac.in' WHERE name ='Vishnu';
UPDATE professor SET emailid ='santhanam@iiitdm.ac.in' WHERE name ='Santhanam';
SELECT * FROM professor;
UPDATE department SET hod ='Jagadeesh',phone=9090909090 WHERE deptId='1';
UPDATE department SET hod ='Nachiketa',phone=9999988888 WHERE deptId='2';
UPDATE department SET hod ='Tapasil',phone=9090909090 WHERE deptId='3';
UPDATE department SET hod ='Gurunathan',phone=9090909090 WHERE deptId='4';
SELECT * FROM department;
UPDATE professor SET phone =9848756409 WHERE name ='Bingi';
UPDATE professor SET phone =9912347569 WHERE name ='Sergio';
SELECT * FROM professor;