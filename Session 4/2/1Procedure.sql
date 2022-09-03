/*LETS CREATE OUR FIRST PROCEDURE*/

SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee

--If we want a view then
CREATE VIEW VW_Employee AS
SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee


--For a procedure
--Every procedure must start with a begin and end with end
CREATE PROC NameEmployees AS
BEGIN
    SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee
END

GO
--3 ways to execute
execute NameEmployees       --The above block will be run
exec NameEmployees       --The above block will be run
NameEmployees           --But this should be at the start of a new batch

--DAL-Data Access Layer
/*LETS CREATE OUR FIRST PROCEDURE*/