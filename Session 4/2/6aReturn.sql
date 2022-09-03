/*RETURN*/


--To get the numbe rof rows in the query
--RETURN 0 means success RETURN 1 means failure

CREATE PROC NameEmployees(@EmployeeNumberFROM int,@EmployeeNumberTo int,@NumberOfRows int OUTPUT) AS        
--Output is telling SQL that is something to export
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
        SET @NumberOfRows=@@ROWCOUNT
        RETURN 0
    END
    ELSE
    BEGIN
        SET @NumberofRows=0             --For no rows in query and it wont be NULL
        RETURN 1
    END
END
GO

--Before we execute the procedure we should Declare the variable for number of rows
DECLARE @NumberRows int
execute NameEmployees 123,127,@NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount

DECLARE @NumberRows int
exec NameEmployees 123,127,@NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount
--We cant use it for the below format because we need to decalre the variable 
--but then the below statement will no longer be the beginning of the new batch
NameEmployees 123,127,@NumberRows OUTPUT
--


DECLARE @NumberRows int
execute NameEmployees @NumberFrom=123,@NumberTo=127,@NumberOfRows=@NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount


/**/
GO
DECLARE @a=10
GO
--In the above block that variable is for that batch only i.e it is block scoped




/*RETURN*/
