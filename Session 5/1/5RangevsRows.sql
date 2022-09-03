/*RANGE VS ROWS*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RowsTotal,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RangeTotal,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth



SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW FOLLOWING) AS RowsTotal,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber,YEAR(A.AttendanceMonth) 
                                ORDER BY A.AttendanceMonth 
                                RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW FOLLOWING) AS RangeTotal,
FROM tblEmployee AS E JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) AS A
ON E.EmployeeNumber=A.EmployeeNumber
--WHERE year(A.AttendanceMonth)=2014
ORDER BY A.EmployeeNumber,A.AttendanceMonth 
--The above block produces a table of EmployeeNumber,AttendanceMonth,NumberAttendance,RowsTotal,RangeTotal
--We have to observe that since we unioed itself every entry will have two rows
--In RowsTotal in first first itll be 14 and second row itll be 28
--In RangeTotal in first first itll be 28 and second row itll be 28
--i.e Range also considers duplicates



--For range these are teh limits
--Unbounded preceding and current row
--Current Row and Unbounded following
--Unbounded preceding and unbounded following       --In this case range and rows will be same


--Range is slower than Rows


/*RANGE VS ROWS*/