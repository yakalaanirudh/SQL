/*ADDING NEW ROWS TO VIEWS*/

/*This view is from employee numbers 120 and 139*/
BEGIN TRAN 
INSERT INTO viewByDepartment (EmployerNumber,DateofTransaction,TotalAmount)
VALUES(132,'2015-07-07',999.99)
SELECT * FROM viewBydepartment ORDER BY Department,EmployeeNumber
ROLLBACK TRAN 
/*This adds the data into the view and also into the underlying table the view is based on*/
/*We cant add rows to the view if it alters multiple tables at once*/
/*This view is from employee numbers 120 and 139*/


/*These statements reduce view length because the view is only from 120 to 139 and the new number is 142*/
BEGIN TRAN 
SELECT * FROM viewbydepartment ORDER BY EmployerNumber,DateofTransaction
UPDATE viewByDepartment SET EmployeeNumber=142 WHERE EmployerNumber=132
/*These statements reduce view length because the view is only from 120 to 139 and the new number is 142*/


/*The below two statements fail beacuse we cant update multiple tables at once from  a view*/
INSERT intoviewByDepartment (DepartmentName,EmployerNumber,DateofTransaction,TotalAmount)
VALUES('Customer Realtions',132,'2015-07-07',999.99) 

/*With Check Option*/

/*It forces all data modification statements executed against the view to follow the criteria set within the selling statement.
When a row is modified through a view with check option, we must make sure that the data remains visible through the view 
after mode modification is committed. (i.e., what it means is it will allow us to alter the view 
only if the data that is entered or will be visible in the view after it is entered)*/

/*In this example changes 132 to 142 removes that row from view so WITH CHECK OPTION wont allow that transaction to go through
as the data after modifictaion is not visible*/

/*Similarly (this view is from 120 to 139) WITH CHECK OPTION wont allow addition of 142 from the view as it is outside 120 and 139*/

ALTER VIEW ViewbyDepartment AS  /*To alter view*/
SELECT D.Department,T.EmployeeNumber,T.DateofTransaction,T.Amount AS TotalAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
on D.Department=E.Department
LEFT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
WHERE T.EmployeeNumber between 120 and 139
WITH CHECK OPTION
/*ORDER BY D.Department,E.EmployeeNumber*/
GO


/*ADDING NEW ROWS TO VIEWS*/