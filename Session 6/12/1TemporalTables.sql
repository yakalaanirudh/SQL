/*TEMPORAL TABLES*/

--Temporal Tables are used to deal with changes 
--That is in 2020 the persons last name is a
--In 2021 the last name is b
--Temporal Tables are used to deal with this changes in data

--4 ways tables deal with change


/*
0
History is not preserved.Data reflects original values
1
Data reflect latest values(previous values are overwritten)
2
Every version of data is represented with seperate row in the table,usually with columns that represent period of validity
3
Keeping limited history for selected attributes using additional columns in the same row
4
Keeping history in a seperate table while original dimension table keeps latest table row versions
*/



/*TEMPORAL TABLES*/