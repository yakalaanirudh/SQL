/*TRANCOUNT*/

--1
SELECT * FROM [dbo].[tblEmployee]

BEGIN TRAN
    BEGIN TRAN
        UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
    COMMIT TRAN
COMMIT TRAN

SELECT * FROM [dbo].[tblEmployee]       --It returns a table from 1st(123) and 2nd select(122)
--1


--2
SELECT * FROM [dbo].[tblEmployee]

BEGIN TRAN
    BEGIN TRAN
        UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
    COMMIT TRAN
ROLLBACK TRAN

SELECT * FROM [dbo].[tblEmployee]       --It returns a table from 1st(123) and 2nd select(123)
--2


--3
SELECT * FROM [dbo].[tblEmployee]

BEGIN TRAN
    BEGIN TRAN
        UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
    ROLLBACK TRAN
COMMIT TRAN     --the program wont reach this line because of rollback in previous line

SELECT * FROM [dbo].[tblEmployee]
--The above Transaction results in an error       
--3


--4
SELECT * FROM [dbo].[tblEmployee]
SELECT @@TRANCOUNT          --0 LEVEL
BEGIN TRAN
    SELECT @@TRANCOUNT      --1 LEVEL
    BEGIN TRAN
        UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
        SELECT @@TRANCOUNT  --2 LEVEL
    COMMIT TRAN
    SELECT @@TRANCOUNT      --1 LEVEL
COMMIT TRAN
SELECT @@TRANCOUNT          --0 LEVEL

SELECT * FROM [dbo].[tblEmployee]
--4


--Rollback tran immediately sets level to 0
--5
SELECT * FROM [dbo].[tblEmployee]
SELECT @@TRANCOUNT          --0 LEVEL
BEGIN TRAN
    SELECT @@TRANCOUNT      --1 LEVEL
    BEGIN TRAN
        UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
        SELECT @@TRANCOUNT  --2 LEVEL
    ROLLBACK TRAN
    SELECT @@TRANCOUNT      --0 LEVEL
COMMIT TRAN
SELECT @@TRANCOUNT          
--This gives an error
SELECT * FROM [dbo].[tblEmployee]
--5


--6
SELECT * FROM [dbo].[tblEmployee]
SELECT @@TRANCOUNT          --0 LEVEL
BEGIN TRAN
    SELECT @@TRANCOUNT      --1 LEVEL
    BEGIN TRAN
        UPDATE [dbo].[tblEmployee] SET EmployeeNumber=122 WHERE EmployeeNumber=123
        SELECT @@TRANCOUNT  --2 LEVEL
    ROLLBACK TRAN
    SELECT @@TRANCOUNT      --0 LEVEL
IF @@TRANCOUNT>0            --If @@TRANCOUNT >0 It will run COMMIT TRAN in next line and doesnt show error
COMMIT TRAN
SELECT @@TRANCOUNT          

SELECT * FROM [dbo].[tblEmployee]
--6

--TRANCOUNT SAYS WHERE WE ARE IN A TRANSACTION
--BEGIN TRAN INCREASES BY 1
--COMMIT TRAN REDUCES BY 1
--ROLLBACK SETS TRANCOUNT TO 0

/*TRANCOUNT*/