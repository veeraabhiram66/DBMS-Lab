--Question-1
create table committees(committiee_id varchar2(6), name varchar2(20), age number );
create table member(member_id varchar2(6), name varchar2(20));
INSERT INTO committees VALUES('101','Ramesh',20);
INSERT INTO committees VALUES('102','Suresh',20);
INSERT INTO committees VALUES('103','Hritik',30);
INSERT INTO member VALUES('m101','Ramesh');
INSERT INTO member VALUES('m102','Suresh');
INSERT INTO member VALUES('m103','Rakesh');
--a)
SELECT committees.name FROM committees
LEFT JOIN member
ON committees.name=member.name
MINUS
SELECT committees.name FROM committees
INNER JOIN member
ON committees.name=member.name;
--b)
SELECT member.name FROM committees
RIGHT JOIN member
ON committees.name=member.name
MINUS
SELECT committees.name FROM committees
INNER JOIN member
ON committees.name=member.name;
--c)
SELECT DISTINCT(A.name) AS name1
FROM committees A, committees B
WHERE A.age=B.age AND A.name!=B.name;
--Question-2
SELECT DISTINCT student.name, student.rollNo FROM student
INNER JOIN teaching ON student.advisor=teaching.empId
INNER JOIN enrollment ON student.rollNo=enrollment.rollNo AND teaching.courseId=enrollment.courseId;
--Question-3
SELECT * FROM (SELECT preReqCourse FROM prerequisite WHERE courseId in
(SELECT preReqCourse FROM prerequisite WHERE courseId='608')
union
SELECT preReqCourse FROM prerequisite WHERE courseId='608') INNER JOIN course ON course.courseId=preReqCourse;
-- Question-4
select distinct ( STUDENT.rollNo), STUDENT.name from STUDENT
INNER JOIN  ENROLLMENT
    on STUDENT.ROLLNO = ENROLLMENT.ROLLNO
LEFT JOIN  (    SELECT a.courseid from  TEACHING a,TEACHING b
where a.EMPID = b.EMPID and b.COURSEID = '319' )c
        ON C.COURSEID = ENROLLMENT.COURSEID
MINUS
select distinct ( STUDENT.rollNo), STUDENT.name from STUDENT
INNER JOIN  ENROLLMENT
    on STUDENT.ROLLNO = ENROLLMENT.ROLLNO
INNER JOIN   (    SELECT a.courseid from  TEACHING a,TEACHING b
where a.EMPID = b.EMPID and b.COURSEID = '319' )c
ON C.COURSEID = ENROLLMENT.COURSEID;
--Question-5
SELECT student.rollNo, student.name FROM student
INNER JOIN enrollment ON student.rollNo=enrollment.rollNo
INNER JOIN prerequisite ON enrollment.courseId=prerequisite.preReqCourse
AND enrollment.grade='S' AND prerequisite.courseId='760';
--Question-6
SELECT DISTINCT(A.rollNo) FROM enrollment A, enrollment B WHERE A.rollNo=B.rollNo AND A.courseId=B.courseId AND A.year!=B.year;