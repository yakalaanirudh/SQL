/*NULL*/


declare @myvar as int                       --NULL till a value is assigned SQL assigns it a value NULL

select 1+1+1+1+1+@myvar+1+1 as myCol

declare @mystring as nvarchar(20)           --NULL till a value is assigned SQL assigns it a value NULL
select datalength(@mystring) as mystring    --NULL till a value is assigned SQL assigns it a value NULL
declare @mydecimal decimal(5,2)             --NULL till a value is assigned SQL assigns it a value NULL
select try_convert(decimal(5,2),1000)
select try_cast(1000 as decimal(5,2))

--Use try before convert to get NULL instead of nothing


/*it is useful ina  transaction where there are many rows lets say 10000
so even if on etransaction fails no data will be displayed on any row
so buy using try we will get NULL value in that one row and the data for whole transaction will be displayed
*/


/*NULL*/