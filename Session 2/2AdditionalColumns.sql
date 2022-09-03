/*ADDING ADDITIONAL CLOUMNS*/

ALTER TABLE tblemployee
ADD Dept VARCHAR(30)   /*These two lines add a new column named Dept with data type varchar*/
INSERT INTO tblemployee
VALUES (132,'Dylan','A','Word',,'asd6516','12051995','CustomerRelations') /*This adds data into the table*/

ALTER TABLE tblemployee
DROP COLUMN Dept           /*These two lines drop the field AFTER DROP WE SHOULD WRITE COLUMN KEYWORD*/

ALTER TABLE tblemployee
ADD Dept VARCHAR(20)       /*These two lines add a column with that name and data type*/

ALTER TABLE tblemployee
ALTER COLUMN Dept VARCHAR(15)     /*These two lines alter the  column with that name and data type without droping and re adding it */

SELECT LEN('CustomerRelations')    /*Gives length*/
/*SELECT LEN('ANIRUDH') =7 */
/*SELECT LEN('ADAM')=4 */

/*ADDING ADDITIONAL COLUMNS*/
