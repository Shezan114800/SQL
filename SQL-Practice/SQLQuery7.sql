USE StudentManagementSystem

CREATE TABLE ClassTeacher
(
 Id INT PRIMARY KEY,
 Name NVARCHAR(50),
 Speciality NVARCHAR(50)
)

USE EmployeeInformation

SELECT * FROM Emp ORDER BY Sal DESC


---AND & Wild Card

SELECT * FROM Emp WHERE Sal >=3000 AND ISNULL(Comm,0) != 0

SELECT * FROM Emp WHERE Sal < 3000 AND ISNULL(Comm,0) != 0

SELECT * FROM Emp WHERE EName LIKE 'S%' AND EName LIKE '%T'

SELECT * FROM Emp WHERE EName LIKE '_M%'

SELECT * FROM Emp WHERE EName LIKE '%M%'

---OR

SELECT * FROM Emp WHERE EName LIKE 'S%' OR EName LIKE 'M%'

SELECT * FROM Emp WHERE DeptNo = 10 OR DeptNo = 20

SELECT * FROM Emp WHERE DeptNo IN (10,20)

SELECT * FROM Emp WHERE DeptNo BETWEEN 10 AND 20

---NOT

SELECT * FROM Emp WHERE DeptNo NOT IN (10,20)

---sdf--System Defined Function

--Aggregate Function (AVG,MAX,MIN,COUNT,SUM)

--AVG
SELECT AVG(Sal) AvgSal FROM Emp

---Department wise AVG Sal
SELECT DeptNo, AVG(Sal) AvgSal FROM Emp GROUP BY DeptNo

--MAX

SELECT MAX(Sal) MaxSal FROM Emp

SELECT DeptNo, MAX(Sal) MaxSal FROM Emp GROUP BY DeptNo

SELECT DeptNo, MAX(Sal) MaxSal FROM Emp WHERE DeptNo = 10 GROUP BY DeptNo HAVING MAX(Sal) >= 3000 ORDER BY DeptNo DESC

--MIN

SELECT MIN(Sal) MinSal FROM Emp

SELECT DeptNo, MIN(Sal) MinSal FROM Emp GROUP BY DeptNo

SELECT DeptNo, MIN(Sal) MinSal FROM Emp WHERE DeptNo = 30 GROUP BY DeptNo HAVING MIN(Sal) >= 900 ORDER BY DeptNo DESC

--COUNT

---Total Emp of the table

SELECT COUNT(*) TotalEmp FROM Emp

---Department wise Total Emp

SELECT DeptNo,COUNT(*) TotalEmp FROM Emp GROUP BY DeptNo

--SUM

---Total Sal of the Emp

SELECT SUM(Sal) TotalSal FROM Emp 

---Department wise total Sal of the Emp

SELECT DeptNo,SUM(Sal) TotalSal FROM Emp GROUP BY DeptNo