/*LETS BUILD OUR MERGE STATEMENT*/

MERGE INTO tblTransaction AS T
USING tblTransactionNew AS S
ON T.EmployeeNumber=S.EmployeeNumber AND T.DateOfTransaction=S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount=T.Amount+S.Amount
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount],[DateOfTransaction],[EmployeeNumber])
    VALUES (S.Amount,S.DateOfTransaction,S.EmployeeNumber);     --It should end with a ;
ROLLBACK TRAN

/*This will cause errors because
--We thought

--There is no row in tblTransaction and There is  a row in tblTransactionNew

--There is 1 row in tblTransaction and There is 1 row in tblTransactionNew

--But we failed to consider the below case

--There is 1 row in tblTransaction and There are multiple rows in tblTransactionNew




/*LETS BUILD OUR MERGE STATEMENT*/