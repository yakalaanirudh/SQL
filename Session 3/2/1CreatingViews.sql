/*CREATING VIEWS*/

--BLOCK 1
SELECT D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber between 120 and 139
ORDER BY D.Department,T.EmployeeNumber


--BLOCK 2
SELECT D.Department,T.EmployeeNumber AS EmpNum,SUM(T.Amount) AS TotalAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
GROUP BY D.Department,T.EmployeeNumber
ORDER BY D.Department,T.EmployeeNumber



/*In the first block soemone can change from WHERE T.EmployeeNumber between 120 and 139 to WHERE T.EmployeeNumber between 120 and 239
/*Views are used to restrict user to specific rows*/
/*Views are used to restrict user to specific columns*/
/*Join columns from multiple tables to look like a single table*/
/*Aggregate information instead of supplying details*/

/*A View should end with a GO*/
CREATE VIEW ViewByDepartment AS
SELECT D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber between 120 and 139
ORDER BY D.Department,T.EmployeeNumber
GO
/*The above wont work because ORDER BY is invalid in views if TOP,OFFEST OR XML is not specified*/
CREATE VIEW ViewByDepartment AS
SELECT TOP(1000) D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount --or SELECT TOP(100) PERCENT
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber between 120 and 139
ORDER BY D.Department,T.EmployeeNumber
GO

SELECT * FROM ViewbyDepartment  /*This makes the user unable to access data unavailable in view like Date of birth making it secure*/


/*Block 2 can be changed into a view by*/
CREATE VIEW ViewBySummary AS
SELECT D.Department,T.EmployeeNumber AS EmpNum,SUM(T.Amount) AS TotalAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
GROUP BY D.Department,T.EmployeeNumber
--ORDER BY D.Department,T.EmployeeNumber
SELECT * FROM ViewBySummary
/*CREATING VIEWS*/
