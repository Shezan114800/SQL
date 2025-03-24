CREATE DATABASE SchoolManagementSyste

ALTER DATABASE SchoolManagementSystem MODIFY NAME = StudentManagementSystem


CREATE TABLE Students
(
 StudentId INT PRIMARY KEY IDENTITY(1,1),
 StudentName NVARCHAR(100) NOT NULL,
 Dob DATE,
 Age DECIMAL(18,1)
)


CREATE TABLE ClassTeacher
(
 TeacherId INT PRIMARY KEY IDENTITY(1,1),
 Name NVARCHAR(100) NOT NULL
)


INSERT INTO Students(StudentName,Dob,Age) VALUES('Bashar','2002-01-22',27)
INSERT INTO Students(StudentName,Dob,Age) VALUES('Misha','2004-09-25',25)

SELECT * FROM Students