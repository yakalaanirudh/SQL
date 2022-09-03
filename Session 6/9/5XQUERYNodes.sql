/*XQUERY NODES-SHREDDING A VARIABLE*/

--In previous lesson we can only select one value per query
--If we want multiple values(rows) at once we do this by nodes

DECLARE @x XML  
SET @x='<Shopping ShopperName="Phillip Burton" >  
<ShoppingTrip ShoppingTripID="L1" >  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>  
</ShoppingTrip>  
<ShoppingTrip ShoppingTripID="L2" >  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip>  
</Shopping>'

--Nodes should be use in FROM Clause

--STEPS

--@x.nodes('/Shopping/ShoppingTrip') AS tbl(col)

--FROM @x.nodes('/Shopping/ShoppingTrip') AS tbl(col)       --We need to alias the return
--AS tbl(ColumnName)

--SELECT tbl.col.query('.') FROM @x.nodes('/Shopping/ShoppingTrip') AS tbl(col)     --. means we want all data retrieved in query


SELECT tbl.col.query('.') FROM @x.nodes('/Shopping/ShoppingTrip') AS tbl(col)
--Doing this we get two rows one for each ShoppingTrip Element
/*
<ShoppingTrip ShoppingTripID="L1" >  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>  
</ShoppingTrip> 
<ShoppingTrip ShoppingTripID="L2" >  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip>
*/

SELECT tbl.col.query('.') FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)
--Doing this we get six rows one for each Item Element
/*
<Item Cost="5">Bananas</Item>  
<Item Cost="4">Apples</Item>  
<Item Cost="3">Cherries</Item>
<Item>Emeralds</Item>  
<Item>Diamonds</Item>  
<Item>Furniture</Item>
*/

SELECT tbl.col.VALUE('@cost','varchar(50)') FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)
--We get cost for each element
/*
5
4
3
NULL
NULL
NULL
*/


SELECT tbl.col.VALUE('@cost','varchar(50)') AS COST FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)
--Aliasing


SELECT tbl.col.VALUE('.', 'varchar(50)') AS Item, tbl.col.VALUE('@Cost','varchar(50)') AS Cost
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)
/*
Item          Cost
Bananas       5
Apples        4
Cherries      3
Emeralds      NULL
Diamonds      NULL
Furniture     NULL
*/

SELECT tbl.col.VALUE('.', 'varchar(50)') AS Item, tbl.col.VALUE('@Cost','varchar(50)') AS Cost INTO tblTemp
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)
--Above we are entering the data into a table named tblTemp

SELECT * FROM tblTemp     

DROP TABLE tblTemp
--for let where order by return







/*XQUERY NODES-SHREDDING A VARIABLE*/