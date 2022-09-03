/*RANGE/ROW*/

SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER() AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The above block shows total attendance as35409


--The above block is same as
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
SUM(A.NumberAttendance) OVER(ORDER BY A.EmployeeNumber,A.AttendanceMonth
                            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber


--So when over() the place inside () is blank what it means is
--RANGE     --RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING --By default there is no ORDER BY
--RANGE     --RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW         --By default when there is an ORDER BY    
/*RANGE/ROW*/