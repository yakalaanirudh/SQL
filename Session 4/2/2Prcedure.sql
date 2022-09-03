/*ASK FOR A SPECIFIC EMPLOYEE*/


/*To drop a view*/
IF exists (SELECT * FROM sys.views WHERE name="ViewByDepartment")
---then we drop it
drop view ViewByDepartment

/*To drop a procedure*/
IF exists (SELECT * FROM sys.procedures WHERE name="NameEmployees")
---then we drop it
drop proc NameEmployees


/*To drop a procedure*/
IF object_ID('NameEmployees','P') IS NOT NULL       --P for procedure V for views
---then we drop it
drop proc NameEmployees

--A normal procedure
CREATE PROC NameEmployees AS
BEGIN
    SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee
END

GO
execute NameEmployees
exec NameEmployees
NameEmployees


--To ask for  aspecific employee we do
CREATE PROC NameEmployees(@EmployeeNumber int) AS
BEGIN
    SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
END

GO
execute NameEmployees 123
exec NameEmployees 123 
NameEmployees 123


--To avoid empty results if that employee number does not exist
CREATE PROC NameEmployees(@EmployeeNumber int) AS
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber=@EmployeeNumber)
    BEGIN
        SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
    END
END

GO
execute NameEmployees 123
exec NameEmployees 123 
NameEmployees 123



/*ASK FOR A SPECIFIC EMPLOYEE*/
