/*CREATING AN INSTEAD OF TRIGGER*/

/*
CREATE TRIGGER tr_tblDepartment
    ON dbo.tblDepartment
    INSTEAD OF DELETE,INSERT
    AS
    BEGIN
    SET NOCOUNT ON
    END
    --With After trigger we can choose all 3 Insert,update and delete in the same trigger
    --With Instead Of trigger we can use delete or insert
    --And we cant use them in same trigger
    --If we want to use them both 
    --then write one trigger for delete and one trigger for insert
*/

CREATE TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    SELECT *,ViewByDepartment FROM deleted
    
END
GO 

BEGIN TRAN
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 and EmployeeNumber=132
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN

/*
IF WE RUN ONLY THE DELETE STATEMENT
We will get an output from DELETE statement itself as it triggers the Instead of trigger 
and in it we will get the data to be deleted with an an extra unnamed column with a value ViewByDepartment
--CustomerRelations     132     2015-05-05 00:00:00     -2.77   ViewByDepartment


IF W ERUN THE ENTIRE TRANSACTION
we will get three output boxes
--CustomerRelations     132     2015-05-05 00:00:00     -2.77 from First Select Statement in line 29
--CustomerRelations     132     2015-05-05 00:00:00     -2.77   ViewByDepartment    from trigger
--CustomerRelations     132     2015-05-05 00:00:00     -2.77 from First Select Statement in line 32
--The data is not deleted as the view modifies multiple tables



/*CREATING AN INSTEAD OF TRIGGER*/