/*SYNONYMS*/

--System Meta Data is anything that starts sys.  like sys.tables,sys.queries,sys.views,

--Synonyms are another name

--When we rename a table, on every query based on table the name should be changed or it will fail
--We dont have that problem with SYNONYMS

CREATE SYNONYM EmployeeTable FOR tblEmployee    

SELECT * FROM EmployeeTable

--Synonyms can be used to create a synonym for a table in another database

CREATE SYNONYM RemoteTable FOR server_name.database_name.schema_name.object_name
CREATE SYNONYM RemoteTable FOR OVERTHERE.70-461remote.dbo.tblRemote



/*SYNONYMS*/