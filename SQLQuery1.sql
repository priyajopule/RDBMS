use PRACTICE
select * from Employee_test

---------TRIGGER BANKING EXAMPLE UPDATE ACC 
CREATE TABLE BANK_ACCOUNT
(CustomerId INT PRIMARY KEY IDENTITY,
CustomerName VARCHAR(200),
Balance DECIMAL(10,2));

insert into BANK_ACCOUNT values('ram',50000.50);
insert into BANK_ACCOUNT values('shyam',20000.50);
insert into BANK_ACCOUNT values('ram',10000.50);
select * from BANK_ACCOUNT

CREATE TABLE TRANSACTIONS(TransactionId INT PRIMARY KEY IDENTITY(1000,23),Customer
INT FOREIGN KEY REFERENCES BANK_ACCOUNT(CustomerId),TransactionTime Date,TransactionAmt DECIMAL(10,2));

insert into TRANSACTIONS values(1,GETDATE(),2500);
insert into TRANSACTIONS values(2,GETDATE(),1000);
insert into TRANSACTIONS values(3,GETDATE(),400);

SELECT * FROM TRANSACTIONS




---------rollback transaction
begin transaction
insert into BANK_ACCOUNT values('priya',1000);
save transaction st1;
insert into BANK_ACCOUNT values('priyanka',500);
rollback transaction st1; 

select *from BANK_ACCOUNT


----transaction save point

