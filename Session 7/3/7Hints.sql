/*HINTS*/

--HINTS are used to tell SQL the way to execute(how to execute the query)
--HINTS should be written in ()
BEGIN TRAN
UPDATE [dbo].[tblEmployee]
SET Department="Commercial"
WHERE EmployeeNumber=130

SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'
--Now if we run the above block it will take some time because we need to wait for the table to be updated

SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK)
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'
--(NOLOCK) Nolock is a hint that allows us to do dirty reads allowing us to execute the transaction without delay

SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK,FORCESEEK)
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'
--For more than one hint place with a comma
--FORCESEEK Makes sql do a seek instead of scan

SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK,FORCESEEK)
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'
--The above uses NESTED LOOPS


SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK,FORCESEEK)
LEFT HASH JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'
--The above uses HASH JOIN


SELECT D.Department,D.DepartmentHead,E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E WITH (NOLOCK,FORCESEEK)
LEFT MERGE JOIN [dbo].[tblDepartment] AS D
ON E.Department=D.Department
WHERE D.Department='HR'
--The above uses MERGE JOIN

/*HINTS*/