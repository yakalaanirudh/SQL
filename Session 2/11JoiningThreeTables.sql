/*JOINING THREE TABLES*/


SELECT * 
FROM tblDepartment 
left join tblemployee 
on tblDepartment.Department=tblEmployee.Department
left join tbl transaction
on tblemployee.employeenumber=tbltransaction.employeenumber


SELECT D.Departmenthead,sum(T.amount) as sumofamount 
FROM tblDepartment as D
left join tblemployee as E
on D.Department=E.Department
left join tbl transaction as T
on E.employeenumber=T.employeenumber
group by D.Departmenthead
order by D.Departmenthead


/*JOINING THREE TABLES*/