/*FOREIGN KEY -IN PRACTICE*/


BEGIN TRAN
ALTER TABLE tblTransaction ALTER COLUMN EmployeeNumber INT NULL
ALTER TABLE tblTransaction ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber
ALTER TABLE tblTransaction WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY(EmployeeNumber)
REFERENCES tblEmployee(EmployeeNumber)
ON UPDATE CASCADE
--ON UPDATE SET NULL
--ON UPDATE SET DEFAULT
--ON UPDATE NO ACTION


--UPDATE tblEmployee SET EmployeeNumber =9123 WHERE EmployeeNumber =123
--DELETE tblEmployee WHERE EMPLOYEENUMBER =123


SELECT E.EmployeeNumber,T.*
FROM tblEmplotee AS E
RIGHT JOIN tblTransaction as T
on E.EmployeeNumber=T.EmployeeNumber
where T.amount IN(-179.49,786.22,-967.32,957.03)
ROLLBACK TRAN


/*FOREIGN KEY -IN PRACTICE*/