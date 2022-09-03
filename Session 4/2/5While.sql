/*WHILE*/

/*


CREATE PROC NameEmployees(@EmployeeNumber int) AS
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
    END
END

GO
execute NameEmployees 123,127
exec NameEmployees 123,127
NameEmployees 123,127


*/
--The above is the initial block
--When we do the above query all data is inone single SELECT statement
--If we want a seperate SELECT statement for every row we use WHILE loop

--WHILE LOOP
CREATE PROC NameEmployees(@EmployeeNumber int) AS
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        DECLARE @EmployeeNumber int=@EmployeeNumberFrom
        WHILE @EmployeeNumber<=@EmployeeNumberTo
        BEGIN
            SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
            SET @EmployeeNumber=@EmployeeNumber+1
            --GOTO Hello
        END
    END
END

GO

--Hello:        --Colon is required

execute NameEmployees 123
exec NameEmployees 123 
NameEmployees 123

    --BREAK -Exits the loop (out of loop)
    --CONTINUE -It goes to the beginning of the loop for the next iteration
    --GOTO -go to a specific line at a point even outside the loop


/*WHILE*/
