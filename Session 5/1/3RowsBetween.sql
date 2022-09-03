/*ROWS BETWEEN*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS RunningTotal,
--CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth
--The above block in running total shows sum of attendance in that month,previous and next month
--It restarts at every employee and every year
--i.e december has no following
--and january has no preceding






/*ROWS BETWEEN*/