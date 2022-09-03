/*WHAT ARE ISOLATION LEVELS*/

BEGIN TRAN
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
WAITFOR DELAY '00:00:10'
ROLLBACK TRAN

--Isolation levels dictates 
--what locks are taken 
--for how long and 
--what happens

--There are five different isolation levels
--Read Commited (Default)
    --Statements cannot read read data that has been modified but not commited
    --we cannot open a word doc unless changes are saved

--Read Uncommited
    --Statements cannot read read data that has been modified but not commited
    --This isnten lowest isolation level we can have

--Repeatable Read
    --Statements cannot read read data that has been modified but not commited
    --Statements cannot read read data that has been modified but not commited
    --Another transaction cannot read rows read by current Transaction untill current Transaction completes
    --It will read new rows inserted        --Serializable wont
    
--Snapshot
    --Data read by any statement in the transaction will be exactly same as data at teh start of the transaction
    --Like a photograph
    --Takes two much memory
    --Not Recommended

--Serializable
    --Statements cannot read read data that has been modified but not commited
    --No transacation can read data untill current transaction is complete
    --other transactions cannot insert new rows with keys values that would then be read by the original transaction
    --This is the highest level of isolation

/*WHAT ARE ISOLATION LEVELS*/