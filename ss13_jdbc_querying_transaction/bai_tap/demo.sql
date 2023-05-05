CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
SELECT * FROM users;

delimiter //
CREATE PROCEDURE get_users()
BEGIN
    SELECT * FROM users;
END //
delimiter ;
CALL get_users();

delimiter //
CREATE PROCEDURE updade_users(IN u_id INT ,IN u_name VARCHAR(40),IN u_email VARCHAR(60),IN u_country VARCHAR(40))
BEGIN
UPDATE users SET name=u_name ,email=u_email ,country=u_country WHERE id=u_id;
END//
delimiter ;
CALL updade_users(1,'minh','minh@gamil.com','Viet Nam');

delimiter //
CREATE PROCEDURE delete_users(IN u_id INT)
BEGIN
    DELETE FROM users WHERE id=u_id;
END //
delimiter ;
CALL delete_users(?);