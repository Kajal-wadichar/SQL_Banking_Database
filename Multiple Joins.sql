create database ShoppingDB;
use ShoppingDB;
create table customers(
customer_id int primary key,
customer_name varchar(50),
city varchar(50)
);

create table products (
product_id int primary key,
product_name varchar(50),
category varchar(50),
price decimal(10,2)
);

create table orders (
order_id int primary key ,
customer_id int,
product_id int,
quantity int,
order_date date,
foreign key( customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
);







insert into customers values
(101,'Rahul Sharma', 'Nagpur'),
(102,'Priya Verma',  ' Pune'),
(103,'amit Patil', 'Mumbai'),
(104,'Sneha Joshi', 'Nashik');

insert into Products    values
(201, 'Laptop', 'Electronics',55000),
(202, 'Keyboard', 'Accessories', 1500),
(203, 'Headphones', 'Accessories', 2500),
(204, 'Monitor', 'Electronics',12000);

insert into orders values
(1001,101,201,1, '2020-09-01'),
(1002,102,203,2, '2026-09-03'),
(1003,103,204,1, '2026-09-05'),
(1004,102,203,2, '2026-09-02'),
(1005,104,203,1, '2026-09-10');
--- three table join --
select c.*,o.*,p.*
from customers c
inner join orders o on c.customer_id = o.customer_id
inner join products p on p.Product_id = o.product_id; 
-- total purchase city wise --
select c.city,sum(p.price) as 'Total Amount'
from customers c
inner join orders o on c.customer_id = o.customer_id
inner join products p on p.Product_id = o.product_id
group by city
order by sum(p.price) desc;
                                                                          
-- top 2 city purchase wise --

select c.city,sum(p.price) as 'Total Amount'
from customers c
inner join orders o on c.customer_id = o.customer_id
inner join products p on p.Product_id = o.product_id
group by city
order by sum(p.price) asc limit 2;


select p.category,dayname(o.order_date),c.city,sum(p.price)                                                                                                                                                                                                                                                                                                                                                                                                                       ,sum(p.price) as 'Total Amount'
from customers c
inner join orders o on c.customer_id = o.customer_id
inner join products p on p.Product_id = o.product_id
group by p.category, dayname(o.order_date),c.city 
order by sum(p.price) desc;         
                                                                         
      --                                                                                                                                                                                                                                                
 select c.customer_id,count(o.order_id) as 'No.of orders'
 from customers c  
 inner join orders o on c.customer_id = o.customer_id
 inner join products p on p.product_id = o.product_id
 group by customer_id;
 
 select c.customer_id,c.city,p.product_name
 from customers c  
 inner join orders o on c.customer_id = o.customer_id
 inner join products p on p.product_id = o.product_id
 group by customer_id,c.city,p.product_name;
 
                                                          