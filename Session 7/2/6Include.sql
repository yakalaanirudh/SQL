/*INCLUDE*/

--Includes allows us to add fields into index but they wont be requiring more space

CREATE NONCLUSTERED INDEX idx_tblEmployee2 on [dbo].[tblEmployee]([DateOfBirth],[FirstName],[LastName],[Manager])
--The above requires more space for index

CREATE NONCLUSTERED INDEX idx_tblEmployee2 on [dbo].[tblEmployee]([DateOfBirth])
INCLUDE ([FirstName],[LastName],[Manager])
--The above requires less space for index


--Includes allows us to add fields at leaf level without including them at root or intermediate level


--Order matters in non clustered indeices
CREATE NONCLUSTERED INDEX idx_tblEmployee2 on [dbo].[tblEmployee]([FirstName],[LastName])
--It goes through FirstName and then searches on LastName


CREATE NONCLUSTERED INDEX idx_tblEmployee2 on [dbo].[tblEmployee]([LastName],[FirstName])
--It goes through LastName and then searches on FirstName
/*INCLUDE*/