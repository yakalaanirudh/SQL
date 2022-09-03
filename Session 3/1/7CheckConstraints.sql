/*CHECK CONSTRAINTS -IN PRACTICE*/


ALTER TABLE tblTransaction
ADD CONSTRAINT checkamount CHECK (AMOUNT>-1000  AND AMOUNT<1000)

INSERT INTO tblTransaction
VALUES (1010,'2014-01-01',1010)   /*This fails because value is >1000*/

ALTER TABLE tblEmployee WITH NOCHECK
ADD CONSTRAINT chkMiddleName check  /*Check constarint named check*/
(REPLACE(EmployeeMiddleName,'.','')=EmployeeMiddleName OR EmployeeMiddleName is NULL)  
/*The above statement says if there is a . in middle name replace it with ''
A.=>A
OR EmployeeMiddleName is NULL
the above statement says alllow it even if the employee middle name is null*/

ALTER TABLE tblEmployee
DROP CONSTRAINT chkMiddleName

BEGIN TRAN
    INSERT INTO tblEmployee
    VALUES (2003,'A','B..','C','D','2014-01-01','Accounts')
    SELECT * FROM tblEmployee WHERE EmployeeNumber =2003
ROLLBACK TRAN


ALTER TABLE tblEmployee WITH NOCHECK
ADD CONSTRAINT chkMiddleName check(DateofBirth between '1900-01-01' and getdate())    /*DOB should be between 1900-01-01 and todays date*/

/*To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax*/
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

/*CHECK CONSTRAINTS -IN PRACTICE*/

/*REPLACE FUNCTION*/


/*The REPLACE() function replaces all occurrences of a substring within a string, with a new substring.*/
/*string	Required. The original string  --IT CAN ALSO BE  A FIELD NAME
old_string	Required. The string to be replaced
new_string	Required. The new replacement string*/

SELECT REPLACE('SQL Tutorial', 'T', 'M');
SELECT REPLACE('SQL Tutorial', 'SQL', 'HTML');
SELECT REPLACE('ABC ABC ABC', 'a', 'c');


/*REPLACE FUNCTION*/
