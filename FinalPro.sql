CREATE TABLE Employee(
EMPLOYEE_ID INTEGER PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(20),
Phone INTEGER UNIQUE ,
salary INTEGER ,
dept_num INTEGER,
Gender VARCHAR(1),
Address VARCHAR(40),
job_title varchar(30)
--FOREIGN KEY (dept_num) REFERENCES department(dept_num)
);

---------------------------------------------
CREATE TABLE department(
EMPLOYEE_ID INTEGER ,
dept_num INTEGER PRIMARY KEY ,
dept_name VARCHAR(20),
Manager_id INTEGER ,
Manager_start_date DATE ,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID));

---------------------------------------------
ALTER TABLE Employee
ADD FOREIGN KEY (dept_num) REFERENCES  department(dept_num);
---------------------------------
---------------------------------------------
CREATE TABLE  DependentEmp (
dependent_num INTEGER  ,
EMPLOYEE_ID INTEGER ,
dependent_name VARCHAR(30),
dependent_relation VARCHAR(1),
dependent_gender VARCHAR(1),
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
PRIMARY KEY (dependent_num,EMPLOYEE_ID)
);
--------------------------------------------------
CREATE TABLE CLIENTfd(
clientfd_id INTEGER PRIMARY KEY ,
clientfd_name VARCHAR(20),
clientfd_PHONE VARCHAR(10)
);
---------------------------------------------------
CREATE TABLE  sales (
EMPLOYEE_ID INTEGER ,
--client_id INTEGER,
sales_amount INTEGER ,
clientfd_id INTEGER,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
FOREIGN KEY (clientfd_id) REFERENCES CLIENTfd(clientfd_id),
PRIMARY KEY(EMPLOYEE_ID,clientfd_id)
);
---------------------------------------------

CREATE TABLE EMPLOYEE_HISTORY (
EMPLOYEE_ID INTEGER ,
Start_the_job_date DATE ,
dept_num INTEGER,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
FOREIGN KEY (dept_num) REFERENCES department(dept_num),
PRIMARY KEY(EMPLOYEE_ID,dept_num)
);
-----------------------------------------------

CREATE TABLE BRANCHES(
branch_id INTEGER ,
Branch_name varchar(20),
EMPLOYEE_ID INTEGER ,
LOCATIONS_ID INTEGER ,
COUNTRY_ID  INTEGER ,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
PRIMARY KEY (branch_id,COUNTRY_ID)
);
------------------------------------------------------

CREATE TABLE JOBS_TITLES(
JOB_NAME VARCHAR(20),
MAX_SALARY INTEGER ,
MINI_SALARAY INTEGER ,
EMPLOYEE_ID INTEGER ,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
PRIMARY KEY (JOB_NAME)
);
---------------------------------------------

CREATE TABLE SALARIES(
JOB_SALARY_RANGE  varchar(20) ,
ANNUAL_INCOME INTEGER ,
EMPLOYEE_ID INTEGER ,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID)
);
----------------------------------------------
CREATE TABLE INTERVIEWS_emp (
Candida_ID INTEGER  PRIMARY KEY, 
Candida_name VARCHAR(20),
Candida_result VARCHAR(1),
dept_num INTEGER  ,
FOREIGN KEY (dept_num) REFERENCES department(dept_num)
);
----------------------------------------------------------

--INSERT DATA INTO EMPLOYEE TABLE

INSERT INTO Employee(EMPLOYEE_ID,EMPLOYEE_NAME,Phone,salary,Gender,Address,job_title)
VALUES (1,'Mohamed',010917273,100,'1','shoubra','receptioni'); 
INSERT INTO Employee(EMPLOYEE_ID,EMPLOYEE_NAME,Phone,salary,Gender,Address,job_title)
VALUES (2,'Ali',01091436728,1890,'1','haram','ITsupport');
INSERT INTO Employee(EMPLOYEE_ID,EMPLOYEE_NAME,Phone,salary,Gender,Address,job_title)
VALUES (3,'Mahmoud',01075473,400,'1','newCairo','ComputerEngineer');
INSERT INTO Employee(EMPLOYEE_ID,EMPLOYEE_NAME,Phone,salary,Gender,Address,job_title)
VALUES (4,'Mahmoud',010557745893,400,'1','newCairo','CommmunicationEngineer');
INSERT INTO Employee(EMPLOYEE_ID,EMPLOYEE_NAME,Phone,salary,Gender,Address,job_title)
VALUES (5,'Mahmoud',010754432839473,500,'1','newCairo','MwchnicalEngineer');
-------------------------------------------------------------------------------------------
--------------------------Insert data into department----------------------------------------
-------------------------------------------------------------------------------------------
INSERT INTO department(dept_num,dept_name,Manager_id,Manager_start_date)
VALUES (1,'General',01,'1-DEC-05'); 
INSERT INTO department(dept_num,dept_name,Manager_id,Manager_start_date)
VALUES (2,'ITJOBS',02,'2-DEC-05'); 
INSERT INTO department(dept_num,dept_name,Manager_id,Manager_start_date)
VALUES (3,'ITJOBS',03,'3-DEC-05'); 
INSERT INTO department(dept_num,dept_name,Manager_id,Manager_start_date)
VALUES (4,'ITJOBS',04,'4-DEC-05'); 
INSERT INTO department(dept_num,dept_name,Manager_id,Manager_start_date)
VALUES (5,'ITJOBS',05,'5-DEC-05'); 
-----------------------------------------------------------------------------------------
-------------------------UPDATE--------------------------------------------------
------------------------------------------------------------------------------------
UPDATE Employee set dept_num='01' WHERE EMPLOYEE_ID=1;
UPDATE Employee set dept_num='02' WHERE EMPLOYEE_ID=2;
UPDATE Employee set dept_num='03' WHERE EMPLOYEE_ID=3;
UPDATE Employee set dept_num='04' WHERE EMPLOYEE_ID=4;
UPDATE Employee set dept_num='05' WHERE EMPLOYEE_ID=5;
--__________________________________________________________________________________
--__________________________________________________________________________________
--DEPRTMENT
--___________________________________________________________________________________
--______________________________________________________________________________________
UPDATE department set EMPLOYEE_ID='1' WHERE dept_num='01';
UPDATE department set EMPLOYEE_ID='2' WHERE dept_num='02';
UPDATE department set EMPLOYEE_ID='3' WHERE dept_num='03';
UPDATE department set EMPLOYEE_ID='4' WHERE dept_num='04';
UPDATE department set EMPLOYEE_ID='5' WHERE dept_num='05';
---_______________________________________________________________________
SELECT * FROM department;
SELECT * FROM Employee;
---------------------------------------------------------
INSERT INTO DependentEmp
VALUES (05,1,'Child','S','M');
INSERT INTO DependentEmp
VALUES (04,2,'wife','w','F');
INSERT INTO DependentEmp
VALUES (03,3,'Child','S','M');
---------------------------------------------------------------------------
-------------------------------------------------------------------------------
INSERT INTO CLIENTfd
VALUES (057,'Doaa',01938374);
INSERT INTO CLIENTfd
VALUES (089,'Laila',253637);
INSERT INTO CLIENTfd
VALUES (014,'Farida',3749392);
SELECT * FROM CLIENTfd;
SELECT * FROM DependentEmp;
--------------------------------------------------
INSERT INTO sales
VALUES (1,64758,057);
INSERT INTO sales
VALUES (2,829773,089);
INSERT INTO sales
VALUES (3,'1-DEC-05',014);
-------------------------------------------
INSERT INTO EMPLOYEE_HISTORY
VALUES (1,'1-DEC-05',1);
INSERT INTO EMPLOYEE_HISTORY
VALUES (2,'2-DEC-05',2);
INSERT INTO EMPLOYEE_HISTORY
VALUES (3,'28-DEC-05',3);
INSERT INTO EMPLOYEE_HISTORY
VALUES (4,'10-DEC-05',4);
INSERT INTO EMPLOYEE_HISTORY
VALUES (5,'12-DEC-05',5);
--------------------------------------------------
SELECT * FROM  EMPLOYEE_HISTORY;
SELECT * FROM sales;
---------------------------------------------
INSERT INTO BRANCHES
VALUES (00011,'BRANCH11',1,03333,033333);
INSERT INTO BRANCHES
VALUES (00022,'BRANCH22',2,02222,022222);
INSERT INTO BRANCHES
VALUES (00033,'BRANCH33',3,01111,01111);
SELECT * FROM BRANCHES ;
------------------------------------------------------
SELECT * FROM Employee WHERE job_title = 'ITsupport';
---------------------------------------------------
SELECT *
FROM Employee
WHERE Salary IN 
(SELECT MIN(SALARY) FROM Employee  GROUP BY dept_num);

---------------------------------------------------------
SELECT * FROM Employee WHERE Salary=(SELECT  MIN(salary)FROM Employee);
SELECT * FROM Employee WHERE salary > 300 AND salary <1000;
------------------------------------------------------------------
SELECT COUNT(EMPLOYEE_ID), salary
FROM Employee
GROUP BY salary
HAVING COUNT(EMPLOYEE_ID) < 5
ORDER BY COUNT(EMPLOYEE_ID) DESC;
/*

CREATE TABLE JOBS_TITLES(
JOB_NAME VARCHAR(20),
MAX_SALARY INTEGER ,
MINI_SALARAY INTEGER ,
EMPLOYEE_ID INTEGER ,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
PRIMARY KEY (JOB_NAME)
);
---------------------------------------------

CREATE TABLE SALARIES(
JOB_SALARY_RANGE  varchar(20) ,
ANNUAL_INCOME INTEGER ,
EMPLOYEE_ID INTEGER ,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID)
);
----------------------------------------------
CREATE TABLE INTERVIEWS_emp (
Candida_ID INTEGER  PRIMARY KEY, 
Candida_name VARCHAR(20),
Candida_result VARCHAR(1),
dept_num INTEGER  ,
FOREIGN KEY (dept_num) REFERENCES department(dept_num)
);
*/