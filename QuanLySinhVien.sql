-- QuanLySinhVien.class definition

CREATE TABLE `class` (
  `ClassID` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(60) NOT NULL,
  `StartDate` datetime NOT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLySinhVien.subject definition

CREATE TABLE `subject` (
  `SubID` int NOT NULL AUTO_INCREMENT,
  `SubName` varchar(30) NOT NULL,
  `Credit` tinyint NOT NULL DEFAULT '1',
  `Status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`SubID`),
  CONSTRAINT `Subject_check` CHECK ((`Credit` >= 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLySinhVien.student definition

CREATE TABLE `student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(30) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `ClassID` int NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `Student_Class_FK` (`ClassID`),
  CONSTRAINT `Student_Class_FK` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- QuanLySinhVien.mark definition

CREATE TABLE `mark` (
  `MarkID` int NOT NULL AUTO_INCREMENT,
  `SubID` int NOT NULL,
  `StudentID` int NOT NULL,
  `Mark` float DEFAULT '0',
  `ExamTimes` tinyint DEFAULT '1',
  PRIMARY KEY (`MarkID`),
  KEY `Mark_student_FK` (`StudentID`),
  KEY `Mark_subject_FK` (`SubID`),
  CONSTRAINT `Mark_student_FK` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `Mark_subject_FK` FOREIGN KEY (`SubID`) REFERENCES `subject` (`SubID`),
  CONSTRAINT `Mark_check` CHECK ((`Mark` between 0 and 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;