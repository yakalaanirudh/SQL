/*CONVERTING BETWEEN NUMBER TYPES*/

/*
SELECT 3/2 ->Integer
SELECT 3.0/2 ->Decimal
SELECT 3/2.0 ->Decimal
*/
--Conversion can be done in two ways implicit or explicit


--IMPLICIT
DECLARE @myvar AS DECIMAL(5,2)=3
SELECT @myvar           --3.00

--EXPLICIT
SELECT CONVERT(decimal(5,2),3)          --3.00  /*SELECT CONVERT(decimal(5,2),Initial Value)
SELECT CAST(3 AS decimal(5,2))          --3.00  /*SELECT CAST(Initial Value AS decimal(5,2)) 


SELECT CONVERT(int,12.345)+CONVERT(12.7)        --24
SELECT CONVERT(int,12.345+12.7)                 --25


/*CONVERTING BETWEEN NUMBER TYPES*/