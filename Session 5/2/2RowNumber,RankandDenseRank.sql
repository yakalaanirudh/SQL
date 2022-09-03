/*ROW_NUMBER,RANK AND DENSE_RANK*/

--
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--


--The function ROW_NUMBER() must have an OVER clause with ORDER BY
SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
ROW_NUMBER() OVER(ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--The above block gives a table with EmployeeNumber,AttendanceMonth,NumberAttendance and TheRowNumber
--TheRowNumber Column has values same as number of rows


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
ROW_NUMBER() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--In this block TheRowNumber restarts after evry EmployeeNumber


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
ROW_NUMBER() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
DENSE_RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber=A.EmployeeNumber
--In this block there will Row_Number,Rank,Dense_Rank


SELECT A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance
ROW_NUMBER() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
DENSE_RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber,A.AttendanceMonth) AS TheRowNumber
FROM tblEmployee AS E JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) AS A
ON E.EmployeeNumber=A.EmployeeNumber
--In this block when there is duplicate
--Rank gives the lowest value among duplicates and skips the intermediate vales
--DenseRank gives the lowest value among duplicates and does not skip the intermediate vales
/*
EmployeeNumber AttendanceMonth NumberAttendance TheRowNumber TheRank TheDenseRank
123             2014-01-01      14              1           1           1
123             2014-01-01      14              2           1           1
123             2014-02-01      12              3           3           2
123             2014-02-01      12              4           3           2
123             2014-03-01      23              5           5           3
123             2014-03-01      23              6           5           3
*/


----The function ROW_NUMBER() must have an OVER clause with ORDER BY to circumvent this we can write
SELECT *,ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) FROM tblAttendance
/*ROW_NUMBER,RANK AND DENSE_RANK*/