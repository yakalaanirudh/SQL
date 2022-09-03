/*LETS EXPAND OUR MERGE STATEMENT*/

MERGE INTO tblTransaction AS T
USING tblTransactionNew AS S
ON T.EmployeeNumber=S.EmployeeNumber AND T.DateOfTransaction=S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount=T.Amount+S.Amount
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount],[DateOfTransaction],[EmployeeNumber])
    VALUES (S.Amount,S.DateOfTransaction,S.EmployeeNumber);     --It should be ended by a ;
ROLLBACK TRAN



SELECT EmployeeNumber,DateOfTransaction,count(*) AS NumberOfRows
FROM tblTransactionNew
GROUP BY EMPLOYEENUMBER,DateOfTransaction
HAVING count(*)>1
--The above block gives whose count is greater than 1






/*LETS EXPAND OUR MERGE STATEMENT*/