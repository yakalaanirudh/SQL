/*CREATING PRIMARY AND SECONDARY XML INDEXES*/

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
  <Item>Furniture
        <Color></Color></Item>  
</ShoppingTrip>  
</Shopping>'  

DROP TABLE #tblXML;
CREATE TABLE #tblXML(pkXML INT PRIMARY KEY, xmlCol XML)

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)

CREATE PRIMARY XML INDEX pk_tblXML ON #tblXML(xmlCol)       --This creates a primary XML index
--CREATE PRIMARY XML INDEX indexName ON #tblName(columnName)

--For Path,value and property we create secondary index
--Secondary Indexes are reliant on primary indexes

CREATE XML INDEX secpk_tblXML_Path ON #tblXML(xmlCol) USING XML INDEX pk_tblXML FOR PATH    --This creates asecondary index
--CREATE XML INDEX indexName ON #tblName(columnName) USING XML INDEX primaryIndexName FOR PATH

CREATE XML INDEX secpk_tblXML_Value ON #tblXML(xmlCol) USING XML INDEX pk_tblXML FOR VALUE
CREATE XML INDEX secpk_tblXML_Property ON #tblXML(xmlCol) USING XML INDEX pk_tblXML FOR PROPERTY


--Indexes are a way to make sql find data faster


--Path Secondary indexes make the queries that use path faster 
--example exists method 

--Value Secondary indexes are good for queries that use wildcards in the path
--We use wildcards when we do not know the full path

--Property indexes  are good when multiple values are being retrieved



/*CREATING PRIMARY AND SECONDARY XML INDEXES*/