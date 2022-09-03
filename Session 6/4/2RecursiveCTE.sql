/*RECURSIVE CTE*/
--common table expression




BEGIN TRAN
ALTER TABLE TblEmployee
ADD MANAGER INT
GO
UPDATE TblEmployee
SET Manager=((EmployeeNumber-123)/10)+123
WHERE EmployeeNumber>123
SELECT E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,E.Manager
M.EmployeeNumber,M.EmployeeFirstName,M.EmployeeLastName,M.Manager FROM tblEmployee AS E
LEFT JOIN tblEmployee AS M
ON E.Manager=M.EmployeeNumber
---


---
BEGIN TRAN
ALTER TABLE TblEmployee
ADD MANAGER INT
GO
UPDATE TblEmployee
SET Manager=((EmployeeNumber-123)/10)+123
WHERE EmployeeNumber>123;           --IN CTE here ; is mandatory
WITH MyTable AS
(SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName,0 AS BossLevel FROM TblEmployee WHERE Manager IS NULL
UNION ALL
SELECT E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,MyTable.BossLevel+1 FROM TblEmployee AS E
JOIN MyTable ON E.Manager=MyTable.EmployeeNumber
)
SELECT * FROM MyTable


/*
LEVELS

----1
BEGIN TRAN
ALTER TABLE TblEmployee
ADD MANAGER INT
GO
UPDATE TblEmployee
SET Manager=((EmployeeNumber-123)/10)+123
WHERE EmployeeNumber>123
WITH MyTable AS
(SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName,0 AS BossLevel FROM TblEmployee WHERE Manager IS NULL)

SELECT * FROM MyTable

--This gives a table with one row the CEO whose boss level is 0
--The table has columns EmployeeNumber,EmployeeFirstName,EmployeeLastName,0 AS BossLevel
--The above table is named MyTable
----1

---2
BEGIN TRAN
ALTER TABLE TblEmployee
ADD MANAGER INT
GO
UPDATE TblEmployee
SET Manager=((EmployeeNumber-123)/10)+123
WHERE EmployeeNumber>123;           --IN CTE here ; is mandatory
WITH MyTable AS
(SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName,0 AS BossLevel FROM TblEmployee WHERE Manager IS NULL
UNION ALL
SELECT E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,MyTable.BossLevel+1 FROM TblEmployee AS E
JOIN MyTable ON E.Manager=MyTable.EmployeeNumber
)
SELECT * FROM MyTable


---2



/*
--
In level 2
WITH MyTable AS
(SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName,0 AS BossLevel FROM TblEmployee WHERE Manager IS NULL
This is called Anchor
--


--
What level 2 does is from Employee table take all employees whose manager's employeenumber is equal to level 1s employeenumber
--
*/

/*RECURSIVE CTE*/