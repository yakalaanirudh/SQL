/*WHAT IS AN INDEX*/
/*Indexes are like the indexes at the end of the book sorted by topic*/


/*Suppose in a excel sheet  Row number   Employee Number are two columns
Row number   Employee Number
1   121
2   122
3   123

If we have an index then we can seek that is 121 is at row 1
But if we do not have have an index we jave to go through all rows which is scan
So indexes help us to query faster
*/


/*Cluster means sort*/
/*The first index created on a view must be clustered index, the others can be non clustered*/
/*We cannot have  aview clustered by two different criteria at the same time*/


/*In indexed view we cannot
use outer joins(left,right,full)
cannot use DISTINCT
cannot use COUNT (which returns int) but can use COUNT_BIG (which returns bigint)
cannot use TOP
we have do a full reference of table like dbo.tableEmployee not tableEmployee*/


/*WHAT IS AN INDEX*/