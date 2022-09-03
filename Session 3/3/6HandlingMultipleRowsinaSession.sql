/*HANDLING MULTIPLE ROWS IN A SESSION*/

ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    SELECT *,'To be Deleted' FROM deleted
    DECLARE @EmployeeNumber AS int 
    DECLARE @DateofTransaction AS smalldatetime
    DECLARE @Amount AS smallmoney

    --SELECT *,ViewByDepartment FROM deleted
    SELECT @EmployeeNumber=EmployeeNumber,@DateofTransaction=DateofTransaction,@Amount=TotalAmount FROM deleted

    DELETE tblTransaction
    FROM tblTransaction AS T
    WHERE T.EmployeeNumber=@EmployeeNumber
    and T.DateofTransaction=@DateofTransaction
    and T.Amount=@Amount
END
GO


BEGIN TRAN
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN

/*The above process deletes only one row
Suppose there are four rows where TotalAmount=-2.77
After this entire code execution there will be 3 rows because It will delete only one row (The last row)
*/

--To Circumvent it


ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    SELECT *,'To be Deleted' FROM deleted
    delete tbltransaction
    from tblTransaction AS T 
    join deleted AS D
    on T.EmployeeNumber=D.EmployeeNumber
    and T.DateOfTransaction=D.DateOfTransaction
    and T.Amount=D.Amount

END
GO


BEGIN TRAN
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN


/*
    delete tbltransaction
    from tblTransaction AS T 
    join deleted AS D

what it means is we are deleting from tblTransaction and we are doing it from the tblTransaction joined by deleted
*/



/*HANDLING MULTIPLE ROWS IN A SESSION*/