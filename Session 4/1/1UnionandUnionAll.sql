/*UNION AND UNION ALL*/

/*
Lets say there are two tables Table 1 and Table 2 to make a union of table 1  and table 2 we need to
    1)Have same number of coulmns in the two tables
    2)The two tables should have the same or compatible data types
    if one table's as varchar(5) and other tables's column has varchar(10) then the union will have varchar(10) to retain all data
*/

SELECT * FROM INSERTED
UNION
SELECT * FROM DELETED

SELECT CONVERT(char(5),'hi')
UNION
SELECT CONVERT(char(11),'hello there')
/*The above block produces a column with no name with hi in first row and hello there in second row*/

SELECT CONVERT(char(5),'hi') AS Greeting
UNION
SELECT CONVERT(char(11),'hello there')
/*The above block produces a column with Greeting as Name with hi in first row and hello there in second row*/


SELECT CONVERT(char(5),'hi')
UNION
SELECT CONVERT(char(11),'hello there') AS Greeting
/*The above block produces a column with no name with hi in first row and hello there in second row*/--NAME ON FIRST TABLE ONLY

SELECT CONVERT(char(5),'hi') AS Greeting
UNION
SELECT CONVERT(char(11),'hello there')
UNION
SELECT CONVERT(CHAR(11),'bonjour')
/*We cant predict the order in which the abov evalues appear in the rows*/


SELECT CONVERT(char(5),'hi') AS Greeting
UNION
SELECT CONVERT(char(11),'hello there')
UNION
SELECT CONVERT(CHAR(11),'bonjour')
UNION 
SELECT CONVERT(char(5),'hi')
/*We will have only one hi in the resulting union because union wont consider duplication values*/


SELECT CONVERT(char(5),'hi') AS Greeting
UNION
SELECT CONVERT(char(11),'hello there')
UNION
SELECT CONVERT(CHAR(11),'bonjour')
UNION  ALL
SELECT CONVERT(char(5),'hi')
/*UNION ALL CONSIDERS DUPLICATION VALUES TOO SO THERE WILL BE TWO hi's In this case*/

SELECT CONVERT(tinyint,45) AS mycolumn
UNION
SELECT CONVERT(bigint,456)
/*The resulting UNION will have data type bigint because it is the bigger data type*/

SELECT 'hi there'
UNION
SELECT 4
/*Error as they are uncompatabile data types*/



/*UNION AND UNION ALL*/