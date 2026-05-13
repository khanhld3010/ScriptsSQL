-- QuanLyBanHang.customer definition

CREATE TABLE `customer` (
  `cID` int NOT NULL AUTO_INCREMENT,
  `cName` varchar(100) NOT NULL,
  `cAge` int NOT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLyBanHang.product definition

CREATE TABLE `product` (
  `pID` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(100) NOT NULL,
  `pPrice` int DEFAULT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLyBanHang.`order` definition

CREATE TABLE `order` (
  `oID` int NOT NULL AUTO_INCREMENT,
  `cID` int NOT NULL,
  `oDate` date NOT NULL,
  `oTotalPrice` int DEFAULT NULL,
  PRIMARY KEY (`oID`),
  KEY `order_customer_FK` (`cID`),
  CONSTRAINT `order_customer_FK` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLyBanHang.orderdetail definition

CREATE TABLE `orderdetail` (
  `oID` int NOT NULL,
  `pID` int NOT NULL,
  `odQTY` int DEFAULT NULL,
  PRIMARY KEY (`oID`,`pID`),
  KEY `OrderDetail_product_FK` (`pID`),
  CONSTRAINT `OrderDetail_order_FK` FOREIGN KEY (`oID`) REFERENCES `order` (`oID`),
  CONSTRAINT `OrderDetail_product_FK` FOREIGN KEY (`pID`) REFERENCES `product` (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;