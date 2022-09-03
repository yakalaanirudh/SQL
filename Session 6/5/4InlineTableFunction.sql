/*INLINE TABLE FUNCTION*/

--Inline means one statement i.e a single SELECT Statement

/*
Syntax
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


CREATE FUNCTION TransactionList
(
    @EmployeeNumber int
)
RETURNS TABLE AS RETURN
(
    SELECT * FROM tblTransaction
    WHERE EmployeeNumber=@EmployeeNumber
)


--SELECT TransactionList(123) This fails because since return is a table we need a FROM clause

SELECT * FROM dbo.TransactionList(123)      --This works


--
SELECT * FROM tblEmployee
WHERE EXISTS (SELECT * FROM dbo.TransactionList(EmployeeNumber))

/*INLINE TABLE FUNCTION*/