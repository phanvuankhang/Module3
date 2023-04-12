CREATE DATABASE sale_manager;
USE sale_manager;
CREATE TABLE customer(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(20),
age INT
);
CREATE TABLE `order`(
id INT AUTO_INCREMENT PRIMARY KEY,
`date` DATE,
total_price FLOAT,
customer_id INT,
FOREIGN KEY(customer_id) REFERENCES customer(id)
);
CREATE TABLE product(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(20),
price FLOAT
);
CREATE TABLE oder_detail(
dqty INT,
oder_id INT,
FOREIGN KEY (oder_id) REFERENCES `order`(id),
product_id INT,
FOREIGN KEY (product_id) REFERENCES product(id)
);