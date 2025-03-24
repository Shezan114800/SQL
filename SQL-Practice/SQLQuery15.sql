
USE AdventureWorks2022

SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail

SELECT * FROM Production.Product
SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory

--Stored Procedure

CREATE PROCEDURE spGetProductList

AS
  BEGIN
  SELECT 
        P.ProductID,P.Name ProductName,
		PS.ProductSubcategoryID,PS.Name ProductSubCategoryName,
		PC.ProductCategoryID,PC.Name ProductCategoryName
  FROM Production.Product P
  INNER JOIN Production.ProductSubcategory PS ON PS.ProductSubcategoryID = P.ProductSubcategoryID
  INNER JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PS.ProductCategoryID
  END 

EXEC spGetProductList

--Stored Procedure with Parameter

CREATE PROCEDURE spGetProductListByCategory
(
  @productCategoryId INT
)
AS
  BEGIN
  SELECT 
        P.ProductID,P.Name ProductName,
		PS.ProductSubcategoryID,PS.Name ProductSubCategoryName,
		PC.ProductCategoryID,PC.Name ProductCategoryName
  FROM Production.Product P
  INNER JOIN Production.ProductSubcategory PS ON PS.ProductSubcategoryID = P.ProductSubcategoryID
  INNER JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PS.ProductCategoryID
  WHERE PC.ProductCategoryID = @productCategoryId
  END 

EXEC spGetProductListByCategory 3


--ProductId,ProductName,ProductSubcategoryId,ProductSubcategoryName,ProductCategoryId,ProductCategoryName,TotalSale
--SPGetProductListWithTotalSaleByCategoryId

SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail

CREATE PROCEDURE SPGetProductListWithTotalSaleByCategoryId
(
  @productCategoryId INT
)
AS
  BEGIN
  SELECT 
        P.ProductID,P.Name ProductName,
		PS.ProductSubcategoryID,PS.Name ProductSubCategoryName,
		PC.ProductCategoryID,PC.Name ProductCategoryName,
		SUM(S.LineTotal) TotalSale
  FROM Production.Product P
  INNER JOIN Production.ProductSubcategory PS ON PS.ProductSubcategoryID = P.ProductSubcategoryID
  INNER JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PS.ProductCategoryID
  INNER JOIN Sales.SalesOrderDetail S ON S.ProductID = P.ProductID
  WHERE PC.ProductCategoryID = @productCategoryId
  GROUP BY
      P.ProductID,P.Name,
      PS.ProductSubcategoryID,PS.Name,
      PC.ProductCategoryID,PC.Name
  END 

EXEC SPGetProductListWithTotalSaleByCategoryId 3


-- Inserting Value with Stored Procedure

USE OrderManagementSystem

CREATE PROC spInsertCategory
(
  @name NVARCHAR(30)
)
AS
  BEGIN
     INSERT INTO ProductCategory(Name) VALUES (@name)
  END

EXEC spInsertCategory 'Office Supplies'

-- Inserting Values with IF Conditions in Stored Procedure

ALTER PROC spInsertCategory
(
  @categoryId INT = 0,
  @name NVARCHAR(30)
)
AS
  BEGIN
     IF (@categoryId > 0)
	   BEGIN
	      UPDATE ProductCategory SET Name = @name WHERE Id = @categoryId
	   END
	 ELSE
	   BEGIN
	      INSERT INTO ProductCategory(Name) VALUES (@name)  
	   END
  END

EXEC spInsertCategory 0,'Home Decor'

SELECT * FROM ProductCategory

-- Inserting Values in Product Table

CREATE PROC spInsertProduct
(
  @productId INT = 0,
  @name NVARCHAR(30),
  @categoryId INT
)
AS
  BEGIN
     IF (@productId > 0)
	   BEGIN
	      UPDATE Product SET Name = @name, ProductCategoryId = @categoryId 
		  WHERE Id = @productId
	   END
	 ELSE
	   BEGIN
	      INSERT INTO Product(Name,ProductCategoryId) VALUES (@name,@categoryId)  
	   END
  END

EXEC spInsertProduct 7,'Basket Ball',4
EXEC spInsertProduct 8,'Smartphone',1
EXEC spInsertProduct 0,'Pizza',2

SELECT * FROM Product