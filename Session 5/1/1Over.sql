/*OVER*/

--The below is the base table
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The above is the base table

SELECT A.EmployeeNumber,year(A.AttendanceMonth) AS AttendanceYear,sum(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY A.EmployeeNumber,year(A.AttendanceMonth)       --We cant use aliases in GROUP BY
ORDER BY A.EmployeeNumber,year(A.AttendanceMonth)       --We can use aliases in ORDER BY
--The above gives a table with columns EmployeeNumber,AttendanceYear,TotalAttendance
--And we can observe  that it is grouped by year and then EmployeeNumber
--The TotalAttendance is number of days an employee attends in an year
--So group by cant be relied on


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER() AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The above block gives sum of all days employees attended in evry month
--The table has columns EmployeeNumber,Attendance Month,Number Attendance,Total Attendance Value 35409
--NumberAttendance has number of days an emplaoyee atttends per month,TotalAttendance sum of all employees all months
--SELECT SUM(A.NumberAttendance) FROM tblAttendance --It gives 35409


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER() AS TotalAttendance,
A.NumberAttendance/SUM(A.NumberAttendance) OVER()*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--What we aree doing in above block is we are dividing number of days an employee attends in an month by
--sum of all days employees attend in all months
--The table has columns EmployeeNumber,Attendance Month,Number Attendance,Total Attendance Value 35409,and PercentageofAttendance


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER() AS TotalAttendance,
CONVERT(money,A.NumberAttendance)/SUM(A.NumberAttendance) OVER()*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER() AS TotalAttendance,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER()*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber



--What OVER does is
--It takes a particular range(or some rows) and it does a calculation
--In this case sum
---Based on that number over those rows


/*OVER*/