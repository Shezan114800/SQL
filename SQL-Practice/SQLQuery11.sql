
--Insert two data into product table where category is null

INSERT INTO Product (Name,ProductCategoryId)
VALUES ('Smartphone',NULL),('Mobile',NULL)

SELECT * FROM Product


--ProductName,ProductCategoryName


SELECT 
  p1.Name AS ProductName,
  p2.Name AS ProductCategoryName
FROM Product p1
LEFT JOIN Product p2 ON p1.ProductCategoryId = p2.Id