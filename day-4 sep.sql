create database InstagramDB;

use	InstagramDB;

create table Users (
user_id int auto_increment primary key,
username varchar(50) not null unique,
email varchar(100) not null unique,
first_name varchar(50),
last_name varchar(50),
created_at timestamp default current_timestamp
);


create table Profiles ( 
profile_id int auto_increment primary key,
user_id int unique not null,
bio varchar (200),
profile_picture varchar(255),
date_of_birth date,

foreign key (user_id)
references users (user_id)
on delete cascade
); 


create table Posts (
post_id int auto_increment primary key,
 user_id int not null, content text,
 image_url varchar(255),created_date timestamp default current_timestamp,
 
 foreign key (user_id)
 references users (user_id)
 on delete cascade
 );
 
 
 create table Comments (
 comment_id int auto_increment primary key,
 user_id int not null,
 post_id int not null,
 comment_text varchar(500),
 created_date timestamp default current_timestamp,
 
 foreign key (user_id)
 references users(user_id)
 on delete cascade,
 foreign key (post_id)
 references Posts(post_id)
 on delete cascade
 );
 
 create table Likes (
 user_id int,
 post_id int,
 liked_date timestamp default current_timestamp,
 
 primary key(user_id, post_id),
 
 foreign key (user_id)
 references Users(user_id)
 on delete cascade,
 
 foreign key (post_id)
 references Posts(post_id)
 on delete cascade
 );
 
 
 insert into Users
 (username, email, first_name, last_name)
 values
 ('hitesh123', 'hitesh2gmail.com', 'Hitesh', 'Pandey'),
 ('rahul_01', 'rahul2gmail.com', 'Rahul', 'Sharma'),
 ('priya_99', 'priya@gmail.com', 'Priya', 'Patil');
 
 insert into Profiles 
 (user_id, bio, date_of_birth)
 values
 (1,'Data Science trainer', '1995-05-10'),
 (2,'Software developer', '1998-08-10'),
 (3, 'Data analyst', '1999-12-20');
 
 insert into Posts
 (user_id,content, image_url)
 values
 (1,'leraning sql database relationship','sql.jpj'),
 (1, 'today we learn foreign key','foreignkey.jpg'),
 (2,'hello from instagram database', 'instagram.jpj');
 
 insert into comments 
 (user_id,post_id,comment_text)
 values
 (2,1,'great explantion!'),
 (3,1, 'very useful topic.'),
 (1,3, 'welcome to the platform1');
 
 select *from Comments;
 
 desc Comments;
 desc Likes;
 
 insert into Likes
 (user_id, post_id)
 values
 (2,1),(3,1),(1,3),(3,3);
 
 select *from likes;
 
 
 
 



