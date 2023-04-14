CREATE DATABASE sale_manager;
USE sale_manager;
CREATE TABLE customer(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(25) NOT NULL,
age TINYINT NOT NULL,
CHECK (age >0)
);
CREATE TABLE `order`(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
`date` DATETIME NOT NULL,
total_price INT ,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE product(
product_id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(25) NOT NULL,
price INT NOT NULL
);
CREATE TABLE order_detail(
order_id INT,
product_id INT,
order_quantity INT NOT NULL,
FOREIGN KEY (order_id) REFERENCES `order`(order_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);