/*SARG*/

--SARG-is a form of WHERE
--SARG-Search Argument
--SARGs are faster

WHERE DateOriginal=2020   
--It is not a SARG
--Because DateOriginal can have an index but DateOriginal doesnt have one so it is not a SARG
WHERE DateOriginal>='2020-01-01' AND DateOriginal<'2021-01-01'
--It is a SARG


WHERE SUBSTRING(PersonName,1,4)='John'
--It is not a SARG
--Because PersonName can have an index but PersonName doesnt have one so it is not a SARG
WHERE PersonName LIKE 'John%'
--It is a SARG

--Bottom Line is if we include a field in a function or use a derivative of it,it is not a sarg


SELECT E.EmployeeNumber,T.Amount FROM [dbo].[tblEmployee] AS E LEFT JOIN [dbo].[tblDepartment] AS
ON E.Department=D.Department
WHERE E.EmployeeNumber/10=34
--The above is not a SARG WHERE E.EmployeeNumber/10=34 because E.EmployeeNumber/10 is a derivative of E.EmployeeNumber

SELECT E.EmployeeNumber,T.Amount FROM [dbo].[tblEmployee] AS E LEFT JOIN [dbo].[tblDepartment] AS
ON E.Department=D.Department
WHERE E.EmployeeNumber BETWEEN 340 AND 349
--The above is a SARG



/*SARG*/