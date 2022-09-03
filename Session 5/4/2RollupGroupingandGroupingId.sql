/*ROLLUP,GROUPING AND GROUPING_ID*/

SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY E.Department,E.EmployeeNumber,A.AttendanceMonth
ORDER BY Department,EmployeeNumber,AttendanceMonth
--The above is the initial block


--To perform grouping per deparment and per employee and all we use ROLLUP
SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY ROLL_UP(E.Department,E.EmployeeNumber,A.AttendanceMonth)
ORDER BY Department,EmployeeNumber,AttendanceMonth


--To say whether the value is by default NULL or it is NUll due to grouping we use
--GROUPING &GROUPING_ID
--GROUPING gives a column with value 1 where data is 0
SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy
GROUPING_ID(E.Department,E.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedById
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY ROLL_UP(E.Department,E.EmployeeNumber,A.AttendanceMonth)
ORDER BY Department,EmployeeNumber,AttendanceMonth

/*
GROUPING ID does if 1 column is NULL because of grouping its value is 1
                 if 2 column is NULL because of grouping its value is 3
                 if 3 column is NULL because of grouping its value is 7
/*ROLLUP,GROUPING AND GROUPING_ID*/