/*ADDING TOTALS*/

SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
ORDER BY Department,EmployeeNumber,AttendanceMonth
--The above block gives a table


SELECT SUM(NumberAttendance) AS GrandTotal FROM tblAttendance
--The above block gives total of all dates from NumberAttendance Column


SELECT E.Department,E.EmployeeNumber,SUM(A.AttendanceMonth), AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY Department,EmployeeNumber
ORDER BY Department,EmployeeNumber,AttendanceMonth
--This block gives Department,EmployeeNumber and Sum of hours worked by each employee



--To perform a UNION between the two blocks we do
SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
UNION
SELECT E.Department,E.EmployeeNumber,'2016-01-01',SUM(A.AttendanceMonth), AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY Department,EmployeeNumber
ORDER BY Department,EmployeeNumber,AttendanceMonth
--The above block gives a table with individual rows and in the middle a sum of hours for every employee


--But instead of giving a made up value we can write NULL
SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
UNION
SELECT E.Department,E.EmployeeNumber,NULL,SUM(A.AttendanceMonth), AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY Department,EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
--In Ascending order NULLs come before data


--Now if we want totals by department too we do another UNION
SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
UNION
SELECT E.Department,E.EmployeeNumber,NULL,SUM(A.AttendanceMonth), AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY E.Department,E.EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
UNION
SELECT E.Department,NULL,NULL,SUM(A.AttendanceMonth), AS TotalAttendance        --We set Department to NULL
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY Department,EmployeeNumber
GROUP BY E.Department


--Now if we want totals by all departmentsa nd employees too we do another UNION
SELECT E.Department,E.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
UNION
SELECT E.Department,E.EmployeeNumber,NULL,SUM(A.AttendanceMonth), AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY E.Department,E.EmployeeNumber
--ORDER BY Department,EmployeeNumber,AttendanceMonth
UNION
SELECT E.Department,NULL,NULL,SUM(A.AttendanceMonth), AS TotalAttendance        --We set Department to NULL
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY Department,EmployeeNumber
GROUP BY E.Department
UNION
SELECT NULL,NULL,NULL,SUM(A.AttendanceMonth), AS TotalAttendance        --We set Department to NULL
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
GROUP BY Department,EmployeeNumber
GROUP BY E.Department
ORDER BY Department,EmployeeNumber,AttendanceMonth






/*ADDING TOTALS*/