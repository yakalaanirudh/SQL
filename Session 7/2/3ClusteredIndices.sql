/*CLUSTERED INDEXES*/

SELECT * FROM [dbo].[tblEmployee]                           --It will be a scan

SELECT * FROM [dbo].[tblEmployee] WHERE EmployeeNumber=127  --It will be a scan

--If we create a index then sql will just go to those rows
--It is a clustered index, clustered means sorted

--CREATE CLUSTERED INDEX indexName on tblName(fieldName)
CREATE CLUSTERED INDEX idx_tblEmployee on [dbo].[tblEmployee]([EmployeeNumber])

SELECT * FROM [dbo].[tblEmployee]                      --Even now it be a scan(Clustered Index Scan)because there is no WHERE clause
--Because it is easier to scan through one field

SELECT * FROM [dbo].[tblEmployee] WHERE EmployeeNumber=127  --Now it will be a clustered index seek


--To drop an index
--DROP  INDEX indexName on tblName
DROP INDEX idx_tblEmployee on [dbo].[tblEmployee]



--We can also create a clustered index byy creating aprimary key
--Because a primary key by default creates an index
--For a primary key the field should be unique

ALTER TABLE [dbo].[tblEmployee]
ADD CONSTRAINT pk_tblEmployee PRIMARY KEY(EmployeeNumber)

--We can change a heap to a B-Tree by creating  a clustered index or a primary key
--So it uses a clustered seek or clustered scan
/*CLUSTERED INDEXES*/