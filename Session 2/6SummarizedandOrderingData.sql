/* SUMMARIZING AND ORDERING DATA*/


SELECT * FROM tblemployee where DateOfBirth between '19750101' and '19851231'
SELECT * FROM tblemployee where DateOfBirth >= '19750101' <= '19851231'
SELECT * FROM tblemployee where DateOfBirth between '1976' and '1986'


/*This gives every single COLUMN with 693 rows*/
SELECT year(DateofBirth) FROM tblemployee

/*This and above statement gives 693 rows,Only one column there will be repitions*/
SELECT year(DateofBirth) AS YearOfDateOfBirth FROM tblemployee

/*This doesnt execute because there is no group by*/
SELECT year(DateofBirth) AS YearOfDateOfBirth COUNT(*) AS NumberBorn FROM tblemployee


SELECT year(DateofBirth) AS YearOfDateOfBirth COUNT(*) AS NumberBorn FROM tblemployee GroupBy year(DateofBirth)
/*The above statement gives a table with two columns one column with year and another with number brorn in that year*/


SELECT year(DateofBirth) AS YearOfDateOfBirth COUNT(*) AS NumberBorn FROM tblemployee GroupBy year(DateofBirth) ORDER BY year(DateofBirth) DESC


/*SELECT FROM WHERE GROUPBY ORDER BY*/ /*It is the order to write*/

/*FROM WHERE GROUPBY ORDER BY SELECT*/ /*It is the order to SQL Executes*/ /*So do not use Alias fields to summarize*/


/* SUMMARIZING AND ORDERING DATA*/