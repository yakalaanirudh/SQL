/*MERGE WITH ADDITIONAL COLUMNS*/

BEGIN TRAN
ALTER tblTransaction
ADD Comments varchar(50) NULL       --This adds a new field named comments to tell us what happened


MERGE INTO tblTransaction AS T
USING 
    (SELECT EmployeeNumber,DateOfTransaction,sum(Amount) AS NumberOfRows 
    FROM tblTransactionNew
    GROUP BY EMPLOYEENUMBER,DateOfTransaction) AS S 
ON T.EmployeeNumber=S.EmployeeNumber AND T.DateOfTransaction=S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount=T.Amount+S.Amount,Comments='Updated Row'
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount],[DateOfTransaction],[EmployeeNumber],Comments)
    VALUES (S.Amount,S.DateOfTransaction,S.EmployeeNumber,'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
    UPDATE SET Comments="Unchanged";
    --OUTPUT inserted.*,deleted.*;                
ROLLBACK TRAN







/*MERGE WITH ADDITIONAL COLUMNS*/