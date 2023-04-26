set serveroutput ON
--Q1)
DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    a:=&a;
    b:=&b;
    c:=&c;
    dbms_output.put_line('Enter the value of first number:' || a);
    dbms_output.put_line('Enter the value of second number:' || b);
    dbms_output.put_line('Enter the value of third number:' || c);
    IF(a<b) THEN
        IF(b<c) THEN
        dbms_output.put_line('The maximum number is:' ||c);
        ELSE
        dbms_output.put_line('The maximum number is:' ||b);
        END IF;
    ELSE
        IF(c<a) THEN
        dbms_output.put_line('The maximum number is:' ||a);
        ELSE
        dbms_output.put_line('The maximum number is:' ||c);
        END IF;
    END IF;
END;
/

--Q2)
DECLARE
    a NUMBER;
BEGIN
    a:=&a;
    dbms_output.put_line('Enter the number:' || a);
    IF MOD(a,55) =0 THEN
    dbms_output.put_line('The number is divisible by 5 and 11');

    ELSE
    dbms_output.put_line('The number is not divisible by 5 and 11');
    END IF;
END;
/

--Q3)
DECLARE
    a NUMBER;
    b NUMBER;
    s NUMBER;
BEGIN
    a:=&a;
    b:=&b;
    s:=&s;
    dbms_output.put_line('Enter the length:' || a);
    dbms_output.put_line('Enter the breadth:' || b);
    dbms_output.put_line('Enter the side length:' || s);
    dbms_output.put_line('The Area of Rectangle is:'|| a*b);
    dbms_output.put_line('The Area of Triangle is:'|| 0.5*a*b);
    dbms_output.put_line('The Area of Square is:'|| s*s);
END;
/
--Q4)
DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
    d NUMBER;
    e NUMBER;
    marks NUMBER;
    total NUMBER;
    percentage REAL;
BEGIN
    a:=&a;
    b:=&b;
    c:=&c;
    d:=&d;
    e:=&e;
    total:=&total;
    dbms_output.put_line('Enter the marks of Physics:'|| a);
    dbms_output.put_line('Enter the marks of Chemistry:'|| b);
    dbms_output.put_line('Enter the marks of Biology:'|| c);
    dbms_output.put_line('Enter the marks of Mathematics:'|| d);
    dbms_output.put_line('Enter the marks of Computer:'|| e);
    dbms_output.put_line('Enter the Max marks of all five subjects:' || total);
    marks:=a+b+c+d+e;
    percentage:=(marks/total)*100;
    IF(percentage>=90) THEN
    dbms_output.put_line('Grade A');
    ELSIF(percentage>=80) THEN
    dbms_output.put_line('Grade B');
    ELSIF(percentage>=70) THEN
    dbms_output.put_line('Grade C');
    ELSIF(percentage>=60) THEN
    dbms_output.put_line('Grade D');
    ELSIF(percentage>=40) THEN
    dbms_output.put_line('Grade E');
    ELSE
    dbms_output.put_line('Grade F');
    END IF;
END;
/

--Q5)
DECLARE
    a INTEGER:=1;
    n INTEGER:=100;
    i INTEGER:=1;
    s INTEGER:=0;
BEGIN
    WHILE i<=n LOOP
    s:=s+i;
    i:=i+1;
    END LOOP;
    dbms_output.put_line('The sum is:'|| s);
END;
/
--Q6)
DROP TABLE Empinfo;
CREATE TABLE Empinfo(id number(5), name varchar2(20), age number(3), address varchar2(20), salary number(10));
INSERT INTO Empinfo VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000);
INSERT INTO Empinfo VALUES (2, 'Khilan', 25, 'Delhi', 1500);
INSERT INTO Empinfo VALUES (3, 'Kaushik', 23, 'Kota', 2000);
INSERT INTO Empinfo VALUES (4, 'Chaital', 25, 'Mumbai', 6500);
INSERT INTO Empinfo VALUES (5, 'Hardik', 27, 'Bhopal', 8500);
INSERT INTO Empinfo VALUES (6, 'Komal', 22, 'MP', 4500);
INSERT INTO Empinfo VALUES (6, 'Komal', 22, 'MP', 4500);
DECLARE
    e_id Empinfo.id%TYPE;
    e_name Empinfo.name%TYPE;
    e_age Empinfo.age%TYPE;
    e_salary Empinfo.salary%TYPE;
BEGIN
    SELECT name INTO e_name
    FROM Empinfo WHERE id=1;
    dbms_output.put_line('The name of person having id=1 is ' || e_name);
    SELECT name, age, salary INTO e_name, e_age, e_salary
    FROM Empinfo WHERE address='Kota';
    dbms_output.put_line('The name,age, and salary lives in Kota is ' || e_name || ', ' || e_age || ',and ' || e_salary || '.');
END;
/