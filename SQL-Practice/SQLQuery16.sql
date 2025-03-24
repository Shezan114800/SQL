
CREATE DATABASE ProductInformationSystem


USE ProductInformationSystem

--Product table create

CREATE TABLE Products
(
 Id INT PRIMARY KEY,
 ProductName NVARCHAR(50),
 ORIGIN NVARCHAR(50)
)

--Product Category table create

CREATE TABLE ProductCategory
(
 Id INT PRIMARY KEY,
 CategoryName NVARCHAR(50)
)

--Creating foreign key in Product table 

ALTER TABLE Products 
ADD ProductCategoryId INT CONSTRAINT FK_ProductCategoryId FOREIGN KEY REFERENCES ProductCategory(Id)

--Insert values into Product Category table

INSERT INTO ProductCategory(Id,CategoryName)
VALUES (1,'Sport'),(2,'Fruits'),(3,'Electronics')

SELECT * FROM ProductCategory


--Insert values into Products table

INSERT INTO Products(Id,ProductName,ORIGIN,ProductCategoryId)
VALUES (1,'Football','England',1),
       (2,'Apple','India',2),
	   (3,'Banana','Bangladesh',2),
	   (4,'Cricket','England',1),
	   (5,'Racket','England',1),
	   (6,'Hockey','England',1),
	   (7,'Television','Japan',3),
	   (8,'Laptop','Japan',3),
	   (9,'Computer','America',3)


SELECT * FROM Products

-------24/02/25 Day 16-----------

ALTER TABLE Products
ADD UnitPrice DECIMAL(18,2)

ALTER TABLE Products
DROP COLUMN ORIGIN 

DELETE FROM Products
DELETE FROM ProductCategory


---Insert Data into Product Table

CREATE PROC spInsertProductCategoryData
(
  @category_id INT,
  @category_name NVARCHAR(50)
)
AS
   BEGIN
        INSERT INTO ProductCategory(Id,CategoryName)
	    VALUES (@category_id,@category_name)
   END

EXEC spInsertProductCategoryData 1,'Beverages'
EXEC spInsertProductCategoryData 2,'Condiments'
EXEC spInsertProductCategoryData 3,'Confections'

SELECT * FROM ProductCategory

---Insert Data into Product Table

CREATE PROC spInsertProductData
(
  @product_id INT,
  @product_name NVARCHAR(50),
  @product_category_id INT,
  @unit_price DECIMAL(18,2)
)
AS
   BEGIN
        INSERT INTO Products(Id,ProductName,ProductCategoryId,UnitPrice)
	    VALUES (@product_id,@product_name,@product_category_id,@unit_price)
   END

EXEC spInsertProductData 1,'Chal',1,18.0000
EXEC spInsertProductData 2,'Chang',1,19.0000
EXEC spInsertProductData 3,'Aniseed Syrup',2,10.0000
EXEC spInsertProductData 4,'Chef Anton Cajun Seasoning',2,22.0000
EXEC spInsertProductData 5,'Chef Anton Gumbo Mix',2,21.3500
EXEC spInsertProductData 6,'Grandma Boysenberry Spread',3,25.0000


SELECT * FROM Products


---Delete row of products table by categoryId

CREATE PROC spDeleteProductByCategoryId
(
  @product_category_id INT
)
AS
   BEGIN
        DELETE FROM Products 
		WHERE ProductCategoryId = @product_category_id
   END

EXEC spDeleteProductByCategoryId  1

SELECT * FROM Products
