/*FOR XML EXPLICIT*/

/*
The first column must conatin a number tag
The second column needs to be NULL

*/
SELECT E.EmployeeFirstName
	   , E.EmployeeLastName
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , T.Amount
	   , T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
on E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML EXPLICIT


--
SELECT 1 AS Tag,NULL AS PARENT
       ,E.EmployeeFirstName AS [Elements!1!EmployeeFirstName]
	   , E.EmployeeLastName AS [Elements!1!EmployeeLastName]
	   , E.EmployeeNumber AS [Elements!1!EmployeeNumber]
       , E.DateOfBirth  AS [Elements!1!DateOfBirth]
	   , T.Amount AS [Elements!1!Amount]
	   , T.DateOfTransaction AS [Elements!1!DateOfTransaction]
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
on E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML EXPLICIT

--To do a union 
SELECT 1 AS Tag,NULL AS PARENT
       ,E.EmployeeFirstName AS [Elements!1!EmployeeFirstName]
	   , E.EmployeeLastName AS [Elements!1!EmployeeLastName]
	   , E.EmployeeNumber AS [Elements!1!EmployeeNumber]
       , E.DateOfBirth  AS [Elements!1!DateOfBirth]
	   , NULL AS [Elements!2!Amount]        --Change fields in 2 to null
	   , NULL AS [Elements!2!DateOfTransaction]
FROM [dbo].[tblEmployee] AS E
on E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
UNION ALL
SELECT 2 AS Tag,1 AS PARENT             --Name 2nd table as 2 and 1st as parent
       , NULL AS [EmployeeFirstName]    --Changes fields in 1 to null
	   , NULL AS [EmployeeLastName]
	   , NULL AS [EmployeeNumber]
       , NULL  AS [DateOfBirth]
	   , T.Amount 
	   , T.DateOfTransaction 
FROM [dbo].[tblTransaction] AS T
WHERE E.EmployeeNumber BETWEEN 200 AND 202
ORDER BY EmployeeNumber,[Elements!2!Amount]     --the fields in nd table should be written like this
FOR XML EXPLICIT



SELECT E.EmployeeFirstName AS '@EmployeeFirstName'
	   , E.EmployeeLastName AS '@EmployeeLastName'
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , T.Amount AS 'Transaction/Amount'
	   , T.DateOfTransaction AS 'Transaction/DateOfTransaction#'
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
on E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Employees'), ROOT('MyXML')






/*FOR XML EXPLICIT*/