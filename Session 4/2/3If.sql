/*EXERCISE WITH IF*/

CREATE PROC NameEmployees(@EmployeeNumber int) AS
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber=@EmployeeNumber)
    BEGIN
        IF @EmployeeNumber<300
        BEGIN
            SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
        END
        ELSE
        BEGIN
            SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName,Department from tblEmployee WHERE EmployeeNumber=@EmployeeNumber
            SELECT * FROM tblTransaction WHERE EmployeeNumber=@EmployeeNumber
        END
    END
END

GO
execute NameEmployees 123
exec NameEmployees 123 
NameEmployees 123







/*EXERCISE WITH IF*/