/*CREATING A THIRD TABLE*/

/*This gives department name for all rows. there are 1009 rows with 1 field name*/
SELECT Department from tbldepartment


/*This gives department names and number of times each occurs, it has two fields*/
SELECT Department,count(*) AS NumberofDept FROM tbl employee GROUP BY Department   
/*The above has output left field name of dept, right field number of times each dept occurs*/


SELECT Department from(SELECT Department,count(*) AS NumberofDept FROM tbl employee GROUP BY Department) AS NEWTABLE
/*The above is a derived table. It has only 1 field.IT should be aliased so as newtable.
The above ahs output one field with just name of dept in it.*/


SELECT count(Department) AS Countofdept from(SELECT Department,count(*) AS NumberofDept FROM tbl employee GROUP BY Department) AS NEWTABLE
/*The above has only one field and one row with  a number indicating how many distinct number of depts are there.*/


SELECT DISTINCT Department from tblemployee/*Shows only distinct deptnames*/

/*We create a new field name called department head which has empty values in all rows for that field*/
SELECT DISTINCT Department,'' AS departmentHead into newtablename from tblemployee /*This creates a newtable named newtablename*/


/*CREATING A THIRD TABLE*/