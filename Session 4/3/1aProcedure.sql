/*PROCEDURE EXERCISE*/

SELECT * FROM tblTransaction
WHERE EmployeeNumber BETWEEN 3 AND 11
ORDER BY EmployeeNumber
--The above gives 23 rows with columns Amount,DateOfTransaction and EmployeeNumber


SELECT SUM(Amount) FROM tblTransaction
WHERE EmployeeNumber BETWEEN 3 AND 11
--The above gives the total amount for transactions made by those EmployeeNumbers       --(3606.18)         --A


SELECT COUNT(EmployeeNumber) FROM tblTransaction    
WHERE EmployeeNumber BETWEEN 3 AND 11
--The above gives number of transactions (23)

SELECT DISTINCT COUNT(EmployeeNumber) FROM tblTransaction    
WHERE EmployeeNumber BETWEEN 3 AND 11
--The above gives number of transactions (23)

SELECT COUNT(DISTINCT EmployeeNumber) FROM tblTransaction    
WHERE EmployeeNumber BETWEEN 3 AND 11
--The above gives number of Employees(6)                                                                      --B

--A/B gives Average TransactionAmount per Employee



/*PROCEDURE EXERCISE*/
