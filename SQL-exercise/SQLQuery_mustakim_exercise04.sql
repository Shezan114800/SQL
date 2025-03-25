
---------Exercise(Day 5) | (1-29-2025) ----------------

USE EmployeeInformation

--Query: EMPNO,ENAME,JOB,DNAME,LOC

SELECT EmpNo,EName,Job FROM Emp

SELECT DName,Loc FROM Dept

--Display ENAME for employees working in department 10

SELECT EName,DeptNo FROM Emp WHERE DeptNo = 10

--Display EMPNO,ENAME for employees who earn commission

SELECT EmpNo,EName,Comm FROM Emp WHERE ISNULL(Comm,0) != 0

--Display ENAME for employees who do not earn any commission

SELECT EName,Comm FROM Emp WHERE ISNULL(Comm,0) = 0

--Display the name of employees who are not working as MANAGER

SELECT EName,Mgr FROM Emp WHERE Mgr IS NULL

--Display those employees whose salary is more than 3000 after giving 20% increment

SELECT ENAME, Sal, (Sal + (Sal * 0.2)) AS New_Sal 
FROM Emp WHERE (Sal + (Sal * 0.2)) > 3000

