/*XQUERY VALUE AND EXIST METHODS*/

--We convert xml to tables (reverse of previous section)
--It is also called shredding
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



SELECT @x.VALUE('(/Shopping/ShoppingTrip/Item)[1]','varchar(50)')           --Bananas
SELECT @x.VALUE('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)')     --5

SELECT @x.VALUE('(/Shopping/ShoppingTrip/Item/Cost)[1]','varchar(50)')      --Returns cost element
SELECT @x.VALUE('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)')     --Returns cost attribute



--X.VALUE takes two arguments
--1 Where in the tags       --Should start with /
--2 DataType to be returned
--It returns only one value


SELECT @x.EXIST('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)')         --Returns 1 if exists else 0

/*XQUERY VALUE AND EXIST METHODS*/