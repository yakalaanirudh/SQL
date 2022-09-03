/*SELF JOIN*/

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






/*SELF JOIN*/