/*DEFAULT CONSTRAINTS-IN ACTION*/

ALTER TABLE tblTransaction
ADD DateofEntry DATETIME  /*We are adding  a new field to the table named DateofEntry.Here we cant add COLUMN before DateofEntry*/


ALTER TABLE tbltransaction
ADD CONSTRAINT DateofEntry DEFAULT GETDATE() FOR DateofEntry  /*The default constraint is added to DateofEntry Field*/


DELETE FROM tblTransaction WHERE EmployeeNumber<3


INSERT INTO tblTransaction(Amount,DateofTransaction,EmployeeNumber)
VALUES(1,'2014-01-01',1)


INSERT INTO tblTransaction(Amount,DateofTransaction,EmployeeNumber,DateofEntry)
VALUES(2,'2014-01-02',1,'2013-01-01')
/*The above is alteration*/


/*The below is at time of creation*/
/*This is creation of constarint at creation of table*/
CREATE TABLE tblTransaction2
(Amount smallmoney NOT NULL,DateofTransaction smalldateTIME NOT NULL,EmployeeNumber INT NOT NULL,
DateofEntry DATETIME NULL CONSTRAINT defaultDateofEntry DEFAULT GETDATE())         


/*DEFAULT CONSTRAINTS-IN ACTION*/