SELECT
	s.Address ,
	COUNT(s.StudentID)
FROM
	student s
GROUP BY
	s.Address;

SELECT
	s.StudentID ,
	s.StudentName ,
	AVG(m.Mark) AS AVGMArk
FROM
	student s
JOIN mark m ON
	s.StudentID = m.StudentID
GROUP BY
	m.StudentID ,
	s.StudentName

SELECT
	s.StudentID ,
	s.StudentName ,
	AVG(m.Mark) AS AVGMArk
FROM
	student s
JOIN mark m ON
	s.StudentID = m.StudentID
GROUP BY
	m.StudentID ,
	s.StudentName
HAVING avgmark >= 9

SELECT
	S.StudentId,
	S.StudentName,
	AVG(Mark)
FROM
	Student S
JOIN Mark M ON
	S.StudentId = M.StudentId
GROUP BY
	S.StudentId,
	S.StudentName
HAVING
	AVG(Mark) >= ALL (
	SELECT
		AVG(Mark)
	FROM
		Mark
	GROUP BY
		Mark.StudentId);