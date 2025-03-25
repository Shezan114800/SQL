

---------Exercise(Day 17) | (02-28-2025) ----------------

CREATE DATABASE WorkerManagement

USE WorkerManagement

--Q-1. Insert All data into table using store procedure.

---Creating Worker Table

CREATE TABLE Worker 
(
  Worker_id INT PRIMARY KEY IDENTITY(001,1),
  First_Name NVARCHAR(50) NOT NULL,
  Last_Name NVARCHAR(50) NOT NULL,
  Salary DECIMAL(18,2),
  Joining_Date DATETIME NOT NULL,
  Department NVARCHAR(50)
)

CREATE PROC spInsertWorkerData
(
  @first_name NVARCHAR(50),
  @last_name NVARCHAR(50),
  @sal DECIMAL(18,2),
  @join_date DATETIME,
  @dept_name NVARCHAR(50)
)
AS
   BEGIN
        INSERT INTO Worker(First_Name,Last_Name,Salary,Joining_Date,Department)
	    VALUES (@first_name,@last_name,@sal,@join_date,@dept_name)
   END

--- Inserting Data into worker table with Stored procedure

EXEC spInsertWorkerData 'Monika','Arora',100000,'2014-02-20 00:00:00','HR'
EXEC spInsertWorkerData 'Niharika', 'Verma', 80000, '2014-06-11 00:00:00', 'Admin'
EXEC spInsertWorkerData 'Vishal', 'Singhal', 300000, '2014-02-20 00:00:00', 'HR'
EXEC spInsertWorkerData 'Amitabh', 'Singh', 500000, '2014-02-20 00:00:00', 'Admin'
EXEC spInsertWorkerData 'Vivek', 'Bhati', 500000, '2014-06-11 00:00:00', 'Admin'
EXEC spInsertWorkerData 'Vipul', 'Diwan', 200000, '2014-06-09 00:00:00', 'Account'
EXEC spInsertWorkerData 'Satish', 'Kumar', 75000, '2014-01-20 00:00:00', 'Account'
EXEC spInsertWorkerData 'Geetika', 'Chauhan', 90000, '2014-04-11 00:00:00', 'Admin'

SELECT * FROM Worker

---Creating Bonus Table

CREATE TABLE Bonus 
(
  Worker_Ref_id INT,
  Bonus_Date DATETIME NOT NULL,
  Bonus_Amount DECIMAL(18,2)
)

CREATE PROC spInsertBonusData
(
  @worker_ref_id INT,
  @bonus_date DATETIME,
  @bonus_amnt DECIMAL(18,2)
)
AS
   BEGIN
        INSERT INTO Bonus(Worker_Ref_id,Bonus_Date,Bonus_Amount)
	    VALUES (@worker_ref_id,@bonus_date,@bonus_amnt)
   END

--- Inserting Data into bonus table with Stored procedure

EXEC spInsertBonusData 1,'2016-02-20 00:00:00',5000
EXEC spInsertBonusData 2,'2016-06-11 00:00:00',3000
EXEC spInsertBonusData 3,'2016-02-20 00:00:00',4000
EXEC spInsertBonusData 1,'2016-02-20 00:00:00',4500
EXEC spInsertBonusData 2,'2016-06-11 00:00:00',3500

SELECT * FROM Bonus


---Creating Title Table

CREATE TABLE Title
(
  Worker_Ref_id INT,
  Worker_Title NVARCHAR(50),
  Affected_From DATETIME NOT NULL,
)

CREATE PROC spInsertTitleData
(
  @worker_ref_id INT,
  @worker_title NVARCHAR(50),
  @affected_from DATETIME
)
AS
   BEGIN
        INSERT INTO Title(Worker_Ref_id,Worker_Title,Affected_From)
	    VALUES (@worker_ref_id,@worker_title,@affected_from)
   END

--- Inserting Data into Title table with Stored procedure

EXEC spInsertTitleData 1,'Manager','2016-02-20 00:00:00'
EXEC spInsertTitleData 2,'Executive','2016-06-11 00:00:00'
EXEC spInsertTitleData 8,'Executive','2016-06-11 00:00:00'
EXEC spInsertTitleData 5,'Manager','2016-06-11 00:00:00'
EXEC spInsertTitleData 4,'Asst. Manager','2016-06-11 00:00:00'
EXEC spInsertTitleData 7,'Executive','2016-06-11 00:00:00'
EXEC spInsertTitleData 6,'Lead','2016-06-11 00:00:00'
EXEC spInsertTitleData 3,'Lead','2016-06-11 00:00:00'

SELECT * FROM Title

--Q-2. Write a SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT COUNT(Worker_id) AS Number_of_Employees FROM Worker
WHERE Department = 'Admin'

--Q-3. Write a SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT First_Name,Last_Name,Salary FROM Worker
WHERE Salary >= 50000 AND Salary <= 100000

--Q-4.Write a SQL query to fetch the no. of workers for each department in the descending order.

SELECT Department,COUNT(Worker_id) AS Num_of_Workers FROM Worker
GROUP BY Department 
ORDER BY COUNT(Worker_id) DESC

--Q-5.Write a SQL query to fetch details of the Workers who are also Managers.

SELECT * FROM Worker
INNER JOIN Title ON Worker.Worker_id = Title.Worker_Ref_id
WHERE Worker_Title = 'Manager'

--Q-6.Write a SQL query to show only odd rows from a table.

SELECT * FROM Worker
WHERE Worker_id % 2 = 1

--Q-7.Write a SQL query to show only even rows from a table.

SELECT * FROM Worker
WHERE Worker_id % 2 = 0

--Q-8.Write a SQL query to show the current date and time.

SELECT GETDATE() AS Current_Date_Time

--Q-9. Write a SQL query to show the top n (say 10) records of a table.
--Q-10. Write a SQL query to fetch the list of employees with the same salary.
--Q-13.Write a SQL query to show the second highest salary from a table.
--Q-14.Write a SQL query to show one row twice in results from a table.
--Q-15. Write a SQL query to fetch the worker details with current designation.
