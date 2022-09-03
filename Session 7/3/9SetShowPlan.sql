/*SET SHOWPLAN_ALL AND CLIENT STATISTICS*/

SET SHOWPLAN_ALL ON        --dispalys the execution plan in text
GO
SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK,FORCESEEK)
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'

--Similar coomands are
SET SHOWPLAN_XML ON 
SET SHOWPLAN_TEXT ON 
--There are used from Outside SSMS

--CLIENT statistics shows execution time,number of insert,delete and all the data regarding the query


SET STATISTICS TIME ON          --shows how long it took to execute
GO

SET STATISTICS IO ON            --shows disk statistics for the query
GO


/*SET SHOWPLAN_ALL AND CLIENT STATISTICS*/