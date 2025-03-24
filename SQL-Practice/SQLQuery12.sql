
--SQL Variables

DECLARE @name NVARCHAR(20) = '' 
SET @name = 'Bashar'
SET @name = 'Naim'
SELECT @name Name


DECLARE @number INT = 0
SET @number = 2
SET @number = 5
SELECT @number Number



--IF Condition in SQL

DECLARE @data NVARCHAR(10) = ''
DECLARE @value INT = 0

SET @value = 100

IF (@value%2=0)
  BEGIN
   SET @data = 'EVEN'
  END
ELSE
  BEGIN
   SET @data = 'ODD'
  END

PRINT @data
SELECT @data


--WHILE Loop in SQL

DECLARE @i INT = 0
WHILE(@i <= 100)
  BEGIN
    PRINT @i
	SET @i = @i + 1
  END



--Scalar Function Create

CREATE FUNCTION fnGetSum
(
 @a INT,
 @b INT
)
RETURNS INT
AS
BEGIN
  DECLARE @c INT
  SET @c = @a + @b
  RETURN @c
END

SELECT dbo.fnGetSum(5,3)

--EmpNo Input and EName Output

CREATE FUNCTION fnGetEmpnameByEmpno
(
  @Empno INT
)
RETURNS NVARCHAR(50)
AS
BEGIN
  DECLARE @name NVARCHAR(50)
  SELECT @name = EName FROM Emp WHERE EmpNo = @Empno
  RETURN @name
END

SELECT dbo.fnGetEmpnameByEmpno(7499)


SELECT * FROM Emp


--EmpNo Input, Sal Output

CREATE FUNCTION fnGetEmpsalByEmpno
(
  @Empno INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
  DECLARE @Sal DECIMAL(18,2)
  SELECT @Sal = Sal FROM Emp WHERE EmpNo = @Empno
  RETURN @Sal
END

SELECT dbo.fnGetEmpsalByEmpno(7369) EmpSalary,
       dbo.fnGetEmpsalByEmpno(7499) EmpSalary