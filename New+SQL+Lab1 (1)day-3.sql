create database BankingDB;

use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

insert into Customers(CuustomerID,LastName,Email,Phone,AccountCreationdate)
values(101,'Raj','Karve','raj_k@gmail.com',9881004242,'2025-10-25');
Create Table persons(
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255)NOT NULL,
   Age int
   );
desc Persons;
-- add null constraints to 'Age' column--
ALTER table Persons modify column Age int NOT NULL;   
   

insert into Persons values(1,'Deshmukh','Vaishnavi',23);

select FirstName,LastName,concat (FirstName," ",LastName) as'Employee Name' from Persons;

-- Unique --
Alter table Persons add column Email varchar(200);

ALTER table Persons modify column Email varchar(200) unique;

desc Persons;
insert into Persons values(2,'Saxsena','Rajeev',23,'rajeev-saxxsena@gmail.com'),
(3,'Kapoor','Jay',26,'kapoor_jay12@gmail.com'),(4,'Kale','Prachi',23,'prachi_kale@gmail.com');

select *from Persons;

ALTER table Persons modify column ID int primary key;

desc Persons;

-- Check() constraint on 'age' column --
alter table Persons modify column age int check(age>18);

desc Persons;

select *from Persons;

insert into Persons values(5,'Gandhi','Rahul',55,'gandhi_rahul12@gmail.com');

-- Date :01/sep/2026--
-- Default Constraint in sql--
desc persons; 
USE BANKINGDB;
DESC PERSONS;
CREATE table Employee ( 
employeeid int primary key,
employeename varchar(100) not null,
department varchar (50),
salary decimal (10,2),
joinging date default '2026-09-01',
city varchar(50)
);

desc employee; 

-- insert one record --
insert into employee
(employeeid,employeename,department,salary,city) values(1,'rahul Sharma', 'IT',5000, 'Mumbai');

-- insert Multiple Record --

alter table employee modify column salary int default 20000;
desc employee;

select*from employee;
insert into employee
(employeeid,employeename,department,city) values(2,'raju Sharma', 'Logistics','mumbai');

-- insert multiple Record --
insert into employee 
(employeeid,employeename,department,salary,city)
values
(3,'Priya Patil','HR',45000,'Pune'),
(4,'Amit Kumar', 'Finance',60000, 'Delhi'),
(5,'Sneha Joshi', 'IT',55000, 'Nagpur'),
(6,'Rohan Verma', 'Marketing', 48000,'Mumbai');

# adding Default Constraint to an existing table:
alter table employee 
alter city set default 'Nagpur';

desc employee;


insert into employee
(employeeid,employeename,department,salary)
values
(7,'Neha singh','HR',52000);

select *from employee;

# Foreign Key 
/*A FOREIGN KEY is used to create a relationship between two tables.
It ensures that a value in one table must exist in another table.*/

# 1) Create the Parent table
create table department (
departmentid int Primary key,
departmentname varchar(50)
);

# 2) Insert data into department table 
insert into department (departmentid, departmentname)
values 
(101,'IT'),
(102,'HR'),
(103,'Finance');



# 3) create the child table with a FOREIGN KEY.

create table employee_child (
employeeid int primary key,
employeename varchar(100),
departmentid int,

foreign key(departmentid)
references department(departmentid),

foreign key (employeeid)
references manager(managerid),

);

create table manager
(managerid varchar(200) primary key,
managername varchar(200) not null);

alter table manager
modify managerid int;
create table employee_child (
employeeid int primary key,
employeename varchar(100),
departmentid int,
managerID int,

foreign key(departmentid)
references department(departmentid),

foreign key (employeeid)
references manager(managerid));















