/*WHERE AND NOT*/

SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber in (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName NOT LIKE 'Y%')
ORDER BY E.EmployeeNumber
--This gives all names that does not start with Y
--The above query shows all rows that in both tblEmployee and tblTransaction and not start in Y
--It is like an inner join


SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber NOT IN (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber
--The above query means the rows must be in tblTransaction and not start in Y
--It is like a left join



/*
Inner join and left join like
inner join only from employeenumber 123 to 900
left join employee 1 to 1800
*/

/*WHERE AND NOT*/