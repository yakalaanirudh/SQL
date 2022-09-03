/*CUME_DIST AND PERCENT_RANK*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
CUME_DIST()
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyCumeDist,
PERCENT_RANK()
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyPercentRank,
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
/*Output
EmployeeNumber AttendanceMonth NumberAttendance MyCumeDist  MyPercentRank
123             2014-01-01      14              0.045       0
123             2014-01-01      12              0.054       0.054
123             2014-01-01      23              0.09        0.09
123             2014-01-01      21              0.12        0.12 
123             2014-01-01      23              0.15        0.15
...
...
...
123             2014-01-01      23              0.91        0.91
123             2014-01-01      23              0.91        0.91
123             2014-01-01      23              0.97        0.97
123             2014-01-01      23              1           1
*/

--CUME_DIST is Cummulative Distribution




/*CUME_DIST AND PERCENT_RANK*/