/*INTERSECT AND EXCEPT*/


SELECT *,Row_Number() over(ORDER BY (SELECT NULL)) %3 AS ShouldIDelete
INTO tblTransactionNew
FROM tblTransaction

DELETE FROM tblTransactionNew
WHERE ShouldIDelete=1

UPDATE tblTransactionNew
SET DateOfTransaction=dateadd(day,1,DateOfTransaction)
WHERE ShouldIDelete=2

ALTER TABLE tblTransactionNew
DROP column ShouldIDelete

SELECT * FROM tblTransaction        --2486 rows
--UNION ALL
--UNION
--EXCEPT
--INTERSECT
SELECT * FROM tblTransactionNew     --1657 rows,829 changed rows,828 unchanged rows

--UNION/UNION ALL IS  A SELECT STATEMENT WITH HAVING KEYWORDS TILL HAVING
--WE SHOULD KEEP ORDER BY AFTER THE LAST STATEMENT OF THE UNION


SELECT * FROM tblTransaction        --2486 rows
--UNION ALL
--UNION
--EXCEPT
--INTERSECT
SELECT * FROM tblTransactionNew     --1657 rows,829 changed rows,828 unchanged rows
ORDER BY EmployeeNumber


SELECT * FROM tblTransaction        --2486 rows
ORDER BY EmployeeNumber
--UNION ALL
--UNION
--EXCEPT
--INTERSECT
SELECT * FROM tblTransactionNew     --1657 rows,829 changed rows,828 unchanged rows
ORDER BY EmployeeNumber
/*The above block gives an error because order by is after first statement*/



/*INTERSECT AND EXCEPT*/