/*GROUPING SETS*/

SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy
GROUPING_ID(E.Department,E.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedById
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY CUBE(E.Department,E.EmployeeNumber,A.AttendanceMonth)
ORDER BY Department,EmployeeNumber,AttendanceMonth

/*
Cube works in the same way as Roll up but it performs summation in all possible ways
Since that much summarization is redudant we usually dont use it
*/



SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy
GROUPING_ID(E.Department,E.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedById
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY GROUPING SETS ((E.Department,E.EmployeeNumber,A.AttendanceMonth),(E.Department))   --This groups only by department
CUBE(E.Department,E.EmployeeNumber,A.AttendanceMonth)
ORDER BY Department,EmployeeNumber,AttendanceMonth
/*The above block gives sum per department only*/



SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy
GROUPING_ID(E.Department,E.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedById
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY GROUPING SETS ((E.Department,E.EmployeeNumber,A.AttendanceMonth),(E.Department),())   --This groups all
CUBE(E.Department,E.EmployeeNumber,A.AttendanceMonth)
ORDER BY Department,EmployeeNumber,AttendanceMonth
/*The above block gives sum of all*/



SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy
GROUPING_ID(E.Department,E.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedById
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY GROUPING SETS ((E.Department,E.EmployeeNumber,A.AttendanceMonth),(E.Department),())   --This groups all
CUBE(E.Department,E.EmployeeNumber,A.AttendanceMonth)
ORDER BY
CASE WHEN Department        IS NULL THEN 1 ELSE 0 END,Department
CASE WHEN E.EmployeeNumber  IS NULL THEN 1 ELSE 0 END,E.EmployeeNumber
CASE WHEN A.AttendanceMonth IS NULL THEN 1 ELSE 0 END,A.AttendanceMonth
--The above block makes the values appear first and sets the respective summation in the bottom


/*GROUPING SETS*/