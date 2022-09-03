/*CRITERIA ON SUMMARIZED DATA*/

/*This gives one coulmn with field name Initial*/
/*It asks for the first letter of first name from left*/
SELECT left(FirstName,1) AS Initial from tblemployee

/*Unexecuted because no groupby*/
SELECT left(FirstName,1) AS Initial,count(*) AS CountofInitial from tblemployee

/*This gives two fields thesecond field name is coun tof intial*/
SELECT left(FirstName,1) AS Initial,count(*) AS CountofInitial from tblemployee Group BY left(FirstName,1) ORDER BY COUNT(*) DESC


SELECT TOP(5) left(FirstName,1) AS Initial,count(*) AS CountofInitial from tblemployee Group BY left(FirstName,1) ORDER BY COUNT(*) DESC


SELECT left(FirstName,1) AS Initial,count(*) AS CountofInitial from tblemployee Group BY left(FirstName,1) HAVING COUNT(*)>50 ORDER BY COUNT(*) DESC



/*CRITERIA ON SUMMARIZED DATA*/