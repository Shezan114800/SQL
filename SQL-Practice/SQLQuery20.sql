USE OrderManagementSystem

-- Creating Merge

CREATE TABLE sourceProduct
(
  ProductId INT,
  ProductName NVARCHAR(50)
)

CREATE TABLE targetProduct
(
  ProductId INT,
  ProductName NVARCHAR(50)
)

INSERT INTO sourceProduct VALUES
(1,'Rice'),(2,'Apple'),(3,'Orange')

MERGE targetProduct AS Target
USING sourceProduct AS Source
 ON Source.ProductId = Target.ProductId
-- Insert
WHEN NOT MATCHED BY Target THEN
 INSERT (ProductId, ProductName)
 VALUES (Source.ProductId, Source.ProductName)
-- Update
WHEN MATCHED THEN UPDATE
SET Target.ProductName = source.ProductName
-- Delete
WHEN NOT MATCHED BY Source THEN DELETE;

SELECT * FROM sourceProduct
SELECT * FROM targetProduct
INSERT INTO targetProduct VALUES(4,'Banana')
INSERT INTO sourceProduct VALUES(5,'Strawberry')

DELETE FROM targetProduct WHERE ProductName = 'Banana'

--cteProduct

WITH cteProducts
AS
(
  SELECT P.Id ProductId,P.Name ProductName,P.ProductCategoryId,PC.Name ProductCategoryName
  FROM Product P
  INNER JOIN ProductCategory PC ON PC.Id = P.ProductCategoryId
)

SELECT * FROM cteProducts C
INNER JOIN Orders O ON O.ProductId = C.ProductId


--Temptable

SELECT P.Id ProductId,P.Name ProductName,P.ProductCategoryId,PC.Name ProductCategoryName
INTO #tempProducts
FROM Product P
INNER JOIN ProductCategory PC ON PC.Id = P.ProductCategoryId

SELECT * FROM #tempProducts