/*APPLY*/

SELECT * FROM dbo.TransList(123)
GO

SELECT *,(SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber)) AS NumTransactions
FROM tblEmployee AS E

SELECT * FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber=T.EmployeeNumber

--We can see that the two blocks above work individually

SELECT * FROM tblEmployee AS E
LEFT JOIN TransList(E.EmployeeNumber) AS T
ON E.EmployeeNumber=T.EmployeeNumber
--the above fails because we cant join a function result and a table using JOIN
--We have to use APPLY for joining a function result and a table


SELECT * FROM tblEmployee AS E
OUTER APPLY TransList(E.EmployeeNumber) AS T
ON E.EmployeeNumber=T.EmployeeNumber


--There are two types of APPLY
--OUTER APPLY
--CROSS APPLY


--OUTER APPLY       --All of tblEmployee,UDF 0+ rows
--CROSS APPLY       --Only where UDF returns 1 or more rows

--OUTER APPLY is like OUTER JOIN
--CROSS APPLY is like INNER JOIN

/*APPLY*/