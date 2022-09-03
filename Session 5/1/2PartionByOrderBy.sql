/*PARTITION BY AND ORDER BY*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER() AS TotalAttendance,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER()*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
WHERE year(A.AttendanceMonth)=2014
--The above block shows in the PercentageofAttendance the number of days in month /total number in that year(2014)
--What we aree doing in above block is we are dividing number of days an employee attends in an month by
--sum of all days employees attend in all months


--What PARTITION BY does is it refines the range or rows we are going to take
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) AS TotalAttendance,
--CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER()*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
WHERE year(A.AttendanceMonth)=2014
--The above block shows EmployeeNumber,AttendanceMonth,Attendance in that month and 
--Total Attendance for that year for that employee



SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) AS TotalAttendance,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
WHERE year(A.AttendanceMonth)=2014
--The above block shows EmployeeNumber,AttendanceMonth,Attendance in that month and 
--Total Attendance for that year for that employee
--The percent of attendance in that month for that employee
--Suppose employee attends 180 days in year and 6 in january so for jan itll be ((6/180)*100)


--Do not use comma in OVER
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth) AS RunningTotal,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
WHERE year(A.AttendanceMonth)=2014
--The above block shows EmployeeNumber,AttendanceMonth,Attendance in that month and 
--The running total for that employee in that year



SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth DESC) AS RunningTotal,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
WHERE year(A.AttendanceMonth)=2014



SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth DESC) AS RunningTotal,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth



--We can use comma in OVER for partition fields
--so now if there are more years in data the running total restarts at every year
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) ORDER BY A.AttendanceMonth DESC) AS RunningTotal,
CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth





/*PARTITION BY AND ORDER BY*/