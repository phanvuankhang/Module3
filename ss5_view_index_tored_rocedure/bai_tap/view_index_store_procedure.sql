CREATE DATABASE products;
USE products;
CREATE TABLE products(
id INT AUTO_INCREMENT PRIMARY KEY,
product_code VARCHAR(20) NOT NULL,
product_name VARCHAR(45) NOT NULL,
product_price FLOAT NOT NULL,
product_amount INT NOT NULL,
product_description VARCHAR(50),
product_status VARCHAR(20)
);
INSERT INTO products VALUES (1,'IP7','IPHONE 7',1000,10,'WHITE','Còn hàng'),
	(2,'IP8','IPHONE 8',2000,20,'RED','Hết hàng'),
	(3,'IP13','IPHONE 13',10000,10,'BLUE','Còn hàng');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX i_product_code ON products (product_code);
EXPLAIN SELECT * FROM products WHERE product_code=2;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE  INDEX i_product_price ON products(product_name,product_price);
EXPLAIN SELECT * FROM products WHERE product_name='IPHONE 13' AND product_price=10000; 

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW w_products AS 
SELECT product_code, product_name, product_price, product_status
FROM products;
SELECT * FROM w_products;

-- Tiến hành sửa đổi view
SET SQL_SAFE_UPDATES =0;
UPDATE w_products SET product_price='3000' WHERE product_price='2000';
SET SQL_SAFE_UPDATES =1;

-- Tiến hành xoá view
DROP VIEW w_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE get_all_products()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE p_insert_products(IN id INT, product_code VARCHAR(20), product_name VARCHAR(45), product_price FLOAT, product_amount INT, product_description VARCHAR(50), product_status VARCHAR(20))
BEGIN
    INSERT INTO products(id,
    product_code,
	product_name,
	product_price ,
	product_amount ,
	product_description,
	product_status)
	VALUES (id, product_code, product_name, product_price, product_amount, product_description, product_status);
END //
DELIMITER ;
CALL p_insert_products(4,'IP14','IPHONE 14',15000,30,'BLACK','Hết hàng');
SELECT * FROM products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE sp_edit_info_products(IN p_id INT, p_product_name VARCHAR(45))
BEGIN
UPDATE products
SET product_name=p_product_name WHERE id=p_id;
END //
DELIMITER ;
CALL sp_edit_info_products(2,'IPHONE 11');
SELECT * FROM products;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE sp_delete_products(IN p_id INT)
BEGIN
DELETE FROM products
WHERE id=p_id;
END //
DELIMITER ;
CALL sp_delete_products(2);
SELECT * FROM products;