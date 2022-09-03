/*WHAT WOULD HAPPEN IF LOCKS DID NOT EXIST*/

/*
--Lost Updates
    If two transactions updates same row then data could be lost

--Uncommitted Dependency(Dirty Read)
    When a transaction in process and another transaction reads the same table so is the 1st transaction data commited or not
    Which version of doc did 2nd transaction read (before edit by 1st  or after)

--Inconsistent Analysis(nonrepeatable read)
    A transaction is updating then 2nd transaction updates now if 3rd transaction reads will it read original or after 1st or after 2nd

--Phantom Reads
    When rows 2nd transaction sees read are different(similar to previous case but number of rows change)

--Missing and double reads caused by row updates
    If row changes from one page to another

--Missing one or more rows that were not the target of the update
    If we are reading from where clause and number of rows change because of updation




/*WHAT WOULD HAPPEN IF LOCKS DID NOT EXIST*/