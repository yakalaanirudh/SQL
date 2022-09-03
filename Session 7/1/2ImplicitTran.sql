/*IMPLICIT TRANSACTIONS*/

SELECT * FROM [dbo].[tblEmployee]
--This is called an Implicit Transaction because we are not specifically telling it is a transaction
--System knows it is a transaction implicitly


UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
--When the above transaction is happening no other transaction has access to row EmployeeNumber122




/*IMPLICIT TRANSACTIONS*/