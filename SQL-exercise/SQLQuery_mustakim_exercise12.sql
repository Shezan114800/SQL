

---------Exercise(Day 18) | (03-07-2025) ----------------

USE ProductInformationSystem

-- 1.Create a delete trigger on product sub category.(Create a shadow table and insert deleted data here)

CREATE TABLE ProductLogInfo
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Remarks NVARCHAR(250),
  CreateTime DATETIME
)

CREATE TRIGGER trDeleteProductSubCategory
ON ProductSubCategory FOR DELETE
AS 
  BEGIN
      DECLARE @product_subcategory_name NVARCHAR(100) = ' '
	  SELECT @product_subcategory_name = Name FROM deleted

	  INSERT INTO ProductLogInfo(Remarks,CreateTime)
	  SELECT @product_subcategory_name + ' has been deleted' , GETDATE()
  END
 
DELETE FROM ProductSubCategory WHERE Id = 2

SELECT * FROM ProductSubCategory
SELECT * FROM ProductLogInfo


-- 2.Create an insert trigger tblOrder table

CREATE TABLE tblOrder
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  OrderNo NVARCHAR(50),
  ProductId INT,
  Quantity INT,
  Price DECIMAL(18,2)
)

INSERT INTO tblOrder (OrderNo, ProductId, Quantity, Price) 
VALUES 

CREATE TRIGGER trInsert_tblOrder
ON tblOrder FOR INSERT
AS 
  BEGIN
      SELECT * FROM inserted
  END

INSERT INTO tblOrder(OrderNo, ProductId, Quantity, Price) 
VALUES ('ORD001', 1, 10, 15.00), -- Football
       ('ORD002', 2, 20, 1.50),  -- Apple
       ('ORD003', 3, 30, 0.75),  -- Banana
       ('ORD004', 4, 5, 50.00),  -- Cricket
       ('ORD005', 5, 8, 30.00),  -- Racket
       ('ORD006', 6, 12, 25.00), -- Hockey
       ('ORD007', 7, 3, 200.00), -- Television
       ('ORD008', 8, 6, 1000.00), -- Laptop
       ('ORD009', 9, 4, 800.00); -- Computer
       ('ORD010', 10, 2, 200.00) -- Tennisball

SELECT * FROM tblOrder

-- 3.Create an update trigger to tblOrder table

CREATE TRIGGER trUpdate_tblOrder
ON tblOrder FOR UPDATE
AS 
  BEGIN
      DECLARE @deleted_order NVARCHAR(100) = ' '
	  DECLARE @inserted_order NVARCHAR(100) = ' '
	  SELECT @deleted_order = OrderNo FROM deleted
	  SELECT @inserted_order = OrderNo FROM inserted

	  INSERT INTO ProductLogInfo(Remarks,CreateTime)
	  SELECT @deleted_order + ' has been updated to ' + @inserted_order , GETDATE()
  END

UPDATE tblOrder SET OrderNo = 'ORD011' WHERE Id = 10

SELECT * FROM tblOrder
SELECT * FROM ProductLogInfo

-- 4.Create a delete trigger to tblOrder table. .(Create a shadow table and insert deleted data here)

CREATE TRIGGER trDelete_tblOrder
ON tblOrder FOR DELETE
AS 
  BEGIN
      DECLARE @order_no NVARCHAR(100) = ' '
	  SELECT @order_no = OrderNo FROM deleted

	  INSERT INTO ProductLogInfo(Remarks,CreateTime)
	  SELECT @order_no + ' has been deleted' , GETDATE()
  END
 
DELETE FROM tblOrder WHERE Id = 10

SELECT * FROM tblOrder
SELECT * FROM ProductLogInfo

-- 5.Create a delete trigger on product table. .(Create a shadow table and insert deleted data here)

CREATE TRIGGER trDeleteProduct
ON Products FOR DELETE
AS 
  BEGIN
      DECLARE @product_name NVARCHAR(100) = ' '
	  SELECT @product_name = ProductName FROM deleted

	  INSERT INTO ProductLogInfo(Remarks,CreateTime)
	  SELECT @product_name + ' has been deleted' , GETDATE()
  END
 
DELETE FROM Products WHERE Id = 7

SELECT * FROM Products
SELECT * FROM ProductLogInfo