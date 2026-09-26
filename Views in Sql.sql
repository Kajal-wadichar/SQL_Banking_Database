-- if you want to modify the existing view then use : create or replace view
use bankingdb;

create table customerss (
customer_id int primary key,
customer_name varchar(100),
city varchar(50),
age int,
balance decimal(12,2)
);


insert into customerss
(customer_id,customer_name,city, age,balance)
values
(101, 'rahul sharma', 'nagpur', 28,45000.00),
(102, 'priya patil', 'pune', 32, 72000.00),
(103, 'amit verma', 'mumbai',25, 38000.00),
(104, 'sneha joshi', 'nagpur',30, 65000.00),
(105, 'rohan deshmukh','pune', 35, 85000.00);

select  *from customerss;
create view city_wise_balance as
select city,sum(balance)
from customerss
group by city order by  sum(balance) desc;

select *from city_wise_balance;

desc city_wise_balance;

--  find vies/vertual table in sql --
show full tables  where table_type = "VIEW";

-- where
create view   customer_bal_gt_50000 as
select *from customerss
where balance > 50000;

select *from customer_bal_gt_50000 where  city = 'nagpur';

select *from customerss;
 
  set sql_safe_updates = 0;
  delete from customer_bal_gt_50000 where city = 'nagpur';
  
  -- order by
  
  
 -- gruop by
 create view citywise_nu_cust_view as
 select city, count(*) as total_customers
 from customerss
 group by  city;
 
 create or replace view citywise_nu_cust_view as
 select city, avg(balance) as avg_salary
 from customerss
  group by city
  having avg(balance) > 40000;
 
select   * from citywise_nu_cust_view; 
create view avg_gt_40000 as
select city, avg(balance) as avg_salary
 from customerss
  group by city
  having avg(balance) > 40000;
  
  create view premium_city_view as
  select city, sum(balance) as total_balance
  from  customerss
  group by city 
  having sum(balance) > 100000 ;
  
  --- change in existing view --
  create or replace view premium_city_view as
  select city, sum(balance) as total_balance
  from  customerss
  group by city 
  having sum(balance) > 100000 and city ='nagpur';
  
  --- create a view with where  
  create  view high_balance_customers as
  select   
  customer_id,
  customer_name,
  city,
  balance
  from customerss
  where balance > 50000;
  
  select 
  customer_id,
  customer_name,
  balance,
  case
  when balance >= 50000 then 'high balance'
  else 'low balance'
  end as balance_status
  from customerss;
  
  select *from high_balance_customers;
  
  --- Banking Analysis with aggregate functions ---
  create view  banking_analysis_view as
  select
  city,
  count(*) as 'number of customers',
  min(balance) as 'minimum balance',
  max(balance) as 'maximum balance',
   round(avg(balance),2) as 'average balance',
  sum(balance) as 'total balance' 
  from customerss
  group by city;
  
  select*from banking_analysis_view;
  