/*ANY,SOME,ALL*/

SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber IN (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber

--Instead of in we can use =ANY
SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber =ANY (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber


--Instead of in we can use =SOME
SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber =ANY (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber


SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber <>ANY (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber
--The above fails because SQL gives all rows in output
--It is beacuse SQL sees 126 in (126,127,128,129)
--126 is not equal to 127 but equal to 126 so it gives all rows as output
--For this we use ALL
--What ALL does is it checks is 126 is all of (126,127,128,129) tehn it wont return

SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber <>ALL (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber


SELECT * FROM tblTransaction AS T
WHERE EmployeeNumber =<ALL (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'Y%')
ORDER BY E.EmployeeNumber

/*
ANY,SOME use with =
ALL used with <>

in <= and >=

any gives upto 129
all gives only upto 126


The summary is ANY and SOME give true if 1 in (a,b,c,d) is true
for ALL to give true it should be true in all cases of (a,b,c,d)
*/


/*ANY,SOME,ALL*/