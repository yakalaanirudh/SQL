/*CREATING TEMPORAL TABLES*/

CREATE TABLE [dbo].[tblTemporal]
(
    [EmployeeNumber] INT NOT NULL,
    [EmployeeFirstName] VARCHAR(50) NOT NULL,
    [EmployeeMiddleName] VARCHAR(50) NOT NULL,
    [EmployeeLastName] VARCHAR(50) NOT NULL,
    [EmployeeGovtID] CHAR(10) NOT NULL,
    [DateOfBirth] DATE NOT NULL,
    [Department] VARCHAR(19) NULL
)


INSERT INTO [dbo].[tblTemporal]
(
    [EmployeeNumber],[EmployeeFirstName],[EmployeeMiddleName],[EmployeeLastName],[EmployeeGovtID],[DateOfBirth],[Department]
)
VALUES(123,'Jane',NULL,'Zwilling','asdfgh123','1985-01-01','Customer Relations'),
(124,'Janeine',NULL,'ling','asdfgh153','1985-05-01','Customer Relations'),
(125,'Jo',NULL,'ling','asdfgh152','1985-05-21','Customer Relations')

SELECT * FROM dbo.tblTemporal

UPDATE [dbo].[tblTemporal] SET EmployeeLastName='Smith' WHERE EmployeeNumber=124


--Now we alter that the table to create two columns valid from and valid to
CREATE TABLE [dbo].[tblTemporal]
(
    [EmployeeNumber] INT NOT NULL PRIMARY KEY CLUSTERED,
    [EmployeeFirstName] VARCHAR(50) NOT NULL,
    [EmployeeMiddleName] VARCHAR(50) NOT NULL,
    [EmployeeLastName] VARCHAR(50) NOT NULL,
    [EmployeeGovtID] CHAR(10) NOT NULL,
    [DateOfBirth] DATE NOT NULL,
    [Department] VARCHAR(19) NULL,
    ValidFrom DATETIME2(2) GENERATED ALWAYS AS ROW START,
    ValidTo DATETIME2(2) GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME(ValidFrom,ValidTo)           --This line is just syntax
)WITH (SYSTEM_VERSIONING=ON)
---(SYSTEM VERSIONING=ON) tells system that it has to keep the table updated
--It needs a primary key


--This creates a table in which valid from has value the time of entry and valid to is the last possible date 9999-12-31 23:59:59



/*CREATING TEMPORAL TABLES*/