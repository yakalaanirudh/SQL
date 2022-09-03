/*CORRELATED SUBQUERY-WHERE*/

SELECT *,(SELECT COUNT(T.employeeNumber) FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS NumTransactions
         (SELECT SUM(Amount) FROM tblTransaction AS T WHERE T.EmployeeNumber=E.EmployeeNumber) AS TotalAmount
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'Y%'
--The above is a correlated subquery in SELECT clause



SELECT * FROM tblTransaction AS T
WHERE EXISTS(SELECT EmployeeNumber FROM tblEmployee AS E WHERE EmployeeLastName LIKE 'Y%' AND T.EmployeeNumber=E.EmployeeNumber)
ORDER BY EmployeeNumber
--The above is a correlated subquery in WHERE clause



SELECT *,
(SELECT EmployeeNumber FROM tblEmployee AS E WHERE EmployeeLastName LIKE 'Y%' AND T.EmployeeNumber=E.EmployeeNumber) AS doesitExists
FROM tblTransaction AS T
--The above block it has an extracolumn named doesitExits where it shows NULL at non-existing rows
--The subquery is in SELECT Clause


/*CORRELATED SUBQUERY-WHERE*/