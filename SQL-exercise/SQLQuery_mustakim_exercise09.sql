
---------Exercise(Day 14) | (02-19-2025) ----------------

USE AdventureWorks2022

--1. Provide total selling value of any product.

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

--2. Return today’s selling amount of any product.  

CREATE FUNCTION GetTodaySellAmount
(
 @date DATE
)
RETURNS DECIMAL(18,2)
AS
  BEGIN
	DECLARE @selling_amount DECIMAL(18,2)
	SELECT @selling_amount = SubTotal FROM Sales.SalesOrderHeader WHERE OrderDate = @date
	RETURN @selling_amount
  END

SELECT dbo.GetTodaySellAmount('2025-02-21') Today_Sell_Amount

--3. Return selling amount of any date.

CREATE FUNCTION ProductSellAmount
(
 @date DATE
)
RETURNS DECIMAL(18,2)
AS
  BEGIN
	DECLARE @selling_amount DECIMAL(18,2)
	SELECT @selling_amount = SubTotal FROM Sales.SalesOrderHeader WHERE OrderDate = @date
	RETURN @selling_amount
  END

SELECT dbo.ProductSellAmount('2013-05-30') Product_Sell_Amount

--4. Return Name of Product category by product id.

CREATE FUNCTION GetProductCategoryName
(
 @product_id INT
)
RETURNS NVARCHAR(50)
AS
  BEGIN
    DECLARE @category_name NVARCHAR(50)
	SELECT @category_name = PC.Name FROM Production.ProductCategory PC
	INNER JOIN Production.ProductSubcategory PS ON PC.ProductCategoryID = PS.ProductCategoryID
	INNER JOIN Production.Product P ON PS.ProductSubcategoryID = P.ProductSubcategoryID
	WHERE P.ProductID = @product_id
	RETURN @category_name
  END

SELECT dbo.GetProductCategoryName(950) Product_Category_Name

--5. Return product sub category name by product id

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

--6. Return product category name by providing sub category id

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

SELECT dbo.ProductCategoryNameFetchBySubId(27) Product_Category_Name

--7. Return customer name by providing invoice number.

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

--8. Return total value of a invoice.

CREATE FUNCTION TotalInvoiceValueFetch
(
 @invoice_number NVARCHAR(50)
)
RETURNS DECIMAL (18,2)
AS
  BEGIN
	DECLARE @total_value DECIMAL (18,2)
	SELECT @total_value = TotalDue FROM Sales.SalesOrderHeader
	WHERE PurchaseOrderNumber = @invoice_number
	RETURN @total_value
  END

SELECT dbo.TotalInvoiceValueFetch('PO16008173883') Total_Invoice_Value

--9. Return full name of a person using person id.

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

--10. Return joining date of a employee by using business Id.

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

SELECT dbo.EmployeeJoiningDateFetch(5) Employee_Join_Date
