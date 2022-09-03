/*A MORE COMPLICATED SCALAR FUNCTION*/

--Functions cant have same name in the same database just like procedure


IF EXISTS(SELECT * FROM sys.objects WHERE NAME='NumberOfTransactions')     --Drop function
DROP FUNCTION NumberOfTransactions
GO

/*
Or we can drop like this too
IF object_ID(N'NumerOfTransactions',N'FN') IS NOT NULL
DROP FUNCTION NumberOfTransactions
GO
*/

CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS int
AS
BEGIN
    DECLARE @NumberOfTransactions int
    SELECT @NumberOfTransactions=COUNT(*) FROM tblTransaction
    WHERE EmployeeNumber=@EmployeeNumber
    RETURN @NumberOfTransactions
END

SELECT *,dbo.NumberOfTransactions(EmployeeNumber) AS TransNum FROM tblEmployee
--The above statement gives an extra column named TransNum with Number of Trnsactions

--We can also achieve the above using join and where
--If we do that we can observe that function process executes faster than Join and Where process


/*A MORE COMPLICATED SCALAR FUNCTION*/