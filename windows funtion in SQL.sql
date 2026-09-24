## Windows funtion
-- syntax:

/*
select column_name1,
window_funtion(column_name2)
over ([ partition by column_name3] [order by column_name4 ]) as new_column
from table_name;
*/

use bankingdb;
-- 1) Row_number()

select 
salary,
row_number() over(order by salary desc)
from employee;

-- 2) assign rank to each employee w.r.to salary
select 
salary,
rank() over(order by salary desc)
from employee;

use bankingdb;

create table sales (
sale_id int primary key,
employee_name varchar(50),
department varchar(50),
sale_date date,
amount decimal(10,2)
);

desc sales;

insert into sales 
(sale_id, employee_name, department, sale_date, amount)
values
(1,'Amit',  'Electronics', '2020-01-05', 50000),
(2, 'Priya', 'Electronics', '2020-01-10',75000),
(3, 'Rahul', 'Electronics', '2026-01-15',75000),
(4, 'Sneha','Electronics', '2026-01-20',90000),
(5, 'Vikas', 'Clothing', '2026-01-05',40000),
(6, 'Neha',  'Clothing', '2026-01-10',60000),
(7, 'Rohit', 'Clothing', '2026-01-15',60000),
(8, 'Pooja','Clothing', '2026-01-20',85000),
(9, 'Karan', 'Furniture', '2026-01-05', 30000),
(10, 'Anjali', 'Furniture', '2026-01-10', 55000);

-- 1) assign row number
select 
*,row_number() over(order by amount desc) as 'ROW NUMBER'
from sales;

select 
*,row_number() over(order by amount desc) as 'ROW NUMBER',
rank() over(order by amount desc) as 'rank',
dense_rank() over(order by amount desc) as 'dense_rank()'
from sales;

-- 2) partition by --
select department,amount,
 rank() 
 over(partition by department order by amount desc) as 'department rank',
 dense_rank()
 over (partition by department order by amount desc) as 'department dense rank',
 sum(amount)
 over (partition by department order by amount desc) as 'running total department_wise'
 from sales;
 
 
 -- 3) percentage_wise contribution each department 
 
 select 
 employee_name,department,amount,
 round(amount/sum(amount) over(partition by department)*100,2) as 'departmentwise_employee_contribution'
 from sales;
 
 -- LAG()-->compare CURRENT value with the previous value --
 
 select 
 sale_id,department,sale_date,amount,
 lag(amount) over(order by sale_date)
 from sales;
 -- LEAD(): compare current value with next value --
 select 
 sale_id,department,sale_date,amount,
 lead(amount) over(order by sale_date)
 from sales;
 use bankingdb;
 
 --- running total with use of sum()--
 select sale_id,department,sale_date,amount,
 sum(amount) over(partition by department order by sale_date) as 'running_total'
 from sales;


-- average sale departmentwise --
select sale_id,department,sale_date,amount,
 concat('₹' ,round(avg(amount) over(partition by department order by sale_date),2) )as 'Average sales'
 from sales;
 select 
 first_value (amount)  over (partition by department order by amount desc) as 'first value',
 last_value(amount) over (partition by department order by amount desc) as 'last value'
 from sales;
use bankingdb;
-- NTILE()

SELECT department,amount,ntile(6) over(order by amount desc) as amount_6_quartile
from sales;

# calculate total sales across all rows 





 


