create database BankingDB;
use BankingDB;
create table customers
(
customerID int,
firstName varchar(50),
lastName varchar(50),
email varchar(100),
phone varchar(15)
);
desc customers;
use bankingDB;
desc customers;
-- to add new column 'accountcreationdate'--->date --
alter table customers
add accountcreationdate date;
desc customers;


insert into customers(customerid,firstname,lastname,email,phone,accountcreationdate)
values(101,'raj','kurve','raj_k@gmail.com',9881004242,'2025-10-25');


--to retrive data from table--
--syntax: select * from <table_name>;--
select *from customers;

select firstname,email,accountcreationdate
from customers;


