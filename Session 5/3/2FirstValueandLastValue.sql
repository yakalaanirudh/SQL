/*FIRST_VALUE AND LAST_VALUE*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FIRST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS FirstMonth,
LAST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS FirstMonth,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
/*Output
EmployeeNumber AttendanceMonth NumberAttendance FirstMonth LastMonth
123             2014-01-01      14              14          20
123             2014-01-01      12              14          20
123             2014-01-01      23              14          20
123             2014-01-01      21              14          20
123             2014-01-01      23              14          20
...
...
...
123             2015-10-01      20              14          20
*/

--FIRST_VALUE and LAST_VALUE takes the first and last value by that partition 


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FIRST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
    ROWS BETWEEN 2 PRECEDING AND CURRENT_ROW) AS FirstMonth,
LAST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS FirstMonth,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
/*Output
EmployeeNumber AttendanceMonth NumberAttendance FirstMonth LastMonth
123             2014-01-01      14              14          20
123             2014-01-01      12              14          20
123             2014-01-01      23              14          20
123             2014-01-01      21              12          20
123             2014-01-01      23              23          20
...
...
...
123             2015-10-01      20              14          20
*/
--What the above block does the value in first month is the value in NumberofAttendance preceded by 2
--It can be done in the same way with LAST_VALUE


/*FIRST_VALUE AND LAST_VALUE*/