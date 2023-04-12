 CREATE DATABASE manage_student;
    USE manage_student;
    CREATE TABLE student(
            id INT primary key,
`name` VARCHAR(50)
);
    CREATE TABLE teacher(
            id INT primary key,
`name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
-- thêm dữ liệu
    INSERT INTO student value (1,"Khang"),
						  (2,"An");
    INSERT INTO teacher value (1,"Chanh",35,"Vietnam"),
						  (2,"Son",29,"Vietnam");
-- hiển thị
    SELECT * FROM student;
    SELECT * FROM teacher;
-- chỉnh sửa dữ liệu
    UPDATE student SET name="Khanh" where id=2;
-- xóa dữ liệu
    DELETE FROM student where id=2;
-- ddl=> thêm cột poINT
    ALTER TABLE student add column `poINT` INT;
-- xóa bảng
    DROP TABLE student;
    DROP TABLE teacher;