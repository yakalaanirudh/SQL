/*GUID*/

--GUID  -Globally Unique Identifier     It is a 128 bit integer to identify 
--It is not same as unique Constraint
--Its data type is uniqueIdentifier



--To use GUID we use
DECLARE @newvalue AS UNIQUEIDENTIFIER       --GUID
SET @newvalue=NEWID()
SELECT @newvalue AS TheNewID
GO

BEGIN TRAN
CREATE TABLE tblEmployee2
(UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee2_UniqueID DEFAULT NEWID(),
EmplyeeNumber INT CONSTRAINT uq_tblEmployee2_EmployeeNumber UNIQUE)
--The problem with UniqueId is the ids are nor generated in a sequence

--So A newer version of UniqueId is sequentialId is used to overcome this problem

DECLARE @newvalue AS UNIQUEIDENTIFIER       --GUID
SET @newvalue=NEWSEQUENTIALID()
SELECT @newvalue AS TheNewID
GO

BEGIN TRAN
CREATE TABLE tblEmployee2
(UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee2_UniqueID DEFAULT NEWSEQUENTIALID(),
EmplyeeNumber INT CONSTRAINT uq_tblEmployee2_EmployeeNumber UNIQUE)


--The reason we dont use ids or sequential ids is because they take so much space


/*GUID*/