use n325_db;
create table customers (
customer_id int primary key,
customer_name varchar(50),
city varchar(50)
);

insert into customers
values
(101, 'amit', 'Nagpur'),
(102, 'Priya', 'Pune'),
(103, 'Rahul', 'Mumbai'),
(104, 'Sneha', 'delhi'),
(105,' Vikas', 'Nashik');

create table orders(
order_id int primary key,
customer_id int,
product varchar(50),
amount decimal(10,2)
);


insert into orders
values
(1,101,'Laptop',55000),
 (2,102,'Mobile',25000),
 (3,102,'Mouse',1500),
 (4,103,'Keyboard',3000),
 (5,103,'Monitor',12000),
 (6,106, 'Printer',18000);
 
 
 ## Inner Joins: Inner Join returns only the records that have matching values in both tables. 
 select x. *,y.*
 from customers as x
 inner join orders as y
 on x.customer_id = y.customer_id;
 
 select x. *,y.amount,y.product
 from customers as x
 inner join orders as y
 on x.customer_id = y.customer_id;
 
 select 
    c.customer_id,
    c.customer_name,
    o.product,
    concat('₹' ,o.amount)
from customers c
inner join orders o
on c.customer_id = o.customer_id;

## LEFT JOIN 
select 
    c.customer_id,
    c.customer_name,
    o.product,
    o.amount
from customers c
left join orders o
on c.customer_id = o.customer_id;

select *from customers;
select *from orders;

delete from orders;
drop table orders;

## RIGHT JOIN
-- right joins return;
-- 1) all records from the right table
-- 2) matching records from left table
-- 3) NULl when there is no match
-- right join --> right table is important
select 
    c.customer_id,
    c.customer_name,
    o.product,
    o.amount
from customers c
right join orders o
on c.customer_id = o.customer_id;

## CROSS JOINs/CARTISIAN JOIN
-- cross join produces the cartisiam product of two tables.
-- if;
-- table a has 5 rows --
-- table b has 6 rows --
-- it will genrate 5 rows *6 rows = 30 rows --
-- cross join will genrate a very large number of rows.--
select 
    c.*,
    o.*
from customers c
cross join orders o;

## SELF JOIN
create   table employees  (                                                                                                                                                                                                             
employee_id int primary     key ,
employee_name varchar(50), 
manager_id int
);

insert into employees
values 
  (1 , 'Amit', null), 
  (2,  'Priya' ,1) ,
  (3 , 'Rahul' ,1) ,
  (4 ,  'Sneha' ,2) ,
  (5 , 'Rockey' ,3);
  
  select
  e.employee_name as employee, 
  m.employee_name as  Manager
  from  employees e                                           
  left join employees m
  on e.manager_id = m.employee_id;
       
   create table  employee_new(
   emp_id int, emp_name varchar(50), department varchar(100)
   );
   
   
   desc employee_new;
   insert into employee_new
   values
   (1, 'Rahul','IT'),(2,'Priya','HR'),(3, 'Hitesh','IT'),(4,'Gaurav' ,'HR'),(5,' Amit' ,'Finance');
   select e_nl.emp_name,e_n2.emp_name,e_nl.department,e_n2.department
   from employee_new e_nl
   join employee_new e_n2
   on e_nl.department = e_n2.department;
   
   ## Full Outer Join: mysql does not directly support, but we can make full outer join by union of left join and right join --
  
  -- this will give records from the both tables,including unmatched records.--
  -- full join or full outer join it will  return matching and non-matching rows from both tables.--
  
   
   select
   c.customer_id,
   c.customer_name,
   o.order_id,
   o.product
   from customers c
   left join orders o 
   on c.customer_id = o.customer_id;
   
   select
   c.customer_id,
   c.customer_name,
   o.order_id,
   o.product
   from customers c
   left join orders o 
   on c.customer_id = o.customer_id;
   
   select
   c.customer_id,
   c.customer_name,
   o.order_id,
   o.product
   from customers c
   left join orders o 
   on c.customer_id = o.customer_id
   
   union
   
   select
   c.customer_id,
   c.customer_name,
   o.order_id,
   o.product
   from customers c
   left join orders o 
   on c.customer_id = o.customer_id;
   ## Joins with where clause -- 
   -- where is used to filter the record --
  -- Where clause is  use to  pass the condition on row or record

    select
   c. *,o.product,o.amount
    from customers c
   inner join orders o 
   on c.customer_id = o.customer_id
   where o.amount>12000;
   select
   c.*,sum(amount),o.product
   from customers c
   inner join orders o
   on c.customer_id = o.customer_id group by o.customer_id,c.customer_id,o.product;
   
   select
   c.*,o.product,o.amount
   from customers c
   inner join orders o
   on c.customer_id = o.customer_id
   where o.product in ('Laptop','Monitor') and c.city ='Nagpur';
   
   ## Joins with group by --
 select c.*,sum(o.amount),o.product
from customers c
inner join orders o
on c.customer_id = o.customer_id 
group  by o.customer_id,c.customer_id,o.product;

select sum(amount) from orders group by customer_id;

-- join with Group by
-- Suppose we want to find the total amount spent by each customer.
   select
   c.customer_name,c.city,
   sum(o.amount) as 'total_amount_spent'
   from customers c
   inner join orders o 
   on c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   order by total_amount_spent desc;
   
   
    
   ## Join With Having clause
   -- having clause is used to filter the groups --
   -- find customers whose total purchase is greater than ₹30,000.
   select 
   c.customer_name,
   sum(o.amount) as total_amount 
   from customers c
   inner join orders o
   on c.customer_id = o.customer_id
   group by c.customer_id,  c.customer_name
   having sum(o.amount) > 30000;
   
   ## Multiple Table with Join
   
   

