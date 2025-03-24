USE OrderManagementSystem

-- OrderLog (Id,Remarks)

CREATE TABLE OrderLog
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Remarks NVARCHAR(250)
)

-- Creating (Insert) Triggers for Orders Table 

CREATE TRIGGER trInsertOrders
ON Orders FOR INSERT
AS 
  BEGIN
      DECLARE @order_no NVARCHAR(100) = ' '
	  SELECT @order_no = OrderNo FROM inserted

	  INSERT INTO OrderLog(Remarks)
	  SELECT @order_no + ' has been Inserted'
  END
 
INSERT INTO Orders(OrderNo,ProductId,Quantity,Price)
VALUES ('Order-10',2,8,7000)

SELECT * FROM Orders
SELECT * FROM OrderLog


-- Creating Index

SELECT * FROM Product

CREATE INDEX idx_Products_Name
ON Product(Name)


SELECT id,Name FROM Product

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


MERGE TargetProduct AS Target
USING SourceProduct AS Source
 ON Source.ProductId = Target.ProductId
WHEN NOT MATCHED BY Target THEN
 INSERT (ProductId, ProductName)
 VALUES (Source.ProductId, Source.ProductName);

SELECT * FROM sourceProduct

SELECT * FROM targetProduct