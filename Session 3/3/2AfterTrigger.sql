/*CREATING AN AFTER TRIGGER*/

/*
CREATE TRIGGER tr_tblDepartment         --CREATE TRIGGER triggerName
    ON dbo.tblDepartment                --ON tableName
    AFTER DELETE,INSERT,UPDATE          --FOR,AFTER,INSTEAD OF      --FOR DELETE,INSERT,UPDATE
    AS
    BEGIN
    SET NOCOUNT ON
    END

SET NOCOUNT ON
SELECT * FROM tblDepartment
SET NOCOUNT OFF    --This makes no messages pop like 5 rows affected
*/



CREATE TRIGGER tr_tblDepartment
ON dbo.tblDepartment
AFTER DELETE,INSERT,UPDATE          --It runs after every delete,insert and update
AS
BEGIN
    SELECT * FROM inserted          --Shows all values that are inserted
    SELECT * FROM deleted           --Shows all values that are deleted
    --An update produces one row for insert and one row for delete.It deletes that data and enetrs new data in its place
END
GO 

BEGIN TRAN
INSERT INTO tblTransaction(Amount,DateofTransaction,EmployeeNumber)
VALUES(123,'2015-07-10',123)
ROLLBACK TRAN
GO

/*In the above block from line 18 to line 34
we created a trigger and inserted data in the second block
but there is no select statement in the second
but after the transaction is completed we see two results
1) from the select statement (insert line) in the trigger block showing the data inserted
--123,'2015-07-10',123
2)from the select statement (delete line) in the trigger block showing the data deleted
--This is an empty row
*/


/*CREATING AN AFTER TRIGGER*/
