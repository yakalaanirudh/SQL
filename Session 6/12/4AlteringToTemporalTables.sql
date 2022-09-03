/*ALTERING EXISTING TABLES TO MAKE THEM TEMPORAL TABLES*/

ALTER TABLE tblEmployee
ADD(
    ValidFrom DATETIME2(2) GENERATED ALWAYS AS ROW START,
    ValidTo DATETIME2(2) GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME(ValidFrom,ValidTo) )      --This line is just syntax
--)WITH (SYSTEM_VERSIONING=ON (HISTORY_TABLE=dbo.tblEmployeeHistory)) 
/*
We cant alter table because alter allows to add columns that are nullable or have a default definition specified or 
the column being added is an identity or timestamp column
*/

ALTER TABLE tblEmployee
ADD(
    ValidFrom DATETIME2(2) GENERATED ALWAYS AS ROW START CONSTRAINT def_ValidFrom DEFAULT SYSUTCDATETIME(),
    ValidTo DATETIME2(2) GENERATED ALWAYS AS ROW END CONSTRAINT def_ValidtO DEFAULT CONVERT(DATETIME2(2),'9999-12-31 23:59:59'),
    PERIOD FOR SYSTEM_TIME(ValidFrom,ValidTo)
)SET (SYSTEM_VERSIONING=ON (HISTORY_TABLE=dbo.tblEmployeeHistory)) 

/*ALTERING EXISTING TABLES TO MAKE THEM TEMPORAL TABLES*/