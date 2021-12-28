create database exam;
use exam;

CREATE TABLE CUSTOMER(
customer_id int primary key,
cust_name varchar(200) NOT NULL,
city varchar(200) NOT NULL,
grade int,
salesman_id int foreign key references SALESMAN(Salesman_id));

INSERT INTO CUSTOMER VALUES(3002,'Nick Rimando','New York ', 100,5001);
INSERT INTO CUSTOMER VALUES(3005,'Graham Zusi','California ', 200,5002);
INSERT INTO CUSTOMER VALUES(3004,'Fabian Johnson','Paris ', 300,5006);
INSERT INTO CUSTOMER VALUES(3007,'Brad Davis','New York ', 200,5001);
INSERT INTO CUSTOMER VALUES(3009,'Geoff Cameron','Berlin ', 100,5003);
INSERT INTO CUSTOMER VALUES(3008,'Julian Green','London ', 300,5002);
INSERT INTO CUSTOMER VALUES(3001,'Brad Guzan','London ', null,5005);
INSERT INTO CUSTOMER VALUES(3003,'Josy Altidore','Moscow ', 200,5007);

CREATE TABLE SALESMAN(
salesman_id int PRIMARY KEY,
sal_name varchar(250) NOT NULL,
city varchar(200),
commision decimal(10,2)
);

INSERT INTO SALESMAN VALUES(5001,'James Hoong','New York' ,0.15);
INSERT INTO SALESMAN VALUES(5002,'Nail Knite','Paris' , 0.13);
INSERT INTO SALESMAN VALUES(5005,'Pit Alex','London' , 0.11);
INSERT INTO SALESMAN VALUES(5006,'MC Lyon ','Paris ' , 0.14);
INSERT INTO SALESMAN VALUES(5003,'Louson Hense', ' ' , 0.12);
INSERT INTO SALESMAN VALUES(5007,'Paul Adam','Rome' , 0.13);

drop table CUSTOMER;
DROP TABLE SALESMAN;

select *from CUSTOMER;
select *from SALESMAN;

SELECT CUSTOMER.cust_name, SALESMAN.sal_name as name        -----QUESTION 2
FROM CUSTOMER,SALESMAN
WHERE SALESMAN.salesman_id = CUSTOMER.salesman_id;


create table ORDERS(
ord_no int PRIMARY KEY,
purch_amt decimal(10,2),
ord_date date not null,
customer_id int foreign KEY references CUSTOMER(customer_id),
salesman_id int foreign KEY references SALESMAN(salesman_id));

drop table ORDERS;


INSERT INTO ORDERS VALUES(70001,150.50,' 2021-10-05 ',3005,5002);
INSERT INTO ORDERS VALUES(70009,270.65,' 2012-09-10 ',3001,5005);
INSERT INTO ORDERS VALUES(70002,65.26,' 2012-10-05 ',3002,5001);
INSERT INTO ORDERS VALUES(70004,110.50,' 2012-08-17 ',3009,5003);
INSERT INTO ORDERS VALUES(70007,948.50,' 2012-09-10 ',3005,5002);
INSERT INTO ORDERS VALUES(70005,2400.60,' 2012-07-27 ',3007,5001);
INSERT INTO ORDERS VALUES(70008,5760.26,' 2012-09-10 ',3002,5001);
INSERT INTO ORDERS VALUES(70010,1983.43,' 2012-10-10 ',3004,5006);
INSERT INTO ORDERS VALUES(70003,2480.40,' 2012-10-10 ',3009,5003);
INSERT INTO ORDERS VALUES(70012,250.45,' 2012-06-27 ',3008,5002);
INSERT INTO ORDERS VALUES(70011,75.29,' 2012-08-17 ',3003,5007);
INSERT INTO ORDERS VALUES(70013,3045.60,' 2012-04-25 ',3002,5001);


SELECT ord_no, cust_name, ORDERS.customer_id, ORDERS.salesman_id       -----QUESTION 3
FROM SALESMAN, CUSTOMER, ORDERS
WHERE CUSTOMER.city <> SALESMAN.city
AND ORDERS.customer_id = CUSTOMER.customer_id
AND ORDERS.salesman_id = SALESMAN.salesman_id;


SELECT ORDERS.ord_no, CUSTOMER.cust_name                           -------QUESTION 4
FROM ORDERS, CUSTOMER
WHERE ORDERS.customer_id = CUSTOMER.customer_id; 



SELECT CUSTOMER.cust_name AS Customer,                           ------QUESTION 5
CUSTOMER.grade AS Grade
FROM ORDERS, SALESMAN, CUSTOMER
WHERE ORDERS.customer_id = CUSTOMER.customer_id
AND ORDERS.salesman_id = SALESMAN.salesman_id
AND SALESMAN.city IS NOT NULL
AND CUSTOMER.grade IS NOT NULL;


SELECT CUSTOMER.cust_name AS Customer,                          --------QUESTION 6
CUSTOMER.city AS City,
SALESMAN.sal_name AS Salesman,
SALESMAN.commision
FROM CUSTOMER,SALESMAN
WHERE CUSTOMER.salesman_id = SALESMAN.salesman_id
AND SALESMAN.commision
BETWEEN 0.12 AND 0.14;



SELECT ord_no, cust_name, commision AS "Commission%",             ------QUESTION 7
purch_amt*commision AS Commission
FROM SALESMAN,ORDERS,CUSTOMER
WHERE ORDERS.customer_id = CUSTOMER.customer_id
AND ORDERS.salesman_id = SALESMAN.salesman_id
AND CUSTOMER.grade>=200;




