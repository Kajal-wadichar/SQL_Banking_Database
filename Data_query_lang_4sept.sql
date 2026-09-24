use bankingdb;
create table student(
stud_id varchar(50), stud_name varchar(50), address varchar(50),city varchar (50)
);
insert into student values	(1,'shashank','RJPM','lucknow');

alter table student add column DOB date ;
desc student;
alter table student modify column stud_name varchar(100);
/* drop column 'city' 
syntax :alter table < table name>  drop column <column name>*/

alter table student drop  column city;
  create table if not exists Teacher (
  teacher_id int (50),   teacher_name varchar (100), hiring_date date,
  age int, salary int(100)
  );
  
  desc teacher;
  
  insert into teacher values (1, 'kamal','201-08-28',28,50000),
  (2,'reshma','2020-12-12',34,67000),(3,'ujjwal','2023-11-23',25,15000),
  (4,'jay','2025-11-10',30,56000);
  
alter table student 
add constraint pk_stud_id primary key (stud_id);

desc student;
 /* rename column
 syntax :alter table <table name> rename column <columnname>*/
 
 alter table student rename column stud_name to name;
 insert into student values ('s01','gaurav','dharmpeth','2005-10-10'),
 ('s02','kunal','reshimbagh','1999-10--08'),
 ( 's03','farhan','mominpura','1996-12-10'),
 ('s04','vaibhav','vayusena_nagar','2000-11-14'),
 ('s05','vishal','pratap nagar','2009-08-07'),
 ('s06','kumar','ravi nagar','2005-10-7'),
 ('s07','dinesh','sitaburdi','2000-10-23'),
 ('s08','tanushree','medicalsqure','2009-3-29');
 /* how to count total record pf table */
 
 select count(*)as 'number of students'
 from student;
 select name from student;
 
 select month(DOB) ,monthname(DOB) ,dayname(DOB),dayofweek(DOB),curdate()as'today date',
 datediff(curdate(),DOB) 
 AS 'NUMBER OF DAYS TILL TODAY',year(datediff(curdate(),DOB)) AS 'year'
 from student;
 
 select*from employee;
 select city, count(*) as 'no.of employee'
 from employee
 group by city
 order by city desc;
 
 select department, count(*) as'Number of employee'
 from employee
 group by department 
 having count(employeeid)>=2
 order by department asc;
 
 /* find salary departmentwise*/
 
 select department, sum(salary)
 from employee
 group by department
 order by sum(salary)desc
 limit 3;
 
 ## aggregation function in SQL---
 
 -- 1) tatal number of employees
 select count(*) as 'total employees' from employee;
 
 -- 2) total salary 
 select sum(salary) as 'total salary' from employee;
 
 -- 3) total salary department wise
 select department, sum(salary) as 'total salary' from employee group by department;
 
 -- 4) average salary departmentwise
 select department, concat("₹",round(avg(salary),0)) as 'average salary' from employee group by department;
 
 
 -- Aggregation function on salary department-wise --
 select
 department,
 concat("₹",round(sum(salary),0)) as 'total salary salary',
 concat("₹",round(max(salary),0)) as 'maximum salary',
 concat("₹",round(min(salary),0)) as 'minimum salary',
 count(*) as 'number of employees'
 from employee
 group by department
 order by avg(salary);
 
 # pattern matching:
 -- find employee whose name start with 'R' ---
 select *from employee 
 where employeename like 'Ra%';
 --- find employee whoose name endwith 'a' --
  select *from employee 
 where employeename like '%a';
 
 -- employee whoose name contains 'a' --
 select *from employee 
 where employeename like '%a%';
 
 
 -- find employee name whoose second character is 'a' '_a'
 select *from employee 
 where employeename like '_a%';
 
  select *from employee;
 -- find the city which has only five characters ---
 select city from employee 
 where city like '_____';
 
 -- find the city which startswith  'M'--
 select *from employee 
 where city like 'M%' ;
 
 select *from employee 
 where city='mumbai' ;
 
 
 
 
