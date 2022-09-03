/*WHAT ARE TRIGGERS*/


--DDL-Data Definition Language
--DML-Data Definition Language


/*
Creates a DML, DDL, or logon trigger.
A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
DML triggers run when a user tries to modify data through a data manipulation language (DML) event.
DML events are INSERT, UPDATE, or DELETE statements on a table or view.
These triggers fire when any valid event fires, whether table rows are affected or not.

DDL triggers run in response to a variety of data definition language (DDL) events.
These events primarily correspond to Transact-SQL CREATE, ALTER, and DROP statements,
and certain system stored procedures that perform DDL-like operations.

*/

--There are 3 types of DML triggers For,After,Instead       --For and After are of same meaning

/*
--AFTER TRIGGER
INSERT INTO tbltransaction
It inserts
AFTER Trigger is called
*/



/*
--INSTEAD OF TRIGGER
INSERT INTO tbltransaction
It does not insert
INSTEAD OF Trigger is called
*/


/*
One use of triggers is as we know we can enter data into views if it modifies more than 1 table at once.
We can use triggers to circumvent that
*/



/*WHAT ARE TRIGGERS*/