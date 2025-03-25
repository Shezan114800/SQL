
---------Exercise(Day 4) | (1-27-2025) ----------------

USE EmployeeInformation

--a.Drop All tables from EmployeeInformation

DROP TABLE Emp
DROP TABLE SalGrade
DROP TABLE Dept

--b.Create table according to design without primary key

----- Emp Table create

CREATE TABLE Emp
(
 EName VARCHAR(100) NOT NULL,
 Job VARCHAR(50) NOT NULL,
 Mgr INT,
 HireDate DATE NOT NULL,
 Sal DECIMAL(15,2) NOT NULL,
 Comm DECIMAL(15,2),
 DeptNo INT NOT NULL
)

----- Dept Table create

CREATE TABLE Dept
(
 DName VARCHAR(100) NOT NULL,
 Loc VARCHAR(50) NOT NULL
)

----- SalGrade Table create

CREATE TABLE SalGrade
(
 Grade INT NOT NULL,
 LoSal DECIMAL(15,2) NOT NULL,
 HiSal DECIMAL(15,2) NOT NULL
)

--c.Add primary key ID on EMP and DEPT table with identity

ALTER TABLE Emp
ADD EmpNo INT CONSTRAINT PK_Emp_Employee_Number PRIMARY KEY


ALTER TABLE Dept
ADD DeptNo INT IDENTITY(10,10) CONSTRAINT PK_Dept_Department_Number PRIMARY KEY

--d.Add a column DeptId on Emp Table

ALTER TABLE Emp
ADD DeptId INT IDENTITY(1,1)

--e.Create a relationship between EMP & DEPT table

ALTER TABLE Emp
ADD CONSTRAINT FK_Emp_Department_Number FOREIGN KEY (DeptNo) REFERENCES Dept(DeptNo)

--f.Insert all data

-----Data Insert into Dept Table

INSERT INTO Dept(DName,Loc) 
VALUES ('Accounting','NYC'),('Research','DALLAS'),('Sales','CHICAGO'),('Opertaions','BOSTON')

SELECT * FROM Dept

-----Data Insert into Emp Table

INSERT INTO Emp(EmpNo,EName,Job,Mgr,HireDate,Sal,Comm,DeptNo)
VALUES(7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20),
      (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30),
	  (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),
      (7566,'JONES','MANAGER',7839,'2-APR-81',2975,NULL,20),
	  (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30),
      (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,NULL,30),
	  (7782,'CLARK','MANAGER',7839,'9-JUNE-81',2450,NULL,10),
	  (7788,'SCOTT','ANALYST',7566,'9-DEC-82',3000,0,20),
      (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10),
      (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,NULL,30),
	  (7876,'ADAMS','CLERK',7788,'12-JAN-83',1100,NULL,20),
	  (7900,'JAMES','CLERK',7698,'3-DEC-81',950,NULL,30), 
	  (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,NULL,20),
	  (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10)

SELECT * FROM Emp
 
      
-----Data Insert into SalGrade Table	 

INSERT INTO SalGrade(Grade,LoSal,HiSal) 
VALUES (1,700,1200),(2,1201,1400),(3,1401,2000),(4,2001,3000),(5,3001,9999)

SELECT * FROM SalGrade



--------------Class Solutions-----------------


--c.Add primary key ID on EMP and DEPT table with identity

--Emp Table

ALTER TABLE Emp
DROP  CONSTRAINT PK_Emp_Employee_Number

ALTER TABLE Emp
DROP CONSTRAINT FK_Emp_Department_Number

ALTER TABLE Emp
DROP COLUMN DeptId

ALTER TABLE Emp
ADD ID INT IDENTITY(1,1) CONSTRAINT PK_Emp_Id PRIMARY KEY

SELECT * FROM Emp

----Dept Table

ALTER TABLE Dept
DROP CONSTRAINT PK_Dept_Department_Number

ALTER TABLE Dept
DROP COLUMN DeptNo

ALTER TABLE Dept
ADD ID INT IDENTITY(1,1) CONSTRAINT PK_Dept_Id PRIMARY KEY

ALTER TABLE Dept
ADD DeptNo INT 

SELECT * FROM Dept

--d.Add a column DeptId on Emp Table

ALTER TABLE Emp
ADD DeptId INT

--e.Create a relationship between EMP & DEPT table

ALTER TABLE Emp
ADD CONSTRAINT FK_Emp_Dept_Id FOREIGN KEY (DeptId) REFERENCES Dept(ID)

--f.Update all data

UPDATE Dept
SET DeptNo = 40
WHERE ID = 4


UPDATE Emp
SET DeptId = 4
WHERE DeptNo = 40