/*INTRODUCTION*/

--Transaction   A transaction is a group of one or more than one data base statements
--The computer either executes all transactions if even one fails everything is failed(rolled back)


--Suppose we are in a transaction to write 100,000 rows and 20,000 are written and the power fails
--When the power comes back up SQL doesnt start from 20,001 but rollbacks the entire transaction and restarts from 1

/*
--Properties of a Transaction(ACID)
1)Atomic
2)Consistent
3)Isolated
4)Durable

Atomicity
    A transaction is atomic(a single unit of work)
    100,000 rows are all written or all are rolled back

Consistency
    The transaction must leave data in a consistent state
    It must obey the rules of the SQL database 

Isolation
    Modifications made by more than one transaction at the same time must be isolated
    It is done by locking rows
    i.e Transaction 1 has access to row a so transaction 2 has no access to that row until transaction 1 is finished
    i.e we wont see results of a row in the middle of a transaction in another transaction untill the first transaction is finsished
    It is called serializability

Durablity
    All the rows that are added from transaction should be visible once that transaction is completed


/*INTRODUCTION*/