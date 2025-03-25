
---------Exercise(Day 13) | (02-17-2025) ----------------

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
	 print @data
	 Print @number
   END
 ELSE
   BEGIN
	 SET @data = 'C#'
	 print @data
	 Print @number
   END
 END

--5. Provide total selling value of any product.

USE AdventureWorks2022

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


--6. Return today’s selling amount of any product.  


--7. Return today’s selling amount 


--8. Return selling amount of any date.

CREATE FUNCTION ProductSellAmount
(
 @date DATE
)
RETURNS DECIMAL(18,2)
AS
  BEGIN
	DECLARE @selling_amount DECIMAL(18,2)
	SELECT @selling_amount = UnitPrice FROM Sales.SalesOrderDetail S 
	INNER JOIN Production.Product P ON S.ProductID = P.ProductID
	WHERE SellStartDate = @date  
	RETURN @selling_amount
  END

SELECT dbo.ProductSellAmount('2013-05-30') Product_Sell_Amount

--9. Return selling amount of any date and any product

CREATE FUNCTION ProductSellAmountByProduct
(
 @date DATE,
 @product NVARCHAR(50)
)
RETURNS DECIMAL(18,2)
AS
  BEGIN
	DECLARE @selling_amount DECIMAL(18,2)
	SELECT @selling_amount = UnitPrice FROM Sales.SalesOrderDetail S 
	INNER JOIN Production.Product P ON S.ProductID = P.ProductID
	WHERE P.SellStartDate = @date OR P.Name = @product
	RETURN @selling_amount
  END

SELECT dbo.ProductSellAmountByProduct('2011-05-31','Mountain-100 Silver, 42') Product_Sell_Amount

--10. Return Name of Product category by product id.

CREATE FUNCTION ProductCategoryNameFetch
(
 @product_id INT
)
RETURNS NVARCHAR(50)
AS
  BEGIN
    DECLARE @category_name NVARCHAR(50)
	SELECT @category_name = Name FROM Production.ProductCategory
	WHERE ProductCategoryID = @product_id
	RETURN @category_name
  END

SELECT dbo.ProductCategoryNameFetch(2) Product_Category_Name

--11. Return product sub category name by product id

CREATE FUNCTION ProductSubCategoryNameFetch
(
 @product_id INT
)
RETURNS NVARCHAR(50)
AS
  BEGIN
    DECLARE @sub_category_name NVARCHAR(50)
	SELECT @sub_category_name = p2.Name FROM Production.Product p1 
	INNER JOIN Production.ProductSubcategory p2 ON p1.ProductSubcategoryID = p2.ProductSubcategoryID
	WHERE p1.ProductID = @product_id
	RETURN @sub_category_name
  END

SELECT dbo.ProductSubCategoryNameFetch(742) Product_Sub_Category_Name

--12. Return product category name by providing sub category id

CREATE FUNCTION ProductCategoryNameFetchBySubId
(
 @product_sub_category_id INT
)
RETURNS NVARCHAR(50)
AS
  BEGIN
    DECLARE @category_name NVARCHAR(50)
	SELECT @category_name = p1.Name FROM Production.ProductCategory p1 
	INNER JOIN Production.ProductSubcategory p2 ON p1.ProductCategoryID = p2.ProductCategoryID
	WHERE p2.ProductSubcategoryID = @product_sub_category_id
	RETURN @category_name
  END

SELECT dbo.ProductCategoryNameFetchBySubId(26) Product_Category_Name

--13. Return customer name by providing invoice number.

CREATE FUNCTION CustomerNameFetch
(
 @invoice_number NVARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
  BEGIN
    DECLARE @full_name NVARCHAR(50)
	SELECT @full_name = CONCAT(FirstName,' ',MiddleName,' ',LastName) FROM Person.Person P
	INNER JOIN Sales.Customer C ON P.BusinessEntityID = C.PersonID
	INNER JOIN Sales.SalesOrderHeader S ON S.CustomerID = C.CustomerID
	WHERE S.PurchaseOrderNumber = @invoice_number
	RETURN @full_name
  END

SELECT dbo.CustomerNameFetch('PO5626159507') Customer_Name

--14. Return total value of a invoice.

CREATE FUNCTION TotalInvoiceValueFetch
(
 @invoice_number NVARCHAR(50)
)
RETURNS DECIMAL (18,2)
AS
  BEGIN
    DECLARE @total_value DECIMAL (18,2)
	DECLARE @sub_total DECIMAL (18,2)
	DECLARE @total_due DECIMAL (18,2)
	SELECT @sub_total = SubTotal, @total_due = TotalDue FROM Sales.SalesOrderHeader
	WHERE PurchaseOrderNumber = @invoice_number
	SET @total_value = @sub_total + @total_due
	RETURN @total_value
  END

SELECT dbo.TotalInvoiceValueFetch('PO16008173883') Total_Invoice_Value

--15. Return full name of a person using person id.

CREATE FUNCTION FullPersonNameFetch
(
 @person_id INT
)
RETURNS NVARCHAR(50)
AS
  BEGIN
    DECLARE @full_name NVARCHAR(50)
	SELECT @full_name = CONCAT(FirstName,' ',MiddleName,' ',LastName) FROM Person.Person p1
	INNER JOIN Person.BusinessEntityContact p2 ON p1.BusinessEntityID = p2.PersonID
	WHERE p2.PersonID = @person_id
	RETURN @full_name
  END

SELECT dbo.FullPersonNameFetch(293) Full_Name

--16. Return joining date of a employee by using business Id.

CREATE FUNCTION EmployeeJoiningDateFetch
(
 @business_id INT
)
RETURNS DATE
AS
  BEGIN
    DECLARE @join_date DATE
	SELECT @join_date = HireDate FROM HumanResources.Employee
	WHERE BusinessEntityID = @business_id
	RETURN @join_date
  END

SELECT dbo.EmployeeJoiningDateFetch(4) Employee_Join_Date
