/*GROUPING NUMBERS*/

WITH Numbers AS(
    SELECT TOP(SELECT MAX(EmployeeNumber) FROM tblTransaction) ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RowNumber
    FROM tblTransaction AS U
)

SELECT U.RowNumber FROM Numbers AS U
LEFT JOIN tblTransaction AS T
ON U.RowNumber=T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber




/*Copied from Word doc*/
with Numbers as (
select top(select max(EmployeeNumber) from tblTransaction) row_Number() over(order by (select null)) as RowNumber
from tblTransaction as U),
Transactions2014 as (
select * from tblTransaction where DateOfTransaction>='2014-01-01' and DateOfTransaction < '2015-01-01'),
tblGap as (
select U.RowNumber, 
       RowNumber - LAG(RowNumber) over(order by RowNumber) as PreviousRowNumber, 
	   LEAD(RowNumber) over(order by RowNumber) - RowNumber as NextRowNumber,
	   case when RowNumber - LAG(RowNumber) over(order by RowNumber) = 1 then 0 else 1 end as GroupGap
from Numbers as U
left join Transactions2014 as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null),
tblGroup as (
select *, sum(GroupGap) over (ORDER BY RowNumber) as TheGroup
from tblGap)
select Min(RowNumber) as StartingEmployeeNumber, Max(RowNumber) as EndingEmployeeNumber,
       Max(RowNumber) - Min(RowNumber) + 1 as NumberEmployees
from tblGroup
group by TheGroup
order by TheGroup
/*Copied from Word doc*/




/*GROUPING NUMBERS*/