-- QuanLyDiemThi.hocsinh definition

CREATE TABLE `hocsinh` (
  `MaHS` varchar(20) NOT NULL,
  `TenHS` varchar(50) DEFAULT NULL,
  `NgaySinh` datetime DEFAULT NULL,
  `Lop` varchar(20) DEFAULT NULL,
  `GT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaHS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLyDiemThi.monhoc definition

CREATE TABLE `monhoc` (
  `MaMH` varchar(100) NOT NULL,
  `TenMH` varchar(100) DEFAULT NULL,
  `MaGV` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLyDiemThi.giaovien definition

CREATE TABLE `giaovien` (
  `MaGV` varchar(20) NOT NULL,
  `TenGV` varchar(50) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLyDiemThi.bangdiem definition

CREATE TABLE `bangdiem` (
  `MaHS` varchar(100) NOT NULL,
  `MaMH` varchar(100) NOT NULL,
  `DiemThi` int DEFAULT NULL,
  `NgayKT` datetime DEFAULT NULL,
  PRIMARY KEY (`MaMH`,`MaHS`),
  KEY `BangDiem_hocsinh_FK` (`MaHS`),
  CONSTRAINT `BangDiem_hocsinh_FK` FOREIGN KEY (`MaHS`) REFERENCES `hocsinh` (`MaHS`),
  CONSTRAINT `BangDiem_monhoc_FK` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`MaMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;