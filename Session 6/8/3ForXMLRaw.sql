/*FOR XML RAW*/

--To convert existing table into XML

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
	   , E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
--The above is a normal sql statement



SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
	   , E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW
--This is for XML
--Output
--<Row FirstName="Anirudh" LastName="Yakala" EmployeeNumber="200" />


SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
	   , E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW('MyRow')
--This is for XML
--Output
--<MyRow FirstName="Anirudh" LastName="Yakala" EmployeeNumber="200" />


SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
	   , E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW('MyRow'),ELEMENTS
--This is for XML
--Output
/*
<MyRow>
    <FirstName>Anirudh</FirstName>
    <LastName>Yakala</LastName>
    <EmployeeNumber>200</EmployeeNumber>
</MyRow>


/*FOR XML RAW*/