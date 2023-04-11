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
-- thêm dữ liệu
insert into student value (1,"Khang"),
						  (2,"An");
insert into teacher value (1,"Chanh",35,"Vietnam"),
						  (2,"Son",29,"Vietnam");
-- hiển thị
select * from student;
select * from teacher;
-- chỉnh sửa dữ liệu
update student set name="Khanh" where id=2;
-- xóa dữ liệu
delete from student where id=2;
-- ddl=> thêm cột point
alter table student add column `point` int;
-- xóa bảng
drop table student;
drop table teacher;