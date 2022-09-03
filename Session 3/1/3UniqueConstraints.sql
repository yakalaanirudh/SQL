/*UNIQUE CONSTRAINTS IN ACTION*/

/*unqGovermnetID is name of the constraint*/ /*(EmployeeGovernmnetID)-Name of field*/
/*The table has non Uinique Govt Id so the below transaction fails*/
ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmnetID UNIQUE (EmployeeGovernmnetID)   


SELECT EmployeeGovernmentID,count(EmployeeGovernmentID) as MyCount from tblEmployee
GROUP BY EmployeeGovernmentID
HAVING COUNT(EmployeeGovernmentID)>1


SELECT * FROM tblEmployee WHERE EmployeeGovernmentID IN('HN516264','TX65161')


BEGIN TRAN
DELETE FROM tblEmployee
WHERE EmployeeNumber<3
DELETE TOP(2) FROM tblEmployee   /*There are two entries with employeenumber 131 and 132.In these two lines*/
WHERE EmployeeNumber IN(131,132)  /* we delete the top 2 entries 1 with each entry*/
ROLLBACK TRAN 
COMMIT TRAN


ALTER TABLE tblTransaction
ADD CONSTRAINT unqtransaction UNIQUE (Amount,DateofTransaction,EmployeeNumber)   /*Unique of all three fields combination*/
/*The above is alteration*/


/*The below is at time of creation*/
CREATE TABLE tblTransaction
(Amount smallmoney NOT NULL,DateofTransaction smalldateTIME NOT NULL,EmployeeNumber INT NOT NULL)
CONSTRAINT UnqTransaction UNIQUE(Amount,DateofTransaction,EmployeeNumber)  /*This is creation of constraint at creation of table*/


/*UNIQUE CONSTRAINTS IN ACTION*/