-- 1) Database and table Creation
CREATE DATABASE analyst_sales_db;
USE analyst_sales_db;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
signup_date DATE,
segment VARCHAR(30)
);
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
subcategory VARCHAR(50),
unit_price DECIMAL(10,2)
);
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
sales_channel VARCHAR(30),
payment_method VARCHAR(30),
order_status VARCHAR(30),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
discount_pct DECIMAL(5,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 2) Data to Insert
-- Customers
INSERT INTO customers VALUES
(101,'Aarav Sharma','Nagpur','Maharashtra','2025-01-15','Retail'),
(102,'Priya Patil','Pune','Maharashtra','2025-02-20','Corporate'),
(103,'Rahul Verma','Mumbai','Maharashtra','2025-03-05','Retail'),
(104,'Sneha Joshi','Nashik','Maharashtra','2025-03-18','SMB'),
(105,'Vikram Singh','Delhi','Delhi','2025-04-10','Corporate'),
(106,'Ananya Rao','Bengaluru','Karnataka','2025-04-25','Retail'),
(107,'Rohan Mehta','Hyderabad','Telangana','2025-05-12','SMB'),
(108,'Neha Kulkarni','Nagpur','Maharashtra','2025-05-30','Retail'),
(109,'Karan Gupta','Jaipur','Rajasthan','2025-06-08','Corporate'),
(110,'Meera Shah','Ahmedabad','Gujarat','2025-06-21','SMB'),
(111,'Aditya Deshmukh','Pune','Maharashtra','2025-07-03','Retail'),
(112,'Isha Kapoor','Delhi','Delhi','2025-07-19','Corporate'),
(113,'Manish Yadav','Indore','Madhya Pradesh','2025-08-02','Retail'),
(114,'Kavya Nair','Kochi','Kerala','2025-08-16','SMB'),
(115,'Siddharth Jain','Mumbai','Maharashtra','2025-09-01','Corporate');
-- Products
INSERT INTO products VALUES
(201,'Laptop Pro 14','Electronics','Laptops',65000.00),
(202,'Laptop Air 13','Electronics','Laptops',52000.00),
(203,'Wireless Mouse','Electronics','Accessories',1200.00),
(204,'Mechanical Keyboard','Electronics','Accessories',3500.00),
(205,'Office Chair','Furniture','Chairs',8500.00),
(206,'Standing Desk','Furniture','Desks',18000.00),
(207,'Monitor 24 Inch','Electronics','Monitors',12500.00),
(208,'Monitor 27 Inch','Electronics','Monitors',18500.00),
(209,'USB-C Hub','Electronics','Accessories',2200.00),
(210,'Bookshelf','Furniture','Storage',6500.00);
-- Orders
INSERT INTO orders VALUES
(1001,101,'2025-07-02','Online','UPI','Delivered'),
(1002,102,'2025-07-04','Online','Credit Card','Delivered'),
(1003,103,'2025-07-06','Store','Cash','Delivered'),
(1004,104,'2025-07-09','Online','UPI','Delivered'),
(1005,105,'2025-07-12','Online','Credit Card','Cancelled'),
(1006,106,'2025-07-15','Store','Debit Card','Delivered'),
(1007,107,'2025-07-18','Online','UPI','Delivered'),
(1008,108,'2025-07-22','Store','Cash','Returned'),

(1009,109,'2025-07-25','Online','Credit Card','Delivered'),
(1010,110,'2025-07-28','Online','UPI','Delivered'),
(1011,111,'2025-08-02','Store','Debit Card','Delivered'),
(1012,112,'2025-08-05','Online','Credit Card','Delivered'),
(1013,113,'2025-08-09','Online','UPI','Delivered'),
(1014,114,'2025-08-13','Store','Cash','Delivered'),
(1015,115,'2025-08-18','Online','Credit Card','Delivered'),
(1016,101,'2025-08-21','Online','UPI','Delivered'),
(1017,103,'2025-08-24','Store','Cash','Delivered'),
(1018,105,'2025-08-28','Online','Credit Card','Delivered'),
(1019,108,'2025-09-02','Online','UPI','Delivered'),
(1020,110,'2025-09-05','Store','Debit Card','Delivered'),
(1021,112,'2025-09-08','Online','Credit Card','Cancelled'),
(1022,115,'2025-09-11','Online','UPI','Delivered'),
(1023,102,'2025-09-14','Store','Debit Card','Delivered'),
(1024,106,'2025-09-17','Online','Credit Card','Delivered'),
(1025,109,'2025-09-20','Online','UPI','Delivered');
-- Order_Items
INSERT INTO order_items VALUES
(1,1001,201,1,5.00),
(2,1001,203,2,10.00),
(3,1002,206,2,5.00),
(4,1002,204,2,0.00),
(5,1003,205,1,10.00),
(6,1003,203,1,0.00),
(7,1004,207,2,5.00),
(8,1005,201,1,0.00),
(9,1006,202,1,8.00),
(10,1006,209,2,5.00),
(11,1007,208,1,10.00),
(12,1007,203,3,5.00),
(13,1008,206,1,0.00),
(14,1009,201,2,7.50),
(15,1009,209,2,5.00),
(16,1010,205,2,12.00),
(17,1011,207,1,5.00),
(18,1011,204,1,0.00),
(19,1012,202,2,10.00),
(20,1013,210,2,5.00),
(21,1013,203,2,0.00),
(22,1014,205,1,5.00),
(23,1015,201,1,6.00),
(24,1015,208,1,8.00),
(25,1016,204,2,10.00),
(26,1016,209,1,5.00),
(27,1017,203,4,10.00),
(28,1018,206,1,8.00),
(29,1018,207,2,5.00),
(30,1019,202,1,5.00),
(31,1019,203,2,0.00),
(32,1020,205,2,10.00),
(33,1021,201,1,0.00),
(34,1022,208,2,7.00),

(35,1023,206,1,5.00),
(36,1023,209,2,10.00),
(37,1024,202,1,5.00),
(38,1024,207,1,5.00),
(39,1025,201,1,10.00),
(40,1025,204,2,5.00);


-- answered query 
-- 3)BUSSINESS QUESTION - BASIC SQL
select*from customers where state='maharashtra';
select*from products where unit_price>10000;
select* from orders where sales_channel='online';
select*from customers where signup_date>'2025-06-01';
select*from orders where payment_method = 'upi' and order_status='delivered';
select* from products where category='electronics'and subcategory='accessories';
select * from orders where order_date between '2025-08-01'and '2025-08-31';
select* from customers where customer_name like'a%';
select * from products where product_name like 'monitor%';
select* from orders where order_status in ('cancelled','returned');


-- 4) AGGREGATION AND GROUP BY
select state, count(*) as tota_customer
from customers
group by state; 

select segment,count(*) as total_customer
from  customers
group by segment;

select category ,avg(unit_price) as avg_price
from products group by category;

select category, max(unit_price) as maximum_price,
min(unit_price) as minimum_price
from products
group by category;

select product_id, sum(quantity) as total_quantity
from order_items
group by product_id;

select sales_channel,count(*) as total_order
from orders
group by sales_channel;
select payment_method, count(*) as total
from orders group by payment_method;

select  oi.order_id,sum(oi.quantity*p.unit_price*(1- oi.discount_pct/100)) as total_sales
from order_items oi
join products p on oi. product_id=p.product_id
group by order_id;



SELECT p.category,SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

SELECT customer_id,COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 5) JOIN BASED ANALSIS
-- Q1 ans
SELECT 
o.order_id,
c.customer_name,
o.order_date,
o.order_status,
o.sales_channel
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- Q2 ans
SELECT 
oi.order_id,
p.product_name,
oi.quantity,
p.unit_price,
oi.discount_pct
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- Q3 ans
SELECT 
c.customer_name,
c.city,
p.product_name,
p.category,
oi.quantity,
o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

-- Q4 ans
SELECT 
c.customer_name,
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name;

-- Q5 ans
SELECT
    c.city,
    ROUND(sum(oi.quantity * p.unit_price *
            (1 - oi.discount_pct / 100)),2) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city;

-- Q6 ans
SELECT 
p.product_name,
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Q7 ans
SELECT c.customer_name,
COUNT(DISTINCT oi.product_id) AS different_products
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Q8 ans
SELECT DISTINCT c.customer_id,
       c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE p.subcategory = 'Laptops';
-- Q9 ans
SELECT p.product_id,
       p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
-- Q10 ans
SELECT p.category,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- 6)HAVING and BUSSINESS KPI Questions --
-- que 3 ans 
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;

-- que 9 ans --
SELECT payment_method,
       COUNT(*) AS total_delivered_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY total_delivered_orders DESC
LIMIT 1;

-- 10) Window Functions - WITHOUT CTE

-- que 1 ans
SELECT
    order_id,
    customer_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number
FROM orders;

-- que 2 ans
SELECT
    product_id,
    product_name,
    unit_price,
    RANK() OVER (
        ORDER BY unit_price DESC
    ) AS price_rank
FROM products;

-- que 3 ans 
SELECT
    product_id,
    product_name,
    category,
    unit_price,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY unit_price DESC
    ) AS category_rank
FROM products;


-- que 5 ans
 SELECT
    customer_id,
    order_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_date
FROM orders;

-- que 6 ans 
SELECT
    customer_id,
    order_id,
    order_date,
    LEAD(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_date
FROM orders;

-- 9)DATE and String Functions --
-- Q2 ans
SELECT
order_id,
order_date,
YEAR(order_date) AS order_year,
MONTH(order_date) AS month_number,
MONTHNAME(order_date) AS month_name
FROM orders;
-- Q2 ans
SELECT
MONTH(order_date) AS month_number,
COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month_number;
-- Q3 ans --
SELECT *
FROM customers
WHERE signup_date < DATE_SUB('2025-09-20', INTERVAL 180 DAY);

