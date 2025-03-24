USE StudentManagement

-- LAG Function

SELECT Name,SUM(Mark) Mark INTO #marks FROM StudentMark M 
INNER JOIN Students S ON S.ID = M.StudentId
GROUP BY Name

SELECT Name,Mark,LAG(Mark) OVER (ORDER BY Mark ASC) Lag_mark,
(Mark - LAG(Mark) OVER (ORDER BY Mark ASC)) Diff
FROM #marks

-- LEAD Function

SELECT Name,Mark,LEAD(Mark) OVER (ORDER BY Mark ASC) Lead_mark,
(LEAD(Mark) OVER (ORDER BY Mark ASC) - Mark) Diff
FROM #marks


--RANK Function

SELECT Name,Mark,RANK() OVER (ORDER BY Mark DESC) Rank_mark
FROM #marks ORDER BY Mark DESC

--DENSE_RANK Function

SELECT Name,Mark,DENSE_RANK() OVER (ORDER BY Mark DESC) Dense_Rank_mark
FROM #marks ORDER BY Mark DESC


--Transaction,Commit,Rollback

BEGIN TRANSACTION
UPDATE StudentMark SET Mark = 96.50 WHERE Id = 4

COMMIT TRANSACTION

ROLLBACK TRANSACTION

SELECT * FROM StudentMark


---Try...Catch Block

BEGIN TRY
  SELECT 1/0
END TRY
BEGIN CATCH
  SELECT ERROR_NUMBER() Number,
         ERROR_MESSAGE() Message,
		 ERROR_LINE() Line,
		 ERROR_STATE() State
END CATCH

---

BEGIN TRY
  BEGIN TRANSACTION
  UPDATE StudentMark SET Mark = 80.00 WHERE Id = 4
  SELECT 1/0
  COMMIT TRANSACTION
END TRY

BEGIN CATCH
  ROLLBACK TRANSACTION
  SELECT ERROR_NUMBER() Number,
         ERROR_MESSAGE() Message,
		 ERROR_LINE() Line,
		 ERROR_STATE() State
END CATCH