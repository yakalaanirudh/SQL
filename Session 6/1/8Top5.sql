/*TOP 5 FROM VARIOUS CATEGORIES*/

SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department
ORDER BY D.Department,EmployeeNumber
--



SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber) AS TheRank
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department
ORDER BY D.Department,EmployeeNumber
--The above gives a column named TheRank
--It restarts at every department


SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber) AS TheRank
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department
WHERE RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber)<=5
ORDER BY D.Department,EmployeeNumber
--The above fails because
--Windowed functions can only appear in SELECT or ORDER BY Clauses
--RANK is a windowed function


SELECT * FROM
(SELECT D.Department,EmployeeNumber,EmployeeFirstName,EmployeeLastName,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY EmployeeNumber) AS TheRank
FROM tblDepartment AS D
JOIN tblEmployee AS E ON D.Department=E.Department) AS Mytable
where TheRank<=5
ORDER BY D.Department,EmployeeNumber
--The above fails because
--ORDER BY fails in subqueries unless TOP,OFFSET or XML is specified



/*TOP 5 FROM VARIOUS CATEGORIES*/