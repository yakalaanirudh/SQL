/*NTILE*/
--What Ntile does is distribute data in buckets

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
ROW_NUMBER() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
/*Output
EmployeeNumber AttendanceMonth NumberAttendance TheRowNumber
123             2014-01-01      14              1
123             2014-01-01      14              2
123             2014-02-01      12              3
123             2014-02-01      12              4
123             2014-03-01      23              5
123             2014-03-01      23              6
*/


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
NTILE(10) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
/*
What the above does is suppose there are 80 rows in that table
NTILE(10) sets 8 rows in 10 buckets

NTILE places larger buckets first
Suppose there are 22 rows and 10 buckets
It will be placed in order 3 3 2 2 2 2 2 2 2 2 (i.e 2buckets of 3 and 8 buckets of 2)

/*NTILE*/