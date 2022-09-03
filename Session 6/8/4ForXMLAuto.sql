/*FOR XML AUTO*/

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
	   , E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML AUTO


--What Auto does is if one employye does three trnsaction
/*
<E Employee Number="200">
    <Tran1="asd" />
    <Tran2="asda" />
    <Tran3="asdg" />
</E>
*/

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
	   , E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML AUTO,ELEMENTS
--Same as previous file evrything will be  a element


/*FOR XML AUTO*/