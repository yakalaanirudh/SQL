/*MULTI-STATEMENT TABLE FUNCTION*/

/*
Syntax for INLINE TABLE FUNCTION


CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int
    @param2 char(5)
)
RETURNS TABLES AS RETURN
(
    SELECT  @param1 AS C1
            @param2 AS C2
)


*/


/*
Syntax for MULTI STATEMENT TABLE FUNCTION


CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int
    @param2 char(5)
)
RETURNS @returntable TABLE      --This returns a variable table and below we define how table looks like
(
    [C1] int
    [C2] char(5)
)

AS
BEGIN                           --here we insert values into the table
    INSERT @returntable
    SELECT @param1,@param2
    RETURN
END


*/


--An Inline function
CREATE FUNCTION [dbo].[TransactionList]
(
    @EmployeeNumber int
)
RETURNS TABLE AS RETURN
(
    SELECT * FROM tblTransaction WHERE EmployeeNumber=@EmployeeNumber
)
GO
SELECT * FROM dbo.TransactionList(123)
--An Inline function



--MULTI STATEMENT TABLE FUNCTION
CREATE FUNCTION [dbo].[TransList]
(
    @EmployeeNumber int
)
RETURNS @TransList TABLE
(
    Amount SMALLMONEY,
    DateOfTransaction SMALLDATETIME,
    EmployeeNumber INT
)
AS
BEGIN
    INSERT INTO @TransList(Amount,DateOfTransaction,EmployeeNumber)
    SELECT * FROM tblTransaction WHERE EmployeeNumber=@EmployeeNumber
    RETURN
END

SELECT * FROM dbo.TransList(123)

--the advanatge of multiline is unlike inline we can define like
--if a=odd run this
--else a=even run this


/*MULTI-STATEMENT TABLE FUNCTION*/