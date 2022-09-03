/*NESTED LOOPS AND MERGE JOINS IN ACTION*/

SELECT * FROM [dbo].[tblEmployee] AS E LEFT JOIN [dbo].[tblDepartment] AS
ON E.Department=D.Department
--if we execute this and select EXECUTION PLAN we notice it chooses HASH MATCH


SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E LEFT JOIN [dbo].[tblDepartment] AS
ON E.Department=D.Department
WHERE D.Department='HR'
--if we execute this and select EXECUTION PLAN we notice it chooses NESTED LOOP and hence the cost is less for that step




/*NESTED LOOPS AND MERGE JOINS IN ACTION*/