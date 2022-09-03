/*PLAN GUIDES*/

CREATE PROC procTransactionBig(@EmployeeNumber AS INT) WITH RECOMPILE
AS
SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E LEFT JOIN [dbo].[tblDepartment] AS
ON E.Department=D.Department
WHERE D.Department='HR'

--WITH RECOMPILE makes computer create a new execution plan for a query making it choose the optimal one for every query




/*PLAN GUIDES*/