/*UPDATE FUNCTIONS*/


ALTER TRIGGER tr_tblTransaction
ON dbo.tblTransaction
AFTER DELETE,INSERT,UPDATE          --It runs after every delete,insert and update
AS
BEGIN
    BEGIN
        SELECT @@NESTLEVEL AS Nest_Level
        SELECT *,'inserted-tblTransaction' FROM inserted          --Shows all values that are inserted
        SELECT *,'deleted-tblTransaction' FROM deleted           --Shows all values that are deleted
        --An update produces one row for insert and one row for delete.It deletes that data and enetrs new data in its place
    END
END
GO

INSERT INTO tblTransaction(Amount,DateofTransaction,EmployeeNumber)
VALUES(123,'2015-07-11',123)


SELECT *FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
BEGIN TRAN
DELETE FROM ViewByDepartment
WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN


/*We can know how many rows are affected by using row count*/
ALTER TRIGGER tr_tblTransaction
ON dbo.tblTransaction
AFTER DELETE,INSERT,UPDATE          --It runs after every delete,insert and update
AS
BEGIN
    BEGIN
        IF @@ROWCOUNT>0         --If rows affected>0 the run below begin end block
        BEGIN
            SELECT *,'inserted-tblTransaction' FROM inserted          --Shows all values that are inserted
            SELECT *,'deleted-tblTransaction' FROM deleted           --Shows all values that are deleted
            --An update produces one row for insert and one row for delete.It deletes that data and enetrs new data in its place
        END
    END
END
GO


/*
BEGIN
        IF UPDATE(DateOfTransaction)         --If date of transaction updated run below block
        BEGIN
            SELECT *,'inserted-tblTransaction' FROM inserted          --Shows all values that are inserted
            SELECT *,'deleted-tblTransaction' FROM deleted           --Shows all values that are deleted
            --An update produces one row for insert and one row for delete.It deletes that data and enetrs new data in its place
        END
END

/*
Tocheck if column are updated
BEGIN
        IF COLUMNS_UPDATED()         --If column updated run below block
        BEGIN
            SELECT *,'inserted-tblTransaction' FROM inserted          --Shows all values that are inserted
            SELECT *,'deleted-tblTransaction' FROM deleted           --Shows all values that are deleted
            --An update produces one row for insert and one row for delete.It deletes that data and enetrs new data in its place
        END
END
*/

/*UPDATE FUNCTIONS*/