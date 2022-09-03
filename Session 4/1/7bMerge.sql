/*MERGE WITH ADDITIONAL COLUMNS*/

BEGIN TRAN
ALTER tblTransaction
ADD Comments varchar(50) NULL       --This adds a new field named comments to tell us what happened

--MERGE TOP(5)PERCENT INTO tblTransaction AS T      --We can also merge part of the table
MERGE INTO tblTransaction AS T
USING 
    (SELECT EmployeeNumber,DateOfTransaction,sum(Amount) AS NumberOfRows 
    FROM tblTransactionNew
    GROUP BY EMPLOYEENUMBER,DateOfTransaction) AS S 
ON T.EmployeeNumber=S.EmployeeNumber AND T.DateOfTransaction=S.DateOfTransaction
WHEN MATCHED AND EmployeeNumber>200 THEN
    UPDATE SET Amount=T.Amount+S.Amount,Comments='Updated Row with employeeNumber 200'
WHEN MATCHED THEN
    UPDATE SET Amount=T.Amount+S.Amount,Comments='Updated Row'
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount],[DateOfTransaction],[EmployeeNumber],Comments)
    VALUES (S.Amount,S.DateOfTransaction,S.EmployeeNumber,'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
    UPDATE SET Comments="Unchanged"
OUTPUT inserted.*,deleted.*,$action;           
ROLLBACK TRAN


 --$action tells what happened update,insert or delete in a seperate column can be used in output only       




/*MERGE WITH ADDITIONAL COLUMNS*/