/*SCOPE AND TYPE OF LOCKS*/

--The below is not a transaction but  apart of a transaction
BEGIN TRANSACTION
SELECT * FROM [dbo].[tblEmployee]
UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
--COMMIT TRANSACTION

--Now in a new query if we write
SELECT * FROM [dbo].[tblEmployee]
--It wont show the result because the earlier transaction is not complete so this new transaction has no access to the table
--because update statement puts a lock on certain parts of table which makes it usable only for that transaction

/*
--There are many types of locks
1)Intent Shared                 (IS)
2)Shared                        (S)
3)Update                        (U)
4)Intent Exclusive              (IX)
5)Shared with Intent Exclusive  (SIX)
6)Exclusive                     (X)


SHARED LOCKS
    A SELECT Statement will have a shared lock
    Allows concurrent transactions to read(SELECT)
    No other transaction can modify the data while there is a shared lock
    Released as soon as the read operation is completed
    A shared lock need not be for the entire table
    A shared lock can be for some rows or a page instead of an entire table
    All locks can be escalted from lower level to upper level row->page->table


UPDATE LOCKS
    Used to prevent dead lock       --Two transactions try to update the same row
    Transactions reading data (shared lock) --Then only one gets shared lock after it is done updating the 2nd one will get shared lock
    To update data must convert to exclusive
    Cannot convert to exclusive if there is a shared lock   --I.e another tran tries to read data
    Solution-Use Update lock;Then convert to exclusive lock --So after the other tran reads data it will be updated to exclusive


EXCLUSIVE LOCK
    Prevents access by concurrent transactions  --No other transactions can read or update data(default),can be modified
    Used by INSERT,UPDATE,DELETE


INTENT LOCKS
    Signal Intent to place locks at a lower level
    Prevent other transactions from modifying higher level resources
    Detect lock conflicts
    We can have them shared,update and exclusive
    What they mean is --    what we are intending to do




/*SCOPE AND TYPE OF LOCKS*/