
-- Creating Triggers

CREATE TRIGGER trInsertProduct
ON Product FOR INSERT
AS 
  BEGIN
      PRINT 'Product has been inserted'
  END
  
SELECT * FROM Product

INSERT INTO Product(Name,ProductCategoryId)
VALUES ('Mobie',1)


---To Show Inserted row when data inserted

ALTER TRIGGER trInsertProduct
ON Product FOR INSERT
AS 
  BEGIN
      SELECT * FROM inserted
  END

-- Inserting Data with Triggers and Updating another table with log information

CREATE TABLE ProductLog
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Remarks NVARCHAR(250),
  CreateTime DATETIME
)

SELECT * FROM ProductLog

ALTER TRIGGER trInsertProduct
ON Product FOR INSERT
AS 
  BEGIN
      DECLARE @product_name NVARCHAR(100) = ' '
	  SELECT @product_name = Name FROM inserted

	  INSERT INTO ProductLog(Remarks,CreateTime)
	  SELECT @product_name + ' has been created' , GETDATE()
  END
 
INSERT INTO Product(Name,ProductCategoryId)
VALUES ('Samosa',2)



-- Deleting Data with Triggers and Updating another table with log information

CREATE TRIGGER trDeleteProduct
ON Product FOR DELETE
AS 
  BEGIN
      DECLARE @product_name NVARCHAR(100) = ' '
	  SELECT @product_name = Name FROM deleted

	  INSERT INTO ProductLog(Remarks,CreateTime)
	  SELECT @product_name + ' has been deleted' , GETDATE()
  END
 
DELETE FROM Product WHERE Id = 13

SELECT * FROM Product
SELECT * FROM ProductLog


-- Updating Data with Triggers and Updating another table with log information

CREATE TRIGGER trUpdateProduct
ON Product FOR UPDATE
AS 
  BEGIN
      DECLARE @deleted_product_name NVARCHAR(100) = ' '
	  DECLARE @inserted_product_name NVARCHAR(100) = ' '
	  SELECT @deleted_product_name = Name FROM deleted
	  SELECT @inserted_product_name = Name FROM inserted

	  INSERT INTO ProductLog(Remarks,CreateTime)
	  SELECT @deleted_product_name + ' has been updated to ' + @inserted_product_name , GETDATE()
  END

SELECT * FROM Product
UPDATE Product SET Name = 'Sports' WHERE Id = 12
SELECT * FROM ProductLog 