USE StudentManagementSystem

CREATE TABLE Classses
(
 ID INT NOT NULL,
 ClassName NVARCHAR(30)
)

ALTER TABLE Classes
ADD TeacherId INT NOT NULL

ALTER TABLE Classes
ADD PRIMARY KEY (ID)

SELECT * FROM Classes

-----------------------------

CREATE TABLE ClassTeacher
(
ID INT NOT NULL,
Name NVARCHAR(100) NOT NULL
)

ALTER TABLE ClassTeacher
ADD Speciality NVARCHAR(200) NOT NULL

ALTER TABLE ClassTeacher
ADD PRIMARY KEY(ID)


----------------------------

USE EmployeeInformation

SELECT * FROM Emp

SELECT EmpNo,EName FROM Emp

SELECT EmpNo,EName FROM Emp