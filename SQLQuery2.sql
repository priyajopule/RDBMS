CREATE DATABASE db2021
USE db2021
CREATE TABLE Customer(CustomerID int , FirstName varchar(250), LastName varchar(250), dept varchar(250) );
CREATE TABLE Auto__Pesons(ID int Identity (100,50), LAST_NAME varchar(250) NOT NULL, FIRSTNAME varchar(250) NOT NULL, AGE int); 
INSERT INTO Persons VALUES(NULL,'sharma','rohit',30)


CREATE table CHECKAgeDATE
(ID int identity (10,50),NAME varchar(250)NOT NULL, AGE int CHECK(AGE>18),DOB date);

SELECT *FROM CHECKAgeDATE;
insert into CHECKAgeDATE VALUES('vickey',35,CONVERT(datetime,'1989-02-05'));
