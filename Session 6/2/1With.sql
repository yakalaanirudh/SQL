/*WITH STATEMENT*/

SELECT * FROM
(SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber) AS TheRank
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department) AS Mytable
where TheRank<=5
ORDER BY D.Department,EmployeeNumber
--The above subquery can be improvised with WITH
--The problem with subqueries is we have to rewrite them everytime for additional column it can be avoided with WITH


WITH 
MyTable AS
(SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber) AS TheRank
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department)

SELECT * FROM MyTable
WHERE TheRank<=5
ORDER BY Department,EmployeeNumber
--


--The problem with subqueries is we have to rewrite them everytime for additional column it can be avoided with WITH like below
WITH 
MyTable AS
(SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber) AS TheRank
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department)
Transaction2014 AS 
(SELECT * FROM tblTransaction WHERE DateofTransaction<'2015-01-01')

SELECT * FROM MyTable LEFT JOIN Transaction2014 on MyTable.EmployeeNumber=Transaction2014.EmployeeNumber
WHERE TheRank<=5
ORDER BY Department,EmployeeNumber


--The above With Block can be used in only ONCE in a SELECT CLAUSE ONE TIME ONLY


/*WITH STATEMENT*/