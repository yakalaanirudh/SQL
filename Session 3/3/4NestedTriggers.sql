/*NESTED TRIGGERS*/

@@NESTLEVEL --It tells who deep the triggers are
ALTER TRIGGER tr_tblTransaction
ON dbo.tblTransaction
AFTER DELETE,INSERT,UPDATE          --It runs after every delete,insert and update
AS
BEGIN
    BEGIN
        SELECT @@NESTLEVEL AS Nest_Level
        SELECT * FROM inserted          --Shows all values that are inserted
        SELECT * FROM deleted           --Shows all values that are deleted
        --An update produces one row for insert and one row for delete.It deletes that data and enetrs new data in its place
    END
END
GO 


BEGIN TRAN
INSERT INTO tblTransaction(Amount,DateofTransaction,EmployeeNumber)
VALUES(123,'2015-07-10',123)
ROLLBACK TRAN
GO
/*After the above block execution
We get three outputs
1       --Showing the nest level
123.00      2015-07-10 00:00:00         123
An empty row as nothing is being deleted


*/

BEGIN TRAN
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 and EmployeeNumber=132
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN
/*After the above block execution we will get 5 outputs
1)CustomerRelations     132     2015-05-15 00:00:00     -2.77
2)2     --Telling nest level
3)An empty row
4)-2.77     2015-05-15 00:00:00         132
5)An empty row
*/


--If we want the trigger to execute only on first level
ALTER TRIGGER tr_tblTransaction
ON dbo.tblTransaction
AFTER DELETE,INSERT,UPDATE          
AS
BEGIN
    IF  @@NESTLEVEL =1
    SELECT * FROM inserted          
    SELECT * FROM deleted           
END
GO 

--If we are in a situation where nested triggers continue deeper the nesting trigger execution will stop after level 32
--After triggers cant be recursive but instead of triggers can be recursive

/*NESTED TRIGGERS*/