/*MARK A TRANSACTION*/

--There is an internal log to where a transaction starts and finishes
--What marking a transaction does is give it(log) a name

BEGIN TRANSACTION MyTransaction WITH MARK 'My Transaction'
SELECT * FROM [dbo].[tblEmployee]     
ROLLBACK TRANSACTION 

--BEGIN TRANSACTION TransactionName WITH MARK 'MarkName'


/*MARK A TRANSACTION*/