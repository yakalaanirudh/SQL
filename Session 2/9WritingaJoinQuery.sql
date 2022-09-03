/* WRITING A JOIN QUERY */

/*SUM COUNT AVG are aggregate functions so we have to use them with a group by clause*/

/*This gives two fields one with employee number and the other with that employee's sum of transaction*/
SELECT EmployeeNumber,SUM(Amount) as TotalAmount from tbltransaction group by EmployeeNumber  
SELECT * FROM tblemployee JOIN tbltransaction on tblEmployee.EmployeeNumber=tbltransaction.EmployeeNumber


SELECT tblEmployee.Employeenumber,firstname,lastname,sum(amount) AS sumofamount 
FROM tblemployee JOIN tbltransaction on tblEmployee.EmployeeNumber=tbltransaction.EmployeeNumber 
Group By tblEmployee.EmployeeNumber,tbltransaction.EmployeeNumber


SELECT * FROM tblemployee JOIN tbltransaction on tblEmployee.EmployeeNumber=tbltransaction.EmployeeNumber 
Group By tblEmployee.EmployeeNumber,tbltransaction.EmployeeNumber
/*The above statement groups the data by employee number*/


SELECT * FROM tblemployee JOIN tbltransaction on tblEmployee.EmployeeNumber=tbltransaction.EmployeeNumber 
Group By tblEmployee.EmployeeNumber,tbltransaction.EmployeeNumber ORDER BY EmployeeNumber



/* WRITING A JOIN QUERY */