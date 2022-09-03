/*XQUERY QUERY METHOD USING FOR AND RETURN*/

--ORDER FLWOR (to be written in that order)
--FOR LET WHERE ORDER BY RETURN

--ORDER SFWGHO (to be written in that order)
--SELECT FROM WHERE GROUP BY HAVING ORDER BY



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

/*
for $ValueRetrieved in
It is like 
for i in x
*/

SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return $ValueRetrieved')
--Output
/*
<Item Cost="5">Bananas</Item>  
<Item Cost="4">Apples</Item>  
<Item Cost="3">Cherries</Item>
<Item>Emeralds</Item>  
<Item>Diamonds</Item>  
<Item>Furniture</Item> 
*/


SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return string($ValueRetrieved)')
--Output
--  Bananas Apples Cherries Emeralds Diamonds Furniture 


SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return concat(string($ValueRetrieved),";")')
--Output
--  Bananas; Apples; Cherries; Emeralds; Diamonds; Furniture;


SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
                 return concat(string($ValueRetrieved),";")')
--Output
--  Bananas; Apples; Cherries;


/*XQUERY QUERY METHOD USING FOR AND RETURN*/