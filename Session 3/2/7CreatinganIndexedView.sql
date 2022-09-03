/*CREATING AN INDEXED VIEW*/


CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment on dbo.ViewByDepartment(EmployeeNumber,Department)
--CREATE UNIQUE CLUSTERED INDEX NameOfIndex on TabaleName(Columns to be included in index)

CREATE view [dbo].[ViewbyDepartment] with schemabinding AS      --with schemabinding we should type it to create a indexed view
SELECT D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount
FROM dbo.tblDepartment as D
INNER JOIN tblEmployee as E
on D.Department=E.Department
INNER JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber between 120 and 139
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment on dbo.ViewByDepartment(EmployeeNumber,Department)
--We removed left joins, added dbo. as schema and added with with schemabinding and removed check option
--This creates a indexed view


/*
Suppose there is a table of 1000 rows,with a column anmed employeenumber and another named department
if in index we give employee number
and in select statement we use dept=customer relations where employeeNumber between 120 and 139
then SQL will go through the index and to find between 120 and 139
and then go to table to fing where the dept is customer relations just for those 20 rows so the search will be faster

Suppose there is a table of 1000 rows,with a column anmed employeenumber and another named department
if in index we give employee number and dept
and in select statement we use dept where employeeNumber between 120 and 139
then SQL will go through the index and to find between 120 and 139 and where dept=customer relations
so the search will be even faster

*/
/*CREATING AN INDEXED VIEW*/