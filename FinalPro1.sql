
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

