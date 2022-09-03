/*NON-CLUSTERED INDEXES*/

--We cant have more than 1 clustered index in a table becuase w ecant sort a table using two fields
--A clustered index sorts a table

--A  clustered index sorts and creates an  ordered index
--A non clustered index does not sort just orders

--CREATE NONCLUSTERED INDEX indexName on tblName(fieldName)
CREATE NONCLUSTERED INDEX idx_tblEmployee2 on [dbo].[tblEmployee]([DateOfBirth])

--the table will use multiple indices(if it has) if the data to go through is large


/*NON-CLUSTERED INDEXES*/