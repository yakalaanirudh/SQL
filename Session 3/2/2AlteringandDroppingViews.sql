/*ALTERING AND DROPPING VIEWS*/


/*We cant drop/alter  a view that doesnt exist*/
--BLOCK 1           --To Alter views add ALTER
ALTER VIEW ViewByDepartment AS
SELECT TOP(1000) D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount --or SELECT TOP(100) PERCENT
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber between 120 and 139
ORDER BY D.Department,T.EmployeeNumber
GO


DROP VIEW ViewbyDepartment/* This statement drops the view*/


SELECT * FROM sys.views /*This statement gives all available views*/
SELECT * FROM sys.views WHERE name ="ViewbyDepartment"

IF EXISTS(SELECT * FROM sys.views WHERE name ="ViewbyDepartment")  /*We cant drop/alter  aview that doesnt exist*/
DROP VIEW ViewbyDepartment


/*We can also write as*/
IF EXISTS(SELECT * FROM INFORMATION_SCHEMEA.VIEWS WHERE [TABLE_NAME]="ViewbyDepartment" AND [TABLE_SCHEMA]='dbo')  


/*ALTERING AND DROPPING VIEWS*/