/*CONVERTING JSON DATA INTO SQL SERVER TABLES*/

SET @json='
{
    "name":"Phillip",
    "Shopping:
        {"ShoppingTrip":1,
        "Items":
        [
            {"Item":"Bananas","Cost":5},
            {"Item":"Apples","Cost":4},
            {"Item":"Cherries","Cost":3}
        ]
        }
}
'


SELECT * FROM openjson(@json)       --openjson(@variablename)
/*
The above creates a table
key         value       type
name        phillip     1
shopping    The rest    5
*/


SELECT * FROM openjson(@json,'$.Shopping.Items')
/*
The above creates a table
key         value                           type
0           {"Item":"Bananas","Cost":5},    5
1           {"Item":"Apples","Cost":4},     5
2           {"Item":"Cherries","Cost":3}    5
*/

--To create a table
SELECT * FROM openjson(@json,'$.Shopping.Items') WITH (Item varchar(10), Cost int)
/*
The above creates a table
    Item        Cost
1   Bananas     5
2   Apples      4
3   Cherries    3
*/



/*CONVERTING JSON DATA INTO SQL SERVER TABLES*/