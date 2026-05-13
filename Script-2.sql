USE QuanLySinhVien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ 
SELECT * FROM student s WHERE LEFT(s.StudentName ,1) = "h";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12 
SELECT * FROM class c WHERE MONTH(c.StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * FROM subject s WHERE s.Credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
ALTER TABLE student 