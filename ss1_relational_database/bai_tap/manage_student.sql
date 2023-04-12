CREATE DATABASE manage_student;
USE manage_student;
CREATE TABLE student(
id INT PRIMARY KEY,
`name` VARCHAR(50)
);
CREATE TABLE teacher(
id INT PRIMARY KEY,
`name` VARCHAR(50),
age INT,
country VARCHAR(50)
);
-- thêm dữ liệu
INSERT INTO STUDent VALUES (1,"Khang"),
						  (2,"An");
INSERT INTO TEACher VALUES (1,"Chanh",35,"Vietnam"),
						  (2,"Son",29,"Vietnam");
-- hiển thị
SELECT * FROM student;
SELECT * FROM Teacher;
-- chỉnh sửa dữ liệu
UPDATE student SET NAME="Khanh" WHERE id=2;
-- xóA DỮ liệU
DELETE FROM student WHERE ID=2;
-- ddl=> tHÊM Cột POint
ALTER TABLE student ADD COLUMN `POINt` INT;
-- XóA BẢNG
DROP TABLE student;
DROP TABLE teacher;