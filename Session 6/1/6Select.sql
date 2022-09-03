/*SELECT*/

SELECT * FROM tblEmployee WHERE E.EmployeeLastName LIKE 'Y%'
--


SELECT E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,COUNT(T.EmployeeNumber) AS NumTransactions
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber=T.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'Y%'
GROUP BY E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName
ORDER BY E.EmployeeNumber
--The above block does it by join



SELECT COUNT(T.employeeNumber) AS NumTransactions FROM tblTransaction AS T
--The above block gives number of times an employee performs transaction 


SELECT *,(SELECT COUNT(T.employeeNumber) AS NumTransactions FROM tblTransaction AS T) 
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above block work albeit same value in every column NumTransactions but the coumn will be unnamed



SELECT *,(SELECT COUNT(T.employeeNumber) FROM tblTransaction AS T) AS NumTransactions
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above block gives column the name but the value is same in every row

SELECT *,(SELECT COUNT(T.employeeNumber) FROM tblTransaction AS T WHERE T.EmployeeNumber=126) AS NumTransactions
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above block gives the same value (how many times employee 126 performs transaction in every row)



SELECT *,(SELECT COUNT(T.employeeNumber) FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS NumTransactions
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above is called a correlated sub query
--It is because we cant run in the inner query alone without running the outer query and vice-versa


SELECT *,(SELECT T.DateofTransaction FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS NumTransactions
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above fails because we returned more than 1 value
--That is one employee numbe rcan have multiple transactions


SELECT *,(SELECT COUNT(T.employeeNumber),SUM(Amount) FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS NumTransactions
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above fails because we can return only 1 value from a correlated subquery
--We can do the above by writing two queries



SELECT *,(SELECT COUNT(T.employeeNumber) FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS NumTransactions
         (SELECT SUM(Amount) FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS TotalAmount
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'



/*SELECT*/