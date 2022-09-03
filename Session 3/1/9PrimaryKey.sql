/*PRIMARY KEY -IN PRACTICE*/


ALTER TABLE tblEmployee
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber)


INSERT INTO tblEmployee(EmployeeNumber,EmployeeFirstName,EmployeeMiddleName,EmployeeLastName,EmployeeGovernmentID,DateofBirth,Department)
VALUES (2004,'FirstName','MiddleName','LastName','AB351651','2014-01-01','Accounts')


DELETE FROM tblEmployee
WHERE EmployeeNumber =2004


ALTER Table Employee
DROP CONSTRAINT PK_tblEmployee

/*PRIMARY KEY BY DEFAULT IS CLUSTERED IF WE WANT NON CLUSTERED*/
/*ADD NONCLUSTERED TO IT*/
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber)
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY NONCLUSTERED (EmployeeNumber)


/* PRIMARY KEY IDENTITY(1,1) Starting is 1 and with every step it increases by 1*/
CREATE TABLE tblEmployee2
(EmployeeNumber INT CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),EmployeeName NVARCHAR(20))


/*Suppose we created a column for primary key(surrogate key) we cannot manually add values into it*/
/*To manually add values into it*/
SET IDENTITY_INSERT tblName ON


/*Now let us add two rows 
1 Anu
2 Anirudh
and if we delete them the next values add will have primary key 3 and 4 not 1 and 2
*/

/*These two take the current table*/
SELECT @@IDENTITY               --It gives the last identity(primary key) used in this case 2
SELECT @@SCOPE_IDENTITY()       --It gives the last identity(primary key) used in that scope like function scope

/*This takes a specific table*/
SELECT IDENT_CURRENT('dbo.tblName')     --The identity that was last used in that table


/*PRIMARY KEY -IN PRACTICE*/