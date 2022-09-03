/*DELETING ROWS IN VIEWS*/

/*We cant delete rows from a view if it alters multiple tables at once*/
SELECT * FROM ViewByDepartment
DELETE FROM ViewByDepartment
WHERE TotalAmount=999.99 and EmployeeNumber=132
GO

/*The below block alters only one base table through deletion*/
CREATE VIEW viewsimple AS SELECT * FROM tblTransaction
GO
BEGIN TRAN 
DELETE FROM ViewSimple
WHERE AMOUNT =999.99 AND EmployerNumber=132
ROLLBACK TRAN



/*DELETING ROWS IN VIEWS*/