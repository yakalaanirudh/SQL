/*QUERYING TEMPORAL DATA BETWEEN A RANGE OF TIMES*/

--We can retieve data between a range of time in 3 different ways
SELECT * FROM dbo.tblEmployeeTemporal
FOR SYSTEM_TIME
--FROM StartDate TO Enddate
--BETWEEN StartDate AND Enddate
--CONTAINED IN(StartDate,Enddate)


--the difference between from and between is
--from excludes enddatetime in the range
--between includes enddatetime in the range

--Contained shows past data in that timeframe but it does not show the current date if end date is current time
--i.e Contained only shows the historical data
--between and from shows both historic and current data

/*QUERYING TEMPORAL DATA BETWEEN A RANGE OF TIMES*/