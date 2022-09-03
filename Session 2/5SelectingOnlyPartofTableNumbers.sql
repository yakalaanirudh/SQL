/*SELECTING ONLY A PART OF TABLE NUMBERS*/


SELECT * FROM tblemployee WHERE EmployeeNumber >200
SELECT * FROM tblemployee WHERE NOT EmployeeNumber >200
SELECT * FROM tblemployee WHERE EmployeeNumber <200
SELECT * FROM tblemployee WHERE EmployeeNumber =200
SELECT * FROM tblemployee WHERE EmployeeNumber !=200
SELECT * FROM tblemployee WHERE EmployeeNumber >=200 and EmployeeNumber <=300
SELECT * FROM tblemployee WHERE NOT (EmployeeNumber >=200 and EmployeeNumber <=300)
SELECT * FROM tblemployee WHERE EmployeeNumber >=200 or EmployeeNumber <=300
SELECT * FROM tblemployee WHERE EmployeeNumber BETWEEN 200 and 300   /*Do not use IS (EmployeeNumber IS)*/ /*It is inclusive*/
SELECT * FROM tblemployee WHERE EmployeeNumber NOT BETWEEN 200 and 300   /*Do not use IS (EmployeeNumber IS)*/
SELECT * FROM tblemployee WHERE EmployeeNumber IN BETWEEN 200 and 300
SELECT * FROM tblemployee WHERE EmployeeNumber IN (200,250,300)


/*SELECTING ONLY A PART OF TABLE NUMBERS*/