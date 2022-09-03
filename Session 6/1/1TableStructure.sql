/*TABLE STRUCTURE*/


/*
At the current point in the course
We have  3 tables

tblDepartment
Department  DepartmentHead

tblEmployee
EmployeeNumber  EmployeeFirstName   EmployeeMiddleName  EmployeeLastName    GovtID  DateOfBirth     Department

tbltransaction
Amount  DateofTransaction   EmployeeNumber

*/

SELECT MIN(EmployeeNumber) AS MinNumber,MAX(EmployeeNumber) AS Maxnumber FROM tbltransaction
--The above gives the min and max employeeNumber in the table*/


/*TABLE STRUCTURE*/