/*WHAT ARE CONSTRAINTS*/

/*(EmployeeNumber,EmployeeFirstName,EmployeeMiddleName,EmployeeLastName,EmployeeGovernmentID,DateofBirth,Department)*/
BEGIN TRAN
UPDATE tblEmployee
SET EmployeeGovtID='aaaa'
WHERE EmployeeNumber BETWEEN 530 AND 539
SELECT * FROM tblemployee ORDER BY EmployeeGovernmentID ASC
ROLLBACK TRAN


INSERT INTO tblEmployee
VALUES NULL,EmployeeFirstName,EmployeeMiddleName,EmployeeLastName,EmployeeGovernmentID,DateofBirth,Department
FROM tblEmployee
/*The above transaction wont go through beacuse first column is null and there is a constraint of not null*/


INSERT INTO tblEmployee
VALUES (2001,'FirstName','M','LastName','AB1234ASD','1995-12-05','Commercial'),
(NULL,'AnotherFirstName','Mi','AnotehrLastName','AB123544ASD','1996-12-05','Finance')
/*The above transaction fails because even if one row data has null entire transaction will be negated.*/

/*UNIQUE,DEFAULT,CHECK,PRIMARY KEY,FOREIGN KEY ARE THE DIFFERENT TYPES OF CONSTRAINTS*/
/*WHAT ARE CONSTRAINTS*/