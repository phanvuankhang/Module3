USE sale_manager;
INSERT INTO customer VALUES(1,'Minh Quan',10),
						   (2,'Ngoc Oanh',20),
						   (3,'Hong Ha',50);
INSERT INTO `order` VALUES(1,1,'2006/3/21',NULL),
						   (2,2,'2006/3/23',NULL),
						   (3,1,'2006/3/16',NULL);
INSERT INTO product VALUES(1,'May Giat',3),
						   (2,'Tu Lanh',5),
						   (3,'Dieu Hoa',7),
						   (4,'Quat',1),
						   (5,'Bep Dien',2);
INSERT INTO order_detail VALUES(1,1,3),
						   (1,3,7),
						   (1,4,2),
						   (2,1,1),
						   (3,1,8),
						   (2,5,4),
						   (2,3,3);
                           
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT `order`.order_id,`order`.`date`,`order`.preice FROM `order` ;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.`name` AS customer_name, p.`name` AS product_name
FROM customer c
JOIN `order` o ON c.customer_id=o.customer_id
JOIN order_detail od ON o.order_id=od.order_id
JOIN product p ON od.product_id=p.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.`name`
FROM customer c
LEFT JOIN `order` o ON c.customer_id=o.customer_id
LEFT JOIN order_detail od ON o.order_id=od.order_id
WHERE od.order_id IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.order_id AS ma_hoa_don, o.`date` AS ngay_ban, SUM(od.dqty*p.price) AS gia
FROM `order` o
JOIN order_detail od ON o.order_id=od.order_id
JOIN product p On od.product_id=p.product_id
GROUP BY o.order_id,o.`date`;
