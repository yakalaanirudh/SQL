/*WHERE*/

SELECT * FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber=T.EmployeeNumber
ORDER BY E.EmployeeNumber       
--We can write EmployeeNumber too(wont work), but giving E.EmployeeNumber tells sql on what number specifically


SELECT * FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber=T.EmployeeNumber
WHERE EmployeeLastName LIKE 'Y%'
ORDER BY E.EmployeeNumber 


SELECT T.* FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber=T.EmployeeNumber
WHERE EmployeeLastName LIKE 'Y%'
ORDER BY E.EmployeeNumber 
--The above block shows only the Table T part of the join

SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber in (126,127,128,129)
ORDER BY E.EmployeeNumber


SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%'


SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber in (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber
--The above block is a way of soing it without performing a join

/*WHERE*/