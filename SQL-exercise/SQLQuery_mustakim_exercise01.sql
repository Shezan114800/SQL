
-------------EmployeeInformation Database Create----------------

CREATE DATABASE EmployeeInformation

ALTER DATABASE EmployeeInformation MODIFY NAME = EmployeeInformationSystem

DROP DATABASE EmployeeInformationSystem

CREATE DATABASE EmployeeInformation

---------EMP TABLE---------------

CREATE TABLE Emp
(
 EmpNo INT PRIMARY KEY,
 EName VARCHAR(100) NOT NULL,
 Job VARCHAR(100) NOT NULL,
 Mgr INT,
 HireDate DATE NOT NULL,
 Sal INT NOT NULL,
 Comm INT ,
 DeptNo INT NOT NULL
)

INSERT INTO Emp(EmpNo,EName,Job,Mgr,HireDate,Sal,DeptNo)
VALUES(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20),
      (7566,'JONES','MANAGER',7839,'2-APR-81',2975,20),
      (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,30),
	  (7782,'CLARK','MANAGER',7839,'9-JUNE-81',2450,10),
      (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,20),
      (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,30),
	  (7876,'ADAMS','CLERK',7788,'12-JAN-83',1100,20),
	  (7900,'JAMES','CLERK',7698,'3-DEC-81',950,30), 
	  (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,20),
	  (7934,'MILLER','CLERK',7782,'3-DEC-81',3000,20)
	

INSERT INTO Emp(EmpNo,EName,Job,Mgr,HireDate,Sal,Comm,DeptNo)
VALUES(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30),
      (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),
      (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30),
	  (7788,'SCOTT','ANALYST',7566,'9-DEC-82',3000,0,20)

---------SAL GRADE TABLE---------------

CREATE TABLE SalGrade
(
 Grade INT PRIMARY KEY IDENTITY(10,10),
 LoSal INT NOT NULL,
 HiSal INT NOT NULL,
)
ALTER TABLE SalGrade
ALTER COLUMN LoSal DECIMAL(18,2)

ALTER TABLE SalGrade
ALTER COLUMN HiSal DECIMAL(18,2)


---------DEPT TABLE---------------

CREATE TABLE Dept
(
 DeptNo INT PRIMARY KEY IDENTITY(10,10),
 DName VARCHAR(100) NOT NULL,
 Loc VARCHAR(100) NOT NULL
)

INSERT INTO Dept(DName,Loc) 
VALUES ('Accounting','NYC'),('Research','DALLAS'),('Sales','CHICAGO'),('Opertaion','BOSTON')

---------Displaying All Table----------------

SELECT * FROM Emp
SELECT * FROM SalGrade
SELECT * FROM Dept


USE StudentManagementSystem


