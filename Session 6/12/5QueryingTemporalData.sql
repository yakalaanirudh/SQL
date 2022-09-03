/*QUERYING TEMPORAL DATA AT A POINT OF TIME*/

SELECT * FROM dbo.tblTemporal       --Normal query


SELECT * FROM dbo.tblTemporal       --Temporal Query
FOR SYSTEM_TIME AS OF '2021-01-01'



/*QUERYING TEMPORAL DATA AT A POINT OF TIME*/