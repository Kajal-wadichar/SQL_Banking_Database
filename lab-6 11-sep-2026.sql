use n325_db;
create table company(
emp_id int primary key,
emp_name varchar (100),
deapartment varchar (50),
job_role varchar (50),
salary decimal(10,2) default 20000,
hire_date date,
city varchar(50)
);

insert into company
(emp_id,emp_name, deapartment, job_role, salary, hire_date, city)
values
(101, 'Rahul Sharma', 'IT', 'Developer', 65000, '2021-01-15', 'Nagpur'),
(102, 'Priya Singh', 'HR', 'HR Manager', 75000, '2020-05-20','Mumbai'),
(103, 'Amit Kumar', 'IT' ,'Developer', 70000,'2022-03-10', 'Pune'),
(104, 'Sneha Patil', 'Finance', 'Accountant', 60000,'2021-07-22','Nagpur'),
(105,'Rohit Verma', 'IT', 'Tester', 55000, '2023-03-01', 'Mumbai'),
(106,'Neha Joshi', 'HR', 'Recruiter',50000, '2020-11-15', 'Pune'),
(107,'Vikas Gupta', 'Finance','Manager', 85000, '2019-09-30','Delhi'),
(108,'Anjali Rao','IT', 'Developer',80000,'2020-12-05','Delhi'),
(109,'Suresh Yadav', 'Sales', 'Executive',45000, '2023-06-15','Nagpur'),
(110,'Pooja Mehta','Sales','Manager', 70000,'2021-10-10','Mumbai');








## STRING FUNCTIONS
-- LENGTH() -- ISME GAP KO BHI COUNT KARTE HAI --

select emp_name,length(emp_name) as 'no of Characters' from company;

--- concat---join karte hai (-) ko
select concat(emp_name,'-',deapartment) from company;

-- SUBSTER(string, start_position, length)
select city,substr(city,1,3) from company;

select emp_name,substr(emp_name,2,4),substring(emp_name,-1,2) from company;

select emp_name,substring(emp_name,2,4) from company;

-- TRIM(): remove unnecessary space---
select 
emp_name,trim(emp_name) as cleaned_name
from company;

-- replace(old_str,new_str)--
select emp_name from company;
select length (' NagPur '),length(trim('NagPur ')) from dual;
select
emp_name,
replace(emp_name, 'a', '@') as modified_name
from company;

## Mathematical Functions
-- 1) round()
select emp_name,
salary,salary/12,
round(salary/12, 3) as monthly_salary
from company;
-- 2)FLOOR()
select 
salary/12,
floor((salary/12)) as rounded_down_salary,
ceil(salary/12) as rounded_high_salary
from company;

-- 3) ABS()
select ABS(-222) from dual;

select emp_name,job_role,salary,salary-60000,
ABS(salary - 60000) as salary_difference_with_ABS
from company;

-- 4) MOD():
select
emp_id,
Mod(emp_id, 2) as remainder,
mod(salary,2)
from company;


-- 5) POWER()
select 
salary,
power(salary,2) as salary_square
from company;

### comparision operators
-- 1) GREATEST(): return the largest value.
select 
deapartment,
salary,
greatest(salary,60000) as greater_salary_than_60000
from company;
SELECT max(salary) from company;

select greatest(78,12,781,234,78989,133098) FROM DUAL;

select greatest(salary,50000) as 'salary greater than 50000' from company;

-- 2) LEAST()
 select
 emp_name,
 salary,
 least(salary,60000) as smaller_salary_less_than_60000
 from company;
 
 ## COMPARISION OPERATORS
 
 select emp_name,salary
 from company 
 where salary > 60000;
 
 select *
 from company
 where salary = 70000;
 
 select deapartment,sum(salary)
 from company
  group by deapartment having sum(salary)>120000 order by sum(salary)desc;
  
  --- # DISTINCT() --> ITS Returns unique value of columns-- 
-- syntax => select Count(DISTINCT [COLUMN_NAME]) FROM [TABLE_NAME];
select 
count(DISTINCT City) as 'Unique City',
count(city) 
from company;

---- salary increased  by  25 % ---
select emp_name,salary,salary*1.25 as 'salary increased by 125%',salary*0.25 as 'salary increased by 25%' 
from company 
where city ='nagpur';

select emp_name,salary,salary*(1-0.1) AS 'SALARY REDUCE BY 10%' 
from company ;

select emp_name,salary,salary*(1-0.25) AS 'SALARY REDUCE BY 25%', SALARY* 0.9 as  'salary reduced by 10%'
from company ;

## type-3 [Not Equal to !=]

select * from company where salary != 65000;
-- ------------------------------------------------------@

## Comparision based on classification
 -- SYNTEX SELECT [CASE] (WHEN)1 xyz (When) xyz ELSE  ENDN AS XYZ FROM [table name];
 
 Select salary,
 Case 
 when salary >= 55000 THEN 'High salary'
 when salary >= 45000 THEN 'medium salary'
 ELSE 'LOW salary'
 end as Salary_category
 from company;
 #######################################################################################################################

## Aggregate function in sql
-- Aggregation function performs calculation on multiple rows

select count(emp_id) as 'total emp in comapy'
from company;
select deapartment,count(*) from company group by deapartment;

select deapartment,
sum(salary)as total_employees
from company
group by deapartment 
order by sum(salary) ; -- order by ka sort karna hota ASE YA DESC ME

select SALARY,
AVG(salary)as AVG_salary
from company
group by salary 
order by AVG(salary);

-- MIN()--
select deapartment,
max(salary) as 'maximum_salary',min(salary)as 'min_salary'
from company
group by deapartment;

-- all aggregation funtion ---
select
count(*) as total_employees,
sum(salary) as total_salary,
avg(salary) as average_salary,
max(salary) as highest_salary,
min(salary) as lowest_salary
from company;



  
  


