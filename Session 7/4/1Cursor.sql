/*HOW TO WRITE A CURSOR*/

--If we do a SELECT Statement we will get a 1000 rows
--But if we want a select statement for every row we use a cursor

/*

--STEPS TO WRITE A CURSOR

DECLARE cursor CURSOR FOR SELECT statement FROM table

OPEN cursor     --gets 0th row

FETCH cursor INTO   --gets next row

CLOSE cursor


@@FETCH_STATUS  --returns 0 if still retrieving data returns 1 if cursor has failed

*/


SELECT * FROM [dbo].[tblEmployee] WHERE EmployeeNumber BETWEEN 120 AND 199


--Cursor process
DECLARE @EmployeeID INT     --This variable holds the employeeNumber
DECLARE csrName CURSOR FOR
SELECT EmployeeNumber
FROM [dbo].[tblEmployee]
WHERE EmployeeNumber BETWEEN 120 AND 199



OPEN csrName
FETCH NEXT FROM csrName INTO @EmployeeID        --This gets first row
WHILE @@FETCHSTATUS=0
    SELECT * FROM [dbo].[tblEmployee] WHERE EmployeeNumber =@EmployeeID     --Gets all data for that employeeNumber
    FETCH NEXT FROM csrName INTO @EmployeeID
END
CLOSE csrName
DEALLOCATE csrName      --Deallocates memory allocated for that cursor

--Cursor is a way to write  N SELECT statements in one statement
--The disadvanatge of cursor is it takes so much time
--Because we cursor is like using select statement multiple times we need to go from SSMS to server multiple times
--thereby using network resources,bandwidth multiple times
--Since we are using multiple times we are placing locks for more time preventing other users from using the table


/*HOW TO WRITE A CURSOR*/