/*MATHEMATICAL FUNCTIONS*/

/*In trignometry give values in radians*/
DECLARE @myvar AS numeric(7,2)=3
SELECT POWER(@myvar,2) AS mew    /*9*/
SELECT SQUARE(@myvar)  AS mew    /*9*/
SELECT POWER(@myvar,2)  AS mew   /*9*/
SELECT SQRT(@myvar,0.5) AS mew   /*1.71*/
SELECT FLOOR(@myvar) AS mew
SELECT CEILING(@myvar) AS mew
SELECT ROUND(@myvar,0)  AS mew   /*After comma is number of decimal places.-1 to neaerest 10s,-2 to nearest hundreds*/
SELECT PI()
SELECT EXP(1) 
SELECT ABS(456)
SELECT SIGN(456)
SELECT RAND(65165165)   /*Gives a random number*/
/*Angle should be in radians*/

/*MATHEMATICAL FUNCTIONS*/