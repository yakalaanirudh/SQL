/*XQUERY NODES -SHREDDING A TABLE*/

DECLARE @x1 XML, @x2 XML

SET @x1='<Shopping ShopperName="Phillip Burton" >  
<ShoppingTrip ShoppingTripID="L1" >  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>' 

SET @x2='<Shopping ShopperName="Phillip Burton" >
<ShoppingTrip ShoppingTripID="L2" >  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip>  
</Shopping>'  

DROP TABLE #tblXML
CREATE TABLE #tblXML(pkXML INT PRIMARY KEY, xmlCol XML)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)
SELECT * FROM #tblXML
--The above block creates a table of two columns pkXML and xmlCol
/*
pkXML   xmlCol
1       <ShoppingTrip>......</ShoppingTrip>
2       <ShoppingTrip>......</ShoppingTrip>
*/


SELECT tbl.col.query('.')
FROM #tblXML CROSS APPLY            --We cant use joins so we use APPLY
xmlCol.nodes('/Shopping/ShoppingTrip') AS tbl(col)
--The above block creates a table of a column(unnamed)
/*
(unnamed)
<ShoppingTrip>......</ShoppingTrip>
<ShoppingTrip>......</ShoppingTrip>
*/


SELECT tbl.col.VALUE('@Cost','varchar(50)')
FROM #tblXML CROSS APPLY            
xmlCol.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)
--The above block creates a table of a column(unnamed)
/*
(unnamed)
5
4
3
NULL
NULL
NULL
*/


/*XQUERY NODES -SHREDDING A TABLE*/