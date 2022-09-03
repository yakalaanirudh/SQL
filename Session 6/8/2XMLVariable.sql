/*CREATING XML VARIABLE AND XML FIELD*/

DECLARE @x XML
SET @x='<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

SELECT @x AS XMLOutput      --This gives all the above xml data as a hyperlink

--The below block creates a field named XMLOutputField whose datatype XML is and it allows null
ALTER TABLE [dbo].[tblEmployee]
ADD XMLOutputField XML NULL
--The above block creates a field named XMLOutputField whose datatype XML is and it allows null


UPDATE [dbo].[tblEmployee] 
SET XMLOutputField = @x
WHERE EmployeeNumber = 200
--The above block gives the xml hyperlink as value in the table where row employeenumber=200
SELECT * FROM [dbo].[tblEmployee]






/*CREATING XML VARIABLE AND XML FIELD*/