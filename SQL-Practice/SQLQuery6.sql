USE StudentManagementSystem

---Insert Value to Class teacher table

SELECT * FROM ClassTeacher

INSERT INTO ClassTeacher(ID,Name,Speciality)
VALUES (01,'Bashar','SQL'),(02,'Zubayer','Power BI'),(03,'Nayem','Azure')

--Insert Value to Classes table

SELECT * FROM Classes

INSERT INTO Classes(ID,ClassName,TeacherId)
VALUES (1,'Class 01',01),(2,'Class 02',02),(3,'Class 03',03)

--Insert Value to Students table

SELECT * FROM Students

--Check Constraint

ALTER TABLE Students
ADD CONSTRAINT CK_Age CHECK (AGE>10)

INSERT INTO Students(StudentName,Age,ClassId)
VALUES ('Mustakim',30,1)

--Default Constraint

ALTER TABLE Students
ADD CONSTRAINT DF_Age DEFAULT 11 FOR Age

INSERT INTO Students(StudentName,ClassId)
VALUES ('Shihab',2)



--Books(ID,Name,Author,PublicationDate)
--ID Primary and Identity

CREATE TABLE Books
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  BookName NVARCHAR(100) NOT NULL,
  AUTHOR NVARCHAR(50),
  PublicationDate DATE
)

--PublicationDate will have a Check constraint

ALTER TABLE Books
ADD CONSTRAINT CK_PublicationDate CHECK (PublicationDate >= '2024-01-01')

INSERT INTO Books(BookName,Author,PublicationDate)
VALUES('The Alchemist','Paulo Choelo','2024-09-11')

--PublicationDate will have a Default constraint

ALTER TABLE Books
ADD CONSTRAINT DK_PublicationDate DEFAULT '2024-01-01' FOR PublicationDate

INSERT INTO Books(BookName,Author)
VALUES('The Art of War','Sun-Tzu')

SELECT * FROM Books

---Select, Top, Distinct, Order, Where

--Top

SELECT TOP 3 * FROM Students

--Distinct

SELECT DISTINCT StudentName FROM Students

--Order By

SELECT TOP 3 * FROM Students ORDER BY StudentId DESC