/*MISSING DATA*/

SELECT E.EmployeeNumber AS ENumber,E.EmployeeFirstName,
E.EmployeeLastName,T.EmployeeNumber as TNumber,
sum(T.Amount) AS TotalAmount
from tblEmployee as left join tbltransaction as T
on E.EmployeeNumber=T.Employeenumber
where T.Employeenumber IS NULL
group by E.Employeenumber,T.Employeenumber,E.EmployeeFirstName,E.EmployeeLastName
Order By E.Employeenumber,T.Employeenumber,E.EmployeeFirstName,E.EmployeeLastName


/*MISSING DATA*/