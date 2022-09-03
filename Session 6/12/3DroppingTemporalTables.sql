/*DROPPING TEMPORAL TABLES AND SPECIFYING THE HISTORY TABLE*/

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
    PERIOD FOR SYSTEM_TIME(ValidFrom,ValidTo)       --This line is just syntax
)WITH (SYSTEM_VERSIONING=ON)

DROP TABLE [dbo].[tblTemporal]      --Fails because drop doesnot work on temporal tables

--To drop a temporal table
ALTER TABLE [dbo].[tblTemporal] SET (SYSTEM_VERSIONING=OFF)
DROP TABLE [dbo].[tblTemporal]
DROP TABLE [dbo].[MSSQL_TemporalHistoryFor_1013578649]      --This is a hidden table created by the system
--We will get the above commands from
--Right Click on table in GUI
--Script Table AS
--DROP to
--New Query Editor Window



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
    PERIOD FOR SYSTEM_TIME(ValidFrom,ValidTo)       --This line is just syntax
)WITH (SYSTEM_VERSIONING=ON (HISTORY_TABLE=dbo.tblEmployeeHistory))    
--This names the hidden table that is created by system to tblEmployeeHistory

/*DROPPING TEMPORAL TABLES AND SPECIFYING THE HISTORY TABLE*/