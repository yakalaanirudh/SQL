/*THE PROBLEMS ABOUT IDENTITY*/

--To make a row unique we use IDENTITTY(1,1)
--It can be used for a new column but cant be used for a existing column

BEGIN TRAN
INSERT INTO tblEmployee2
VALUES('New Name')
SELECT * FROM tblEmployee2
ROLLBACK TRAN

--In tha above block when we enter new values and use rollback the number goes on increasing for next transaction 
--leading to gaps in the identity
--It will not restart even if we 
--DELETE FROM tblEmployee2
--For the identity to restart we should use
--TRUNCATE TABLE tblEmployee2


--The alternatives for identity are GUIDS and SEQUENCES

/*THE PROBLEMS ABOUT IDENTITY*/