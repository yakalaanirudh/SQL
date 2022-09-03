/*LAG AND LEAD*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
LAG(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
LEAD(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
/*Output
EmployeeNumber AttendanceMonth NumberAttendance MyLag       MyLead
123             2014-01-01      14              NULL        12
123             2014-01-01      12              14          23
123             2014-01-01      23              12          21
123             2014-01-01      21              23          223
123             2014-01-01      23              21          20
*/
--In lag the value is lagged by 1 row
--In lead the value is ahead by 1 row


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
LAG(NumberAttendance,3)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
LEAD(NumberAttendance,3)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The 3 defines offset that is now the lead and lag will be 3 rows



SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
LAG(NumberAttendance,3,999)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
LEAD(NumberAttendance,3,999)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The third parameter is the value to fill in in case of NULL


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
LAG(NumberAttendance,3,999)
    OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
LEAD(NumberAttendance,3,999)
    OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead,
NumberAttendance-LAG(NumberAttendance,1)OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyDiff
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The above block creates a table with a new column with the difference between current row and previous row



/*LAG AND LEAD*/