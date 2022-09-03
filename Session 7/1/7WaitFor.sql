/*USING THE WAITFOR STATEMENT*/

BEGIN TRAN
SELECT * FROM [dbo].[tblEmployee]
COMMIT TRAN
--Now there is an intent shared lock on entire table,it removes after transaction end

BEGIN TRAN
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
WAITFOR DELAY '00:00:10'    --It waits for 10 seconds before it goes to next transaction
--Till 10 seconds we cant access taht table in another query

--WAITFOR TIME '00:00:10'     --It waits till 10 seconds past midnight
COMMIT TRAN


/*USING THE WAITFOR STATEMENT*/