/*PIVOT*/

WITH MyTable AS
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth,Amount from tblTransaction)

SELECT * FROM MyTable
PIVOT(SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS PivotTable
ORDER BY TheYear

/*
SELECT * FROM MyTable
What * includes is all the columns in the PivotTable
In our PivotTable we have a Year column with year going down
1,2,3...12 columns taht go across
So w ehave to write
SELECT TheYear,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12] FROM MyTable

*/


/*
SELECT * FROM TableName
PIVOT(AGGREGATEFUNCTION(FIELD NAME --Rows going across) FOR FieldName IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS PivotTableName
ORDER BY ColumnName  --This ColumnName is the rows going down

--In the above we use [] only for numbers if words we can write IN (Jan,Feb,Mar)
*/


/*PIVOT*/