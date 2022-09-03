/*USING SEQUENCES*/

ALTER TABLE tblTransaction
ADD NextNumber INT CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq
--ADD CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq FOR NextNumber --At time of creation
BEGIN TRAN
SELECT * FROM tblTransaction
INSERT INTO tblTransaction(Amount,DateOfTransaction,EmplyeeNumber)
VALUES(1,'2020-01-01',123)
ROLLBACK TRAN       --Now if we run the batch till this point everytime we run it the value in NextNumber increments by 1
--Because we did not ruollback the sequence
SELECT * FROM tblTransaction WHERE EmployeeNumber=123;
UPDATE tblTransaction
SET NextNumber=NEXT VALUE FOR newSeq
WHERE NextNumber IS NULL
SELECT * FROM tblTransaction WHERE EmployeeNumber=123
--Now when we update the nulls to next value it will continue from next value in the sequence
--If in previous line 1 this continues from 2,3...
ROLLBACK TRAN


--To ALTER Sequence
RESTART
RESTART WITH -1000 --Decremnets the current number by -1000

--First drop default,then column then sequence


/*USING SEQUENCES*/