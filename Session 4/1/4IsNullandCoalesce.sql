/*ISNULL AND COALESCE*/

SELECT * FROM tblEmployee WHERE EmployeeMiddleName IS NULL      --Do not use EmployeeMiddleName=NULL

DECLARE @myOption AS varchar(10)='Option B'
SELECT isnull(@myOption,'No Option') AS MyOptions
GO
--The above function requires two options  --If variable is not null it returns A otherwise it returns B
--isnull takes two arguments only

DECLARE @myFirstOption AS varchar(10)='Option A'
DECLARE @mySecondOption AS varchar(10)='Option B'
SELECT coalesce(@myFirstOption,@mySecondOption,'No option') AS MyOptions
GO

--Coalesce takes as my options as we like
--It returns the first non null response

SELECT isnull('ABC',1) AS MyAnswer              --ABC       --It returns first non NULL Value
SELECT coalesce('ABC',1) AS MyOtherAnswer       --error     --As it cant convert ABC to 1 it takes highest data type
GO

SELECT isnull(null,null) AS MyAnswer            --null       
SELECT coalesce(null,null) AS MyOtherAnswer     --error     --As atleast 1 argument should be not null
GO


CREATE TABLE tblExample
(myOption nvarchar(10) NULL)
GO
INSERT INTO tblExample (myOption)
VALUES('OPTION A')

SELECT coalesce(myOption,'No option') AS MyOptions      --OPTION A  --coalesce always creates a nullable column
INTO tblIsCoalesce
FROM tblExample
GO


SELECT isnull(myOption,'No option') AS MyOptions        --OPTION A  --isnull can create  a not nullable column
INTO tblIsCoalesce
FROM tblExample
GO







/*ISNULL AND COALESCE*/