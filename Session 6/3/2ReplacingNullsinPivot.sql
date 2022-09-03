/*REPLACING NULLS IN PIVOT*/

WITH MyTable AS
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth,Amount from tblTransaction)

SELECT * FROM MyTable
PIVOT(SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS PivotTable
ORDER BY TheYear
--[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12] come from  MONTH(DateOfTransaction) in MyTable


--To replace NULLS
WITH MyTable AS
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth,Amount from tblTransaction)

SELECT TheYear,ISNULL([1],0 AS [1]),
ISNULL([2],0 AS [2]),
ISNULL([3],0 AS [3]),
ISNULL([4],0 AS [4]),
ISNULL([5],0 AS [5]),
ISNULL([6],0 AS [6]),
ISNULL([7],0 AS [7]),
ISNULL([8],0 AS [8]),
ISNULL([9],0 AS [9]),
ISNULL([10],0 AS [10]),
ISNULL([11],0 AS [11]),
ISNULL([12],0 AS [12])
FROM MyTable
PIVOT(SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS PivotTable
ORDER BY TheYear

--In the select statement in pivot table do not add unnecessary fields


/*
ISNUll gives for non null value
ISNULL([1],0) gives no column name,so
ISNULL([1],0 AS [1])        --We rename it
*/



/*REPLACING NULLS IN PIVOT*/