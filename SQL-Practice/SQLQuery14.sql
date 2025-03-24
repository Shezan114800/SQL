
USE AdventureWorks2022

--8. Return selling amount of any date.

SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail

CREATE FUNCTION GetSellAmount
(
 @date DATE
)
RETURNS DECIMAL(18,2)
AS
  BEGIN
	DECLARE @selling_amount DECIMAL(18,2)
	SELECT @selling_amount = UnitPrice FROM Sales.SalesOrderDetail SD 
	INNER JOIN Sales.SalesOrderHeader SH ON SD.SalesOrderID = SH.SalesOrderID
	WHERE OrderDate = @date  
	RETURN @selling_amount
  END

SELECT dbo.GetSellAmount('2011-05-31') Get_Sell_Amount

--10. Return Name of Product category by product id.

SELECT * FROM Production.Product
SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory

ALTER FUNCTION GetProductCategoryName
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

SELECT dbo.GetProductCategoryName(771) Product_Category_Name


SELECT P.ProductID,PC.Name FROM Production.ProductCategory PC
INNER JOIN Production.ProductSubcategory PS ON PC.ProductCategoryID = PS.ProductCategoryID
INNER JOIN Production.Product P ON PS.ProductSubcategoryID = P.ProductSubcategoryID

-- Table-valued Function Create

CREATE FUNCTION fnGetProductListWithCategory
(
  @category_id INT
)
RETURNS TABLE
RETURN
(
  SELECT 
        P.ProductID,P.Name ProductName,
		PC.ProductCategoryID,PC.Name ProductCategoryName,
		PS.ProductSubcategoryID,PS.Name ProductSubcategoryName
  FROM Production.Product P 
  INNER JOIN Production.ProductSubcategory PS ON PS.ProductSubcategoryID = P.ProductSubcategoryID
  INNER JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PS.ProductCategoryID
  WHERE PC.ProductCategoryID = @category_id
)

SELECT * FROM dbo.fnGetProductListWithCategory(2)