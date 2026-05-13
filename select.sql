USE QuanLySinhVien;

SELECT * FROM Student;

SELECT
	*
	FROM Student
WHERE
	Status = TRUE;

SELECT
	S.StudentId,
	S.StudentName,
	C.ClassName
FROM
	Student S
JOIN Class C ON
	S.ClassId = C.ClassID;

SELECT
	S.StudentId,
	S.StudentName,
	C.ClassName
FROM
	Student S
JOIN Class C ON
	S.ClassId = C.ClassID
WHERE
	C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';