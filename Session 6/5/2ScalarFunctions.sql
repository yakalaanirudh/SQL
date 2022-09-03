/*SCALAR FUNCTIONS*/

--Advantage of functions is we can use them whereevr we can use  a built in function



SELECT DateOfTransaction,EmployeeNumber,Amount,Amount+1 AS AmountPlusOne FROM tblTransaction
--The above gives an extra column named AmountPlusOne whose value is Amount+1

--Below we achieve the same thingg using scalar function

CREATE FUNCTION [dbo].[AmountPlusOne]
(
    @Amount int
)
RETURNS int
AS
BEGIN
    RETURN @Amount+1
END
GO

SELECT DateOfTransaction,EmployeeNumber,Amount,[dbo].AmountPlusOne(Amount) FROM tblTransaction      --[dbo]. is a must
--End of Scalar Function

/*
To insert a function
Right Click on Editor
Insert Snippet
FUNCTION
Create Scalar Function
*/


/*
SCALAR FUNCTION SYNTAX

CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
    @param2 int
)
RETURNS int
AS
BEGIN
    RETURN @param1+@param2
END





*/



/*SCALAR FUNCTIONS*/