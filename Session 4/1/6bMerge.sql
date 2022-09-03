/*LETS EXPAND OUR MERGE STATEMENT*/

MERGE INTO tblTransaction AS T
USING 
    (SELECT EmployeeNumber,DateOfTransaction,sum(Amount) AS NumberOfRows 
    FROM tblTransactionNew
    GROUP BY EMPLOYEENUMBER,DateOfTransaction) AS S 
ON T.EmployeeNumber=S.EmployeeNumber AND T.DateOfTransaction=S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount=T.Amount+S.Amount
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount],[DateOfTransaction],[EmployeeNumber])
    VALUES (S.Amount,S.DateOfTransaction,S.EmployeeNumber)
    OUTPUT inserted.*,deleted.*;            --Shows the rows which are modified    
ROLLBACK TRAN


--DISABLE TRIGGER [nameofTrigger] on [tablename]
/*
SELECT EmployeeNumber,DateOfTransaction,count(*) AS NumberOfRows        --change count(*) to sum(Amount)
FROM tblTransactionNew
GROUP BY EMPLOYEENUMBER,DateOfTransaction
HAVING count(*)>1
*/
/*LETS EXPAND OUR MERGE STATEMENT*/