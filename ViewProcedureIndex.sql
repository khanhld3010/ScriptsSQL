-- Tạo cơ sở dữ liệu có tên là 'demo'
CREATE DATABASE demo;

-- Sử dụng cơ sở dữ liệu vừa tạo
USE demo;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL UNIQUE,
    productName VARCHAR(255) NOT NULL,
    productPrice DECIMAL(15, 2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(50)
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) 
VALUES 
    ('SP001', 'Laptop Dell XPS 15', 35000000.00, 10, 'Laptop cao cấp dành cho dân văn phòng và lập trình viên.', 'Còn hàng'),
    ('SP002', 'MacBook Pro M3', 42000000.00, 5, 'Laptop Apple thế hệ mới với chip M3 mạnh mẽ.', 'Còn hàng'),
    ('SP003', 'Chuột Logitech MX Master 3S', 2500000.00, 0, 'Chuột công thái học cao cấp, hỗ trợ chống ồn.', 'Hết hàng'),
    ('SP004', 'Bàn phím cơ Keychron K8 Pro', 2200000.00, 20, 'Bàn phím cơ không dây, hỗ trợ hotswap và QMK/VIA.', 'Còn hàng'),
    ('SP005', 'Màn hình LG UltraFine 27 inch', 12500000.00, 8, 'Màn hình 4K độ phân giải cao chuẩn màu sắc cho thiết kế đồ họa.', 'Còn hàng');

EXPLAIN SELECT * FROM products p WHERE p.productCode = "SP002";

-- 1. Tạo Unique Index trên cột productCode
-- (Chỉ cần chạy nếu trước đó cột này chưa có ràng buộc UNIQUE)
CREATE UNIQUE INDEX idx_productCode ON Products (productCode);

-- 2. Tạo Composite Index trên 2 cột productName và productPrice
CREATE INDEX idx_name_price ON Products (productName, productPrice);

-- Kiểm tra truy vấn theo productCode (Sử dụng Unique Index)
EXPLAIN SELECT * FROM Products WHERE productCode = 'SP002';

-- Kiểm tra truy vấn theo productName và productPrice (Sử dụng Composite Index)
EXPLAIN SELECT * FROM Products WHERE productName = 'MacBook Pro M3' AND productPrice = 42000000.00;

CREATE VIEW products_view AS 
SELECT p.productCode, productName, productPrice, productStatus FROM products p ;

SELECT * FROM products_view

DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;

CALL GetAllProducts()

DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(15, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //

DELIMITER ;

CALL AddProduct('SP006', 'Tai nghe Sony WH-1000XM5', 7500000.00, 15, 'Tai nghe chống ồn chủ động cao cấp', 'Còn hàng');

DELIMITER //

CREATE PROCEDURE UpdateProductById(
    IN p_Id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(15, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
BEGIN
    UPDATE Products
    SET 
        productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_Id;
END //

DELIMITER ;

CALL UpdateProductById(1, 'SP001', 'Laptop Dell XPS 15 (Bản nâng cấp)', 36000000.00, 20, 'Đã cập nhật cấu hình', 'Còn hàng');

DELIMITER //

CREATE PROCEDURE DeleteProductById(
    IN p_Id INT
)
BEGIN
    DELETE FROM Products WHERE Id = p_Id;
END //

DELIMITER ;

CALL DeleteProductById(6)