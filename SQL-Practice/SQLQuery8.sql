
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