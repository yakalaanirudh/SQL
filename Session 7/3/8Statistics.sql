/*STATISTICS IO*/

--STATISTICS IO makes SQL server display the disk activity generated by queries
SET STATISTICS IO ON        --dispalys the disk activity generated by queries
GO
SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK,FORCESEEK)
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'






/*STATISTICS IO*/