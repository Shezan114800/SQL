
USE EmployeeInformation

SELECT * FROM Emp

SELECT * FROM Dept


---EmpNo,EName,ManagerName,HireDate,Sal

SELECT E1.EmpNo,E1.EName,E2.EName AS ManagerName,E1.HireDate,E1.Sal
FROM Emp E1
INNER JOIN Emp E2 ON E1.Mgr = E2.EmpNo

