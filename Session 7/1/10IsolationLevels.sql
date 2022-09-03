/*ISOLATION LEVELS IN ACTION*/

--This is Transaction 1
BEGIN TRAN
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
WAITFOR DELAY '00:00:10'
ROLLBACK TRAN

--This is Transaction 2
BEGIN TRAN
SELECT * FROM [dbo].[tblEmployee]
COMMIT TRAN
--Initially we are in lowest isolation level READ COMMITTED

--To change isolation level
--This is Transaction 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED        --We are changing from read committed(default) to read uncommitted
BEGIN TRAN
SELECT * FROM [dbo].[tblEmployee]
COMMIT TRAN

--To change isolation level
--This is Transaction 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ        
BEGIN TRAN
SELECT * FROM [dbo].[tblEmployee]
COMMIT TRAN
--We will read after 10 seconds

--To change isolation level
--This is Transaction 2
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE       
BEGIN TRAN
SELECT * FROM [dbo].[tblEmployee]
COMMIT TRAN
--We wont read new inserted rows

/*ISOLATION LEVELS IN ACTION*/