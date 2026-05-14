SELECT * FROM subject s WHERE s.Credit = (SELECT MAX(s2.Credit) FROM subject s2 );

SELECT * FROM subject s JOIN mark m ON s.SubID = m.SubID HAVING m.Mark = (SELECT MAX(m2.Mark) FROM mark m2 )

SELECT s.StudentName , s.Address , s.Phone , AVG(m.Mark ) FROM student s JOIN mark m ON s.StudentID = m.StudentID GROUP BY s.StudentID  
