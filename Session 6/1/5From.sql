/*FROM*/

SELECT * FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber=T.employeeNumber
WHERE EmployeeLastName LIKE 'Y%'
ORDER BY E.EmployeeNumber           --8 rows

SELECT * FROM tblEmployee           --1005 rows

SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE 'Y%'    --4 rows


SELECT * FROM tblTransaction AS T
INNER JOIN (SELECT * FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%' ) AS E
ON E.EmployeeNumber=T.EmployeeNumber
WHERE EmployeeLastName LIKE 'Y%'
ORDER BY E.EmployeeNumber           --8 rows
--Which block is better 1 or 4 for this we use ESTIMATED EXECUTION PLAN


/*FROM*/