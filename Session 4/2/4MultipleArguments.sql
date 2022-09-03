/*MULTIPLE ARGUMENTS*/

CREATE PROC NameEmployees(@EmployeeNumberFrom int,@EmployeeNumberTo int) AS
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        IF @EmployeeNumber<300
        BEGIN
            SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName from tblEmployee 
            WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
        END
        ELSE
        BEGIN
            SELECT EmployeeNumber,EmployeeFirstName,EmployeeLastName,Department from tblEmployee 
            WHERE EmployeeNumberBETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
            
            SELECT * FROM tblTransaction WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
    END
END

GO
execute NameEmployees 123,127
exec NameEmployees 223,227
NameEmployees 123,137

execute NameEmployees @EmployeeNumberFrom=123 @EmployeeNumberTo=127
exec NameEmployees @EmployeeNumberFrom=223 @EmployeeNumberTo=227
NameEmployees @EmployeeNumberFrom=123 @EmployeeNumberTo=137







/*MULTIPLE ARGUMENTS*/
