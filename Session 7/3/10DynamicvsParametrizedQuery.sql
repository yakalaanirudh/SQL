/*DYNAMIC VS PARAMETRIZED QUERY*/

DECLARE @param VARCHAR(100)='127';
--The above can be misused if some types    --It is called sql injection
DECLARE @param VARCHAR(100)='127' +cahe(10)+'SELECT * FROM tblDepartment';
--They can see all data


DECLARE @sql VARCHAR(100)='SELECT * FROM [dbo].[tblTransaction] AS T WHERE T.EmployeeNumber ='+@param;
EXECUTE(@sql)

--To avoid it we use parametrized query
--For this everything should be NVARCHAR OR NCHAR
DECLARE @param VARCHAR(100)='127'
EXECUTE SYS.sp_executesql
@statement= N'SELECT * FROM [dbo].[tblTransaction] AS T WHERE T.EmployeeNumber =+@EmployeeNumber';
@params=N'@EmployeeNumber varchar(100)';
@EmployeeNumber=@param



/*DYNAMIC VS PARAMETRIZED QUERY*/