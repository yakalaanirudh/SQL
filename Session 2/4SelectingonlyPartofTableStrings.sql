/*SELECTING ONLY A PART OF TABLE STRINGS*/


SELECT * FROM tblemployee where [FirstName]="Andrew"   /*where name is andrew*/
SELECT * FROM tblemployee where [FirstName]<>"Andrew"  /*where name is not andrew*/
SELECT * FROM tblemployee where [FirstName]<"Andrew"    /*Name earlier in dictionary*/
SELECT * FROM tblemployee where [FirstName] like "A%"       /*Starts with A*/
SELECT * FROM tblemployee where [FirstName] like"%w"        /*Ends with w*/
SELECT * FROM tblemployee where [FirstName] like"%nd%"      /*Has nd*/
SELECT * FROM tblemployee where [FirstName] like "_A%"      /*There should be only 1 letter before A*/
SELECT * FROM tblemployee where [FirstName] like '[r-t]%'
SELECT * FROM tblemployee where [FirstName] like '[^rst]%'

/*
_ =>1 character
[A-G]  =>In the range A to G
[AGQ]  => Has A OR G OR Q
[^AGQ]  => NOT Has A OR G OR Q
*/



/*SELECTING ONLY A PART OF TABLE STRINGS*/