/*CREATING A TABLE*/

CREATE TABLE tblname   /*This creates a table with naame tblname*/
(mynumbers int)      /*In the created table the field name is mynumbers and data type is int*/
Go
/*CREATING A TABLE*/



/*ENTERING DATA INTO TABLE*/
/*Press Ctrl+Shift+R to update table for data entering*/
INSERT INTO tblname
VALUES (123)  /*This enters one values into the table*/
INSERT INTO tblname
VALUES (651),(684),(874) /*This enters multiple values into the table*/
/*ENTERING DATA INTO TABLE*/



/*RETRIEVING DATA*/
SELECT mynumbers FROM tblname    /*This selects the mynumbers column from the table tblname*/
SELECT * FROM tblname            /*This selects all columns from the table tblname*/
SELECT mynumbers AS mydigits FROM tblname   /*This renames the column*/
/*RETRIEVING DATA*/


/*DELETING DATA*/
SELECT * FROM tblname
DELETE FROM tblname  /*This deletes all data from the table but keeps the table*/
TRUNCATE TABLE tblname     /*This deletes all data from the table but keeps the table*/
DROP TABLE tblname   /*This drops table completely*/
/*DELETING DATA*/

/*
DELETE is a DML(Data Manipulation Language) command and is used when we specify the row(tuple) 
that we want to remove or delete from the table or relation.
The DELETE command can contain a WHERE clause. If the WHERE clause is used with the DELETE command then 
it removes or deletes only those rows(tuple) that satisfy the condition 
otherwise by default it removes all the tuples(rows) from the table.  Remember that DELETE logs the row deletions.
*/



/*
TRUNCATE is a DDL(Data Definition Language) command and is used to delete all the rows or tuples from a table.
Unlike the DELETE command, the TRUNCATE command does not contain a WHERE clause.
In the TRUNCATE command, the transaction log for each deleted data page is not recorded.
Unlike the DELETE command, the TRUNCATE command is fast. We cannot roll back the data after using the TRUNCATE command.
*/



*/