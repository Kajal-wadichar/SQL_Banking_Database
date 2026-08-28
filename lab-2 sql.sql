use n325_db;

use bankingdb;

--lab-2--
create table accounts (
accountid int,
accounttype varchar(20),
balaace decimal(10,2)
);

desc Accounts;

create table transactionas (
transactionID int,
transactionDate date,
amount decimal(10,2),
transactiontype varchar(20)
);

desc transactionas;

create table branches(
branchID int,branchname varchar(100),
branchaddress varchar(200),branchphone varchar(15)
);

desc branches;

create table AccountBranches(
Assignmentdate date 
);

create table Loans(
loanID int, loanamount decimal(10,2),intrestrate decimal(5,2),startdate date, enddate date
);

-- structure of table --
desc accounts;
desc transactionas;

show tables;

# Modify the table structure by using alter command 
/*
1) add new columns
2) modify existing columns 
3) rename columns
4) add constraints 
5) remove constraints
*/
desc customers;


alter table customers modify phone varchar(30);
desc customers;
-- change datatype of existing column --
alter table customers modify phone float;
alter table customers modify phone bigint;

-- add minimum balance costraints --
alter table customers add column Balance bigint;
alter table customers 
add constraint chk_MinBalance
check(Balance>=5000);

-- Drop 'accountbranches' table --
-- syntax: drop table <table_name>; --
drop table accountbranches;

desc customers;


-- add primary key constraints to 'customersid' in customers table --
alter table customers
add primary key(customerid);
-- add unique constraints to 'phone' of 'customers' table --

alter table customers
add unique (phone);






