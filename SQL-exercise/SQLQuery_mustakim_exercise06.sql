
---------Exercise(Day 7) | (02-3-2025) ----------------

USE EmployeeInformation

--1. Display the list of employees who have joined the company before 30th June 90 or after 31st Dec 90

SELECT * FROM Emp WHERE HireDate < '1990-06-30' OR HireDate > '1990-12-31' 

--2. Display names of employees from table EMP whose name starts with letter S

SELECT EName FROM Emp WHERE EName LIKE 'S%'

--3. Display names of employees from table EMP whose name ends with letter S 

SELECT EName FROM Emp WHERE EName LIKE '%S'

--4. Display names of employees from table EMP having second letter A in their JOB

SELECT EName FROM Emp WHERE EName LIKE '_A%'

--5. Display names of employees whose name is exactly five characters in length 

SELECT EName FROM Emp WHERE EName LIKE '_____'

--6. Display names of employees whose job start with letter A, ends with letter S and is 4 characters in length

SELECT EName FROM Emp WHERE Job LIKE 'A__S'

--7. Display those department whose name start with"S" while location name ends with "K" 

SELECT DName FROM Dept WHERE DName LIKE 'S%' AND Loc LIKE '%K'

--8. Display details of all the employees and output should have highest comm row displayed at end

SELECT * FROM Emp ORDER BY Comm

--9. Display details of all the employees and output should have highest comm row displayed on top

SELECT * FROM Emp ORDER BY Comm DESC

--10. Display the names of employees in order of commission(comm) i.e. the name of the employee earning lowest commission(comm) should appear first 

SELECT * FROM Emp ORDER BY Comm DESC

--11. Display the names of employees in order of commission(comm) i.e. the name of the employee earning highest commission(comm) should appear last

SELECT EName,Comm FROM Emp WHERE ISNULL(Comm,0) != 0 ORDER BY Comm 

--12. Display the names of employees in descending order of commission(comm) i.e., the name of the employee earning highest commission(comm) should appear first

SELECT EName,Comm FROM Emp WHERE ISNULL(Comm,0) != 0 ORDER BY Comm DESC

--13. Display the names of employees in descending order of commission(comm) i.e., the name of the employee earning lowest commission(comm) should appear last

SELECT EName,Comm FROM Emp WHERE ISNULL(Comm,0) != 0 ORDER BY Comm DESC

--14. Display the details from EMP table in order of employee name

SELECT * FROM Emp ORDER BY EName

--15. Display EMPNO, ENAME, DEPTNO and SAL. Sort the output based on DEPTNO and then by SAL 

SELECT EmpNo,EName,DeptNo,Sal FROM Emp ORDER BY DeptNo,Sal

--16. Display employee details from EMP table. Sort the output based on DeptNo (Highest to Lowest) and then by Sal (Highest to Lowest)

SELECT * FROM Emp ORDER BY DeptNo DESC, Sal DESC

--17. Display the name of employees along with their annual salary (Sal*12). The name of the employee earning highest annual salary should appear first

SELECT EName,Sal,(Sal*12) AnnualSalary FROM Emp ORDER BY AnnualSalary DESC

--18. Display EName,Sal,Hra,PF,DA, total salary for each employee. The output should be in the order of total salary (HRA 15% of Sal, DA 10% of Sal, PF 5% of Sal and TotalSalary will be (Sal+HRA+DA) - PF

SELECT EName,Sal,(Sal*0.15) HRA,(Sal*0.10) DA,(Sal*0.05) PF,(Sal+Sal*0.20) TotalSalary FROM Emp

--19. Display EmpNo,EName,Sal, and DeptNo from Emp table. Output should be in the order of length of EName (High to Low), If length of EName is same for more employees then sort the output by salary (High to Low) and If more employees has same salary than sort the output by EName

SELECT EmpNo,EName,Sal,DeptNo FROM Emp ORDER BY LEN(EName) DESC, Sal DESC, EName

--20. Write a query to display EName from Emp table. Miller to be displayed in first row and rest in ascending order

SELECT * FROM Emp ORDER BY LEN(EName) DESC, DeptNo

--21. Display the total number of records from table Emp

SELECT COUNT(*) Total_Num_of_records FROM Emp 

--22. Display total salary and total commission of all employees in two separate columns

SELECT SUM(sal) TotalSal, SUM(Comm) TotalComm FROM Emp

--23. Display highest value in column Comm from table Emp

SELECT MAX(Comm) MaxComm FROM Emp 

--24. Display minimum salary from Emp table

SELECT MIN(Sal) MinSal FROM Emp 

--25. Display average salary from Emp table

SELECT AVG(Sal) AvgSal FROM Emp 

--26. Display maximum salary being paid to Clerk

SELECT Job,MAX(Sal) MaxSal FROM Emp WHERE Job = 'CLERK' GROUP BY Job

--27. Display maximum salary being paid in DeptNo 20

SELECT DeptNo,MAX(Sal) MaxSal FROM Emp WHERE DeptNo = 20 GROUP BY DeptNo

--28. Display minimum salary being paid to SalesMan

SELECT Job,MIN(Sal) MinSal FROM Emp WHERE Job = 'SALESMAN' GROUP BY Job

--29. Display average salary drawn by Managers

SELECT Job,AVG(Sal) AvgSal FROM Emp WHERE Job = 'MANAGER' GROUP BY Job

--30. Display average of total salaries in each DeptNo

SELECT DeptNo,AVG(Sal) AvgSal FROM Emp GROUP BY DeptNo

--31. Display DeptNo having at least 3 employees

SELECT DeptNo,COUNT(EmpNo) Employees FROM Emp GROUP BY DeptNo HAVING COUNT(EmpNo) > 3 ORDER BY DeptNo
