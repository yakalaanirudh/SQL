ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
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

/*Execution 1*/
BEGIN TRAN
    --SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 and EmployeeNumber=132
    --SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN
/*We will get two outputs
1)An empty row of Amount,DateofTransaction,EmployeeNumber,NoColumnName
2)-2.77     2015-05-05 00:00:00     132     Deleted(As value in an unnamed column)

This is becuase the delet triggers an earlier trigger set on delete (2.sql) this is a nested trigger
*/


/*Execution 2*/
BEGIN TRAN
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 and EmployeeNumber=132
    --SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN
/*We will get three outputs
1)CustomerRelations     132     2015-05-05 00:00:00     -2.77
2)An empty row of Amount,DateofTransaction,EmployeeNumber,NoColumnName
3)-2.77     2015-05-05 00:00:00     132     Deleted(As value in an unnamed column)

This is becuase the delet triggers an earlier trigger set on delete (2.sql) this is a nested trigger
*/


/*Execution 3*/
BEGIN TRAN
    --SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
Delete from ViewByDepartment
WHERE TotalAmount=-2.77 and EmployeeNumber=132
SELECT * FROM ViewByDepartment WHERE TotalAmount=-2.77 and EmployeeNumber=132
ROLLBACK TRAN
/*We will get three outputs
1)An empty row of Amount,DateofTransaction,EmployeeNumber,NoColumnName
2)-2.77     2015-05-05 00:00:00     132     Deleted(As value in an unnamed column)
3)An empty row of Department,EmployeeNumber,DateofTransaction,TotalAmount,
This is becuase the delete triggers an earlier trigger set on delete (2.sql) this is a nested trigger

We delete data from the underlying table and so the view updates next time we refresh
It will also work with WITH CHECK OPTION because we are directly deleting data from the underlying table
*/