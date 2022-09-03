/*IMPORTING AND EXPORTING USING THE BCP UTILITY*/

--There are 3 main ways to import and export XML
--1)BCP UTILITY     BULK COPY PROGRAM


--We write the below command in command prompt
bcp [databaseName].dbo.tblName out fileName.out -N-T
--out is for exporting
--(-N) means we have UNICODE characters
-- (-T) means we have my windows authentication (trusted connection)    
--We write the above command in command prompt

CREATE TABLE dbo.tblDepartment2 ([Department] VARCHAR(19) NULL,[DepartmentHead] VARCHAR(19) NULL)



--We write the below command in command prompt
bcp [databaseName].dbo.tblName2 in fileName.out -N-T
-- in is for importing
--We write the above command in command prompt


/*IMPORTING AND EXPORTING USING THE BCP UTILITY*/