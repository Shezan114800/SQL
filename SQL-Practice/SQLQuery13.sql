
USE EmployeeInformation

--1. Print odd number from 1-100

DECLARE @number INT = 1

WHILE (@number <= 100)
 BEGIN
  IF (@number % 2 != 0)
   BEGIN
     PRINT @number
   END
     SET @number = @number + 1
 END

--2. Print even number from 1-100

DECLARE @number INT = 1

WHILE (@number <= 100)
 BEGIN
  IF (@number % 2 = 0)
   BEGIN
     PRINT @number
   END
     SET @number = @number + 1
END

--3. Print the number from 1-100 which are divided by 5.

DECLARE @number INT = 1

WHILE (@number <= 100)
 BEGIN
  IF (@number % 5 = 0)
   BEGIN
     PRINT @number
   END
     SET @number = @number + 1
END

--4. Print ‘SQL’ when odd number and print ‘C#’ when even number by counting 1-100.

DECLARE @number INT = 0
DECLARE @data NVARCHAR(50) = ''

WHILE (@number < 100) 
 BEGIN
   SET @number = @number + 1
 IF (@number % 2 != 0)
   BEGIN
	 SET @data = 'SQL'
	 PRINT @data
	 PRINT @number
   END
 ELSE
   BEGIN
	 SET @data = 'C#'
	 PRINT @data
	 PRINT @number
   END
 END


--5. Provide total selling value of any product.


USE AdventureWorks2022

SELECT * FROM Sales.SalesOrderDetail

CREATE FUNCTION ProductSellValue
(
 @product_id INT
)
RETURNS DECIMAL(18,2)
AS
  BEGIN
	DECLARE @selling_value DECIMAL(18,2)
	SELECT @selling_value = SUM(LineTotal) FROM Sales.SalesOrderDetail WHERE ProductID = @product_id
	RETURN @selling_value
  END

SELECT dbo.ProductSellValue(777) Total_Selling_Value




SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail

SELECT * FROM Production.Product 
SELECT * FROM Production.ProductCategory