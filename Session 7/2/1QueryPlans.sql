/*REINTRODUCING QUERY PLANS*/

SELECT * FROM [dbo].[tblEmployee]
--Now if we select DISPLAY ESTIMATED EXECUTION PLAN
--We can see SELECT COST to be 0%
--And SCAN COST to be 100%

--SCAN and SEEK are two ways of getting data from a table


/*REINTRODUCING QUERY PLANS*/