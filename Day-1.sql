create database n325_db;

show databases;
-- to display database --
-- to select the dataset --
use n325_db;

-- command to create table
create table IF NOT exists employee 
(
emp_id int, emp_name varchar (20),salary double,hiring_date date
);

-- describe the table --
desc employee;
describe employee;

-- insert records in table --
insert into employee(emp_id,emp_name,hiring_date) values(1,'Suresh','2026-08-27');

-- to display/retrieve of column table--
select *from employee;

select emp_name from employee;


 




