/*EXPLICIT TRANSACTIONS*/

--We can turnan implicit transaction to an explicit one by adding begin transaction and commit transaction

BEGIN TRANSACTION 

SELECT * FROM [dbo].[tblEmployee]

--END TRANSACTION     --END TRANSACTION wont work because we are not telling the system whether we are telling it to succeed or fail

--So we write the below two to end a transaction
COMMIT TRANSACTION      --For success
ROLLBACK TRANSACTION    --For Failure



--
BEGIN TRANSACTION
SELECT * FROM [dbo].[tblEmployee]
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
COMMIT TRANSACTION

SELECT * FROM [dbo].[tblEmployee]
--



--The below is not a transaction but  apart of a transaction
BEGIN TRANSACTION
SELECT * FROM [dbo].[tblEmployee]
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
--COMMIT TRANSACTION

--Now in a new query if we write
SELECT * FROM [dbo].[tblEmployee]
--It wont show the result because the earlier transaction is not complete so this new transaction has no access to the table

--We can use TRAN instead of TRANSACTION


--SPECIAL CONDITION
--The below is not a transaction but  apart of a transaction
BEGIN TRANSACTION
SELECT * FROM [dbo].[tblEmployee]
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
--COMMIT TRANSACTION

--Now in a new query if we write
SELECT * FROM [dbo].[tblEmployee] --It works
--Because there is no 123 in the table initially 
--SPECIAL CONDITION



/*EXPLICIT TRANSACTIONS*/