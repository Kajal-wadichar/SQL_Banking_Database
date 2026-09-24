use shoppingdb;

create table users(
user_id int primary key,
username varchar(50),
country varchar(50),
followers int);

create table posts(
post_id int primary key,
user_id int,
post_text varchar(255),
foreign key (user_id) references users(user_id)
);

insert into users
(user_id, username, country, followers)
values
(1,'Rahul', 'India', 80000),
(2, 'Priya', 'India', 60000),
(3,'Amit', 'India',300000),
(4, 'Sneha', 'USA', 900000),
(5,'John', 'USA' , 700000),
(6, 'Eman', 'USA', 400000),
(7, 'Rohan','UK',200000),
(8, 'Sophia', 'UK',100000);

insert into posts 
(post_id,user_id, post_text)
values
(101,1,'Learning SQL'),
(102,1, 'Learning Python'),
(103,2,'Data Science'),
(104,4,'Machine Learning'),
(105,4, 'AI Tutorial'),
(106,5, 'Power BI'),
(107,7, 'My First Post');
-- type 1
## Scalar Subquery: A Scalar Subquery returns one row and one column, i.e. a single value.
## A single - row subquery returns  only one row/value.
 
-- 1)find average followers
select round( avg(followers),2) as 'Average Followers'
from users;

-- 2) find the username whoose followers are less than equals to average followers
select username, followers
from users
where followers <=(
select avg(followers)
from users
);

-- 3) find User with Maximum Followers
select max(followers)
from users;

select username, followers,country
from users 
where followers = (
select max(followers)
from users
);


--- 4) find user with Minimum Followers
select username, followers,country
from users 
where followers = (
select min(followers)
from users
);

-- 6)
select username, followers
from users
where followers>500000;
-- using  a subquery
-- above 500000 ---
select username,followers 
from users
where followers > (
select 500000
);

-- below 500000
select username,followers 
from users
where followers < (
select 500000
);




-- Type -2 
## Multiple-Rows subquery 
-- it returns  more than one row.

select country,avg(followers)
from users 
group by country
having avg(followers) > 500000;
## 1)  IN WIth Subquery 
-- 1) find users from countries whoose average followers exceed 500000
select username, country, followers
from users
where country in (
select country 
from users
group by country 
having avg(followers) > 500000
);

## 2) NOT IN with subquery

select username, country, followers
from users
where country not in (
select country 
from users
group by country 
having avg(followers) > 500000
);

## 3) ANY with subquery 
-- ANY compares a value with at least one value returend by the subquery.alter

--- Q: finds users whose followers are greater than at least one of these values.
select followers
from users
where country = 'UK';
select username,  followers
from users
where followers > any (
select followers
from users
where country = 'UK'
);

## 4) ALL with subquery
-- ALL requires the comparison to be true for every value returned by the subquery
select followers
from users
where country = 'UK';
select username,  followers
from users
where followers > all (
select followers
from users
where country = 'UK'
);

## 5) EXISTS With subquery
-- EXISTS 
-- ques: find users who have created at least one Post 
select username, user_id
from users u
where exists (
select 1
from posts p
where p.user_id = u.user_id
);

## 6) not exists
-- ques: find users who have never post
select username, user_id
from users u
where not exists (
select 1
from posts p
where p.user_id = u.user_id
);
-- 24-09-20226 --
## Type - 3
## Corelated subquery : A  corelated subquery references a column frpm the outer query and 
-- is evaluated for each outer row.alter
--- Ques: find users whose followers are greater than their country average -- 
select *from users;

select country, avg(followers)
from users
group by country order by avg(followers) desc;

select 
u1.username,
u1.country,
u1.followers
from users u1 
where u1.followers > (
select avg(u2.followers)
from users u2
where u2.country = u1.country
);

--- Ques: find users whose followers are smaller than their country average -- 
select 
u1.username,
u1.country,
u1.followers
from users u1 
where u1.followers < (
select avg(u2.followers)
from users u2
where u2.country = u1.country
);

# subquery in FORM
/*
A subquery inside FROM is called a:
1) Derived table 2) Table subquery 3) inline view

It behaves like a tempory table and must have an alias in My Sql.alter
*/ 
select 
country,
avg(followers) as avg_followers
from users 
group by country ;
-----------------------------------------------
select 
country_data.country,
country_data.avg_followers
from(
select 
country,
avg(followers) as avg_followers
from users 
group by country 
)as country_data
where country_data.avg_followers > 500000;

select *
from(
select 
country,
count(user_id) as total_users,
avg(followers) as avg_followers
from users
group by country

)as country_summary where country = 'USA';

## derived table with where clause
select *
from(
select 
country,
avg(followers) as avg_followers
from users
group by country
)as country_data 
where avg_followers > 500000;

## Subquery in WHERE clause
-- Subquery in WHERE clause are commonly used for filtering
select distinct user_id from posts;

--- Q-1: find user who have Posts
select user_id,username
from users
where user_id in (
select distinct user_id from posts);

--- Q-2: Find users without Posts
select user_id,username
from users
where user_id  not in (
select distinct user_id from posts);

## NESTED Subquery : A subquery can obtain another subquery
select username, followers
from users
where followers > (
select avg(followers)
from users 
where country = (
select country 
from users 
where username = 'Rahul'
)
);


