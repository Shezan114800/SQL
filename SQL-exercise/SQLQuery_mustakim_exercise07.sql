
---------Exercise(Day 11) | (02-12-2025) ----------------

USE EmployeeInformation

--1. Display all employees with their department names

SELECT Emp.EmpNo,Emp.EName,Emp.Job,Dept.DName FROM Emp
INNER JOIN Dept ON Emp.DeptNo = Dept.DeptNo

--2. Display ename who are working in sales department

SELECT Emp.EName,Dept.DName FROM Emp
INNER JOIN Dept ON Emp.DeptNo = Dept.DeptNo
WHERE DName = 'Sales'

--3. Display ENAME, DNAME, SAL and COMM for employees with salary between 2000 to 5000 and location is Chicago

SELECT Emp.EName,Dept.DName,Emp.Sal,Emp.Comm,Dept.Loc FROM Emp
INNER JOIN Dept ON Emp.DeptNo = Dept.DeptNo
WHERE Sal BETWEEN 2000 AND 5000 AND loc = 'Chicago'

--4. Display those employees whose salary is greater than his managers salary

SELECT E.EmpNo,E.EName,E.Sal,E.Mgr,M.EName,M.Sal FROM Emp E
INNER JOIN Emp M ON M.EmpNo = E.Mgr
WHERE E.Sal > M.Sal

--5. Display those employees who are working in the same dept where his manager is working

SELECT * FROM Emp

SELECT E.EmpNo,E.EName,E.DeptNo,E.Mgr,M.EName AS Manager,D.DName FROM Emp E
INNER JOIN Emp M ON M.EmpNo = E.Mgr
INNER JOIN Dept D ON E.DeptNo = D.DeptNo
WHERE E.DeptNo = M.DeptNo

--6. Display those employees who are not working under any Manager

SELECT * FROM Emp
WHERE Mgr IS NULL

--7. Display ENAME, GRADE (deptno 10 or 30) (grade is not 4)  (joined company before 31-DEC-82)

SELECT e.EName,s.Grade FROM Emp AS e
JOIN SalGrade s ON e.Sal BETWEEN s.LoSal AND s.HiSal
WHERE e.DeptNo IN (10,30) 
 AND s.Grade != 4
 AND e.HireDate < '1982-12-31' 

--8. Display employee name ,job,deptname,loc for all who are working as manager? 

SELECT Emp.EName,Emp.Job,Dept.DName,Dept.Loc FROM Emp
INNER JOIN Dept ON Emp.DeptNo = Dept.DeptNo
WHERE Job = 'MANAGER'

--9. Display those employees whose manager name is JONES and also display their manager name? 

SELECT E.EmpNo,E.EName AS EmployeeName,E.Mgr,M.EName AS ManagerName FROM Emp E
INNER JOIN Emp M ON M.EmpNo = E.Mgr
WHERE M.EName = 'JONES'

--10. Display employee names who are working in ACCOUNTING department 

SELECT Emp.EName,Emp.Job,Dept.DName FROM Emp
INNER JOIN Dept ON Emp.DeptNo = Dept.DeptNo
WHERE Dept.DName = 'Accounting'

--11. Display the employee names who are working in CHICAGO 

SELECT Emp.EName,Dept.Loc FROM Emp
INNER JOIN Dept ON Emp.DeptNo = Dept.DeptNo
WHERE Dept.Loc = 'Chicago'

--12. Display name and salary of EMP if his salary is equal to hisal of his grade? 

SELECT e.EName,e.Sal,s.Grade FROM Emp AS e
JOIN SalGrade s ON e.Sal = s.HiSal

--13. Display employees whose salary is less than his manager but more than salary of other managers? 

SELECT E.EmpNo,E.EName AS EmployeeName,E.Sal,E.Mgr,M.EName AS ManagerName,M.Sal FROM Emp E
INNER JOIN Emp M ON M.EmpNo = E.Mgr
WHERE E.Sal < M.Sal 

--14. Display those employees whose manager name is Jones
--15. Display the details of those employees who do not have any person working under him
--16. Display the details of those employees who are in sales department and grade is 3
--17. Display those department where no employee working?
--18. Display ename, job and his manager. Display also employees who are without managers? 
--19. Find out the number of employees whose salary is greater than their managers salary? 
--20. Display ename, job, dname, his manager name, his grade and display output department number wise? 
--21. List ename, job, sal, grade and dname for everyone in a company except 'CLERK'. Sort on salary display the highest salary first? 
