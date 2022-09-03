/*CURRENT ROW AND UNBOUNDED*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS RunningTotal,
--CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth



--UNBOUNDED means to infinity 
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RunningTotal,
--CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN 0 PRECEDING AND UNBOUNDED FOLLOWING) AS RunningTotal,
--CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth



--Current row is same as 0 preceding or 0 following
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN CURRENT ROW PRECEDING AND UNBOUNDED FOLLOWING) AS RunningTotal,
--CONVERT(decimal(18,7),A.NumberAttendance)/SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber)*100 AS PercentageofAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth







/*CURRENT ROW AND UNBOUNDED*/