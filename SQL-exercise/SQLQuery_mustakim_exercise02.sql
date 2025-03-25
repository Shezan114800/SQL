
---------Exercise(Day 3) | (1-24-2025) ----------------


--- 1. Display ENAME, JOB from table EMP

SELECT EName,Job FROM Emp

--- 2. Display ENAME, SAL from table EMP

SELECT EName,SAL FROM Emp

--- 3. Display all columns and rows from table EMP

SELECT * FROM Emp

--- 4. Display all columns and rows from table DEPT

SELECT * FROM Dept

--- 5. Display all columns and rows from table DEPT

SELECT EName,DeptNo FROM Emp
WHERE DeptNo = 10

--- 6. Display all columns and rows from table DEPT

SELECT EmpNo,EName FROM Emp
WHERE Comm IS NOT NULL

--- 7. Display ENAME for employees who do not earn any commission 

SELECT EName FROM Emp
WHERE Comm IS NULL


-------Class Solution-------------

SELECT * FROM Emp

SELECT EName, ISNULL(Comm,0) Commission
FROM Emp
WHERE ISNULL(Comm,0)= 0;