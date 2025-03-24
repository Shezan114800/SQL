
-- Creating Views

CREATE VIEW vwProductList
AS
SELECT P.Id ProductId,P.ProductName ProductName,
       PC.Id ProductCategoryId,PC.CategoryName ProductCategoryName FROM Products P
INNER JOIN ProductCategory PC
  ON PC.Id = P.ProductCategoryId


SELECT * FROM vwProductList


---Create vwEmpList (EmpNo,EName,Sal,DName)

USE EmployeeInformation

CREATE VIEW vwEmpList
AS
SELECT EmpNo,EName,Sal,DName FROM Emp E
INNER JOIN Dept D 
  ON E.DeptId = D.ID

SELECT * FROM vwEmpList