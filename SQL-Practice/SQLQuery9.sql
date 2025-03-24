
USE StudentManagementSystem

--Insert value into Students table

SELECT * FROM Students

INSERT INTO Students(ID,Name,Age,DateOfBirth,ClassId) 
VALUES(1,'Bashar',27,'2002-01-22',3),
      (2,'Dalim',40,'2003-04-23',3),
	  (3,'Tanvir',36,'2001-02-18',1),
	  (4,'Sakib',29,'2004-02-18',1),
	  (5,'Asif',21,'2008-02-22',2),
	  (6,'Shourav',32,'2001-06-11',2)

--Insert value into class table

SELECT * FROM Class

INSERT INTO Class(ID,ClassName)
VALUES(1,'Batch-01'),(2,'Batch-02'),(3,'Batch-03'),(4,'Batch-04')

--Insert value into class teacher

SELECT * FROM ClassTeacher

INSERT INTO ClassTeacher(ID,Name,Speciality)
VALUES(1,'Bashar','SQL'),(2,'Nayem','Python'),(3,'Zubayer','Power BI')

--Inner Join

SELECT * FROM Students S
INNER JOIN Class C ON S.ClassId = C.ID


SELECT S.Name,S.DateOfBirth,C.ClassName FROM Students S
INNER JOIN Class C ON S.ClassId = C.ID

--ClassName, TeacherName

SELECT C.ClassName,T.Name FROM Class C
INNER JOIN ClassTeacher T
ON C.TeacherID = T.Id


ALTER TABLE Class
ADD TeacherID INT CONSTRAINT FK_TeacherId FOREIGN KEY REFERENCES ClassTeacher(Id)

UPDATE Class SET TeacherID = 1 WHERE ID=1
UPDATE Class SET TeacherID = 1 WHERE ID=2
UPDATE Class SET TeacherID = 2 WHERE ID=3
UPDATE Class SET TeacherID = 3 WHERE ID=4


--StudentName, StudentAge, ClassName, TeacherName

SELECT S.Name,S.Age,C.ClassName,T.Id,T.Name FROM Students S
INNER JOIN Class C ON S.ClassId = C.ID
INNER JOIN ClassTeacher T ON C.TeacherID = T.Id