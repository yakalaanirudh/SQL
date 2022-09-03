/*XQUERY MODIFY METHOD*/

--The [1] at end denotes singleton
--To use modify we should use SET
SET @x.MODIFY('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]        
                  with "6.0"')
SELECT @x

SET @x.MODIFY('insert <Item Cost="5">New Food</Item>
			   into (/Shopping/ShoppingTrip)[2]')
SELECT @x







/*XQUERY MODIFY METHOD*/