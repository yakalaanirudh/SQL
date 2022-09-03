/*GENERATING A LIST OF NUMBERS*/

SELECT * FROM tblEmployee
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
--The above block is used to find employeenumber who does not have a transaction in tblTransaction
--The above block gives numbers who do not have a row in tblTransaction but have in tblEmployee



--
WITH Numbers AS
(SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber
FROM tblTransaction AS U)

SELECT U.RowNumber FROM Numbers AS U
LEFT JOIN tblTransaction AS T
ON U.RowNumber=T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
--The above block gives numbers who are not in tblTransaction irrespective of whether thwy are in tblEmployee or not
--But it continues till bottom of tblTransaction as RowNumber goes till end 
--To stop at the last value
--We use Max value of EmployeeNumber



WITH Numbers AS(
    SELECT TOP(SELECT MAX(EmployeeNumber) FROM tblTransaction) ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RowNumber
    FROM tblTransaction AS U
)

SELECT U.RowNumber FROM Numbers AS U
LEFT JOIN tblTransaction AS T
ON U.RowNumber=T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber


/*GENERATING A LIST OF NUMBERS*/