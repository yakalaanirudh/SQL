/*CREATING TEMPORARY VARIABLES*/

DECLARE @myvar AS INT=2    /*This is declaring and setting all variables names should start with @*/
SET @myvar=3   /*Reassigning value*/
DECLARE @myvare
SET @myvare AS 2
SELECT @myvare AS myvarn    /*Renaming the variable*/


DECLARE @myvar AS int=2
SET @myvar=3.5
SELECT @myvar AS myVariable  /*3*/    /*Because the initial type is given as int SQL gives an int by turncating 3.5*/


/*CREATING TEMPORARY VARIABLES*/            