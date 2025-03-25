

---------Exercise(Day 15) | (02-21-2025) ----------------

USE EmployeeInformation

--1. Insert data to EMP table using stored procedure

CREATE PROC spInsertEmpData
(
  @emp_no INT,
  @e_name NVARCHAR(50),
  @job NVARCHAR(50),
  @mgr INT,
  @hiredate DATE,
  @sal DECIMAL(18,2),
  @comm DECIMAL(18,2),
  @dept_no INT,
  @dept_id INT
)
AS
  BEGIN
   IF(@emp_no < 7940)
     BEGIN
        UPDATE Emp SET EName = @e_name, Job = @job, Mgr = @mgr, HireDate = @hiredate, Sal = @sal, Comm = @comm, DeptNo = @dept_no, DeptId = @dept_id
		WHERE EmpNo = @emp_no
     END
   ELSE
     BEGIN
        INSERT INTO Emp(EmpNo,EName,Job,Mgr,HireDate,Sal,Comm,DeptNo,DeptId)
	    VALUES (@emp_no,@e_name,@job,@mgr,@hiredate,@sal,@comm,@dept_no,@dept_id)
     END
   END

EXEC spInsertEmpData 7942,'WATSON','CLERK',7788,'1983-03-11',1000,NULL,20,2

SELECT * FROM Emp

--2. Insert data to DEPT table using stored procedure

CREATE PROC spInsertDeptData
(
  @d_name NVARCHAR(50),
  @loc NVARCHAR(50),
  @dept_no INT,
  @dept_id INT
)
AS
  BEGIN
   IF(@dept_id < 4)
     BEGIN
        UPDATE Dept SET DName = @d_name, Loc = @loc, DeptNo = @dept_no
		WHERE ID = @dept_id
     END
   ELSE
     BEGIN
        INSERT INTO Dept(DName,Loc,DeptNo)
	    VALUES (@d_name,@loc,@dept_no)
     END
   END

EXEC spInsertDeptData 'Human Resource','NEW YORK',50,5

SELECT * FROM Dept


--3. Insert data to SAL GRADE table using stored procedure

CREATE PROC spInsertSalGradeData
(
  @grade INT,
  @lo_sal DECIMAL(18,2),
  @hi_sal DECIMAL(18,2)
)
AS
  BEGIN
   IF(@grade < 5)
     BEGIN
        UPDATE SalGrade SET LoSal = @lo_sal, HiSal = @hi_sal
		WHERE Grade = @grade
     END
   ELSE
     BEGIN
        INSERT INTO SalGrade(Grade,LoSal,HiSal)
	    VALUES (@grade,@lo_sal,@hi_sal)
     END
   END

EXEC spInsertSalGradeData 6,4001,12000

SELECT * FROM SalGrade

--4. Display ENAME for employees working in department 10 

CREATE PROCEDURE spGetEmpEname
AS
  BEGIN
  SELECT EName,DeptNo FROM Emp WHERE DeptNo = 10
  END 

EXEC spGetEmpEname

--5. Display EMPNO, ENAME for employees who earn commission 

CREATE PROCEDURE spGetEmpByComm
AS
  BEGIN
  SELECT EmpNo,EName,Comm FROM Emp WHERE Comm != 0
  END 

EXEC spGetEmpByComm