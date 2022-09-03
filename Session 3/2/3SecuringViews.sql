/*SECURING VIEWS*/


SELECT V.Name,S.text from sys.syscomments as S
inner join sys.views as S
ON S.id=V.object_id
/**/

/*The below is the preferred method*/
CREATE VIEW ViewSummary WITH ENCRYPTION AS /*With encryption creates security*/
SELECT D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
GROUP BY D.Department,E.EmployeeNumber
/*ORDER BY D.Department,E.EmployeeNumber*/
GO


/*SECURING VIEWS*/
