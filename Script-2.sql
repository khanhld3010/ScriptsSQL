USE QuanLySinhVien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ 
SELECT * FROM student s WHERE LEFT(s.StudentName ,1) = "h";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12 
SELECT * FROM class c WHERE MONTH(c.StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * FROM subject s WHERE s.Credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
UPDATE student s SET ClassID = 2 WHERE s.StudentName = "hung";

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.StudentName , sbj.SubName , m.Mark  FROM student s JOIN mark m ON s.StudentID = m.StudentID JOIN subject sbj ON m.SubID = sbj.SubID ORDER BY m.Mark DESC , s.StudentName ASC ;