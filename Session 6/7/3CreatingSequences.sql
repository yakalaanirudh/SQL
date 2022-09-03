/*CREATING SEQUENCES*/

--Sequences is a alternative to GUID
--They store a number and give the next number

BEGIN TRAN
CREATE SEQUENCE newSequence AS INT
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
CYCLE           --we can also use no cycle
--If we use ccycle after 9999999 itll start again at 1
CREATE SEQUENCE secondSequence AS INT       --This gives min,max value as min,max value for that data type
SELECT * FROM sys.sequences
ROLLBACK TRAN




/*CREATING SEQUENCES*/