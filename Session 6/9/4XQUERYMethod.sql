/*XQUERY QUERY METHOD USING LET,WHERE AND ORDER BY*/


--In earlier lecture items returned in order they are entered
--If we want them to be sorted we use

SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
                 let $CostVariable := $ValueRetrieved/@Cost
                 where $CostVariable >= 4
                 order by $CostVariable
                 return concat(string($ValueRetrieved),";")')


/*XQUERY QUERY METHOD USING LET,WHERE AND ORDER BY*/