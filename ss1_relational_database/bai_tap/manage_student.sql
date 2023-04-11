create database manage_student;
use manage_student;
create table student(
id int primary key,
`name` varchar(50)
);
create table teacher(
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);