/*FOR XML PATH*/

--The advantage of path is we can say which fields can be attributes and which fields can be elements

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
FOR XML PATH
--It is same as XML RAW,ELEMENTS


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
FOR XML PATH('Employees')           --Every new row will be a tag of Employees instead of row and all fields will be elements



SELECT E.EmployeeFirstName AS '@EmployeeFirstName'
	   , E.EmployeeLastName AS '@EmployeeLastName'
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , T.Amount
	   , T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
on E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Employees')       --Now EmployeeFirstName and EmploteeLastName wont be elements but they are attributes
--They should be first in SELECT STATEMENT




SELECT E.EmployeeFirstName AS '@EmployeeFirstName'
	   , E.EmployeeLastName AS '@EmployeeLastName'
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , T.Amount AS 'Transaction/Amount'
	   , T.DateOfTransaction AS 'Transaction/DateOfTransaction'
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
on E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Employees')       --Now Amount and DateOfTransaction will be elements in a nested element called Transaction


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
FOR XML PATH('Employees'), ROOT('MyXML')        --Now all data will be stored in a root Element called MyXML



/*FOR XML PATH*/