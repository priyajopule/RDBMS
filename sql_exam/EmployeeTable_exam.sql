USE exam;

CREATE TABLE EMPLOYEE(
emp_id int NOT NULL,
emp_name varchar(200) NOT NULL,
job_name varchar(200) NOT NULL,
manager_id int,
hire_date date,
salary decimal(10,2) NOT NULL,
commission decimal(10,2),
dep_id int NOT NULL
);

insert into EMPLOYEE values(68319,'KAYLING','PRESIDENT',NULL,'1991-11-18',6000.00,NULL,1001);
insert into EMPLOYEE values(66928,'BLAZE','MANAGER',68319,'1991-05-01',2750.00,NULL,3001);
insert into EMPLOYEE values(67832,'CLARE','MANAGER',68319,'1991-06-09',2550.00,NULL,1001);
insert into EMPLOYEE values(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00 ,NULL,2001);
insert into EMPLOYEE values(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100.00,NULL,2001);
insert into EMPLOYEE values(69062,'FRANK','ANALYST',65646,' 1991-12-03',3100.00,NULL,2001);
insert into EMPLOYEE values(63679,'SANDRINE','CLERK',69062,'1990-12-18',900.00,NULL,2001);
insert into EMPLOYEE values(64989,'ADELYN','SALESMAN',66928,' 1991-02-20',1700.00,400.00,3001);
insert into EMPLOYEE values(65271,'WADE','SALESMAN',66928,' 1991-02-22',1350.00,600.00,3001);
insert into EMPLOYEE values(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001);
insert into EMPLOYEE values(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00,3001);
insert into EMPLOYEE values(68736,'ADNRES','CLERK',67858,'1997-05-23',1200.00,NULL,2001);
insert into EMPLOYEE values(69000,'JULIUS','CLERK',66928,'1991-12-03',1050.00,NULL,3001);
insert into EMPLOYEE values(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,NULL,1001);


SELECT * FROM EMPLOYEE;

SELECT count(*) as "count"              -------question 1
FROM EMPLOYEE
where emp_id in
(select manager_id from EMPLOYEE);



SELECT *                                                   ----------QUESTION 8
FROM EMPLOYEE
WHERE dep_id =1001 AND salary >
(SELECT AVG (salary)FROM EMPLOYEE WHERE dep_id = 2001);


SELECT EMPLOYEE.job_name                                 ---------QUESTION 9
FROM EMPLOYEE 
WHERE EMPLOYEE.dep_id = 1001
AND EMPLOYEE.job_name NOT IN
(SELECT job_name FROM EMPLOYEE WHERE dep_id =2001);


SELECT *                                                  --------QUESTION 10
FROM EMPLOYEE m
WHERE m.emp_id IN
(SELECT manager_id FROM EMPLOYEE)
AND m.salary >
(SELECT avg(e.salary)FROM EMPLOYEE e WHERE e.manager_id = m.emp_id );




