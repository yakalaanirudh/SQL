/*CONVERTING SQL SERVER DATA INTO JSON*/

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
SELECT 'Bananas' AS Item,5 AS Cost
UNION
SELECT 'Apples' AS Item,4 AS Cost
UNION
SELECT 'Cherries' AS Item,3 AS Cost
FOR json PATH


--[{"Item":"Bananas","Cost":5},{"Item":"Apples","Cost":4},{"Item":"Cherries","Cost":3}]

SELECT 'Bananas' AS Item,5 AS Cost
UNION
SELECT 'Apples' AS Item,4 AS Cost
UNION
SELECT 'Cherries' AS Item,3 AS Cost
FOR json PATH,ROOT('Items')

--{"Items":[{"Item":"Bananas","Cost":5},{"Item":"Apples","Cost":4},{"Item":"Cherries","Cost":3}]}


/*CONVERTING SQL SERVER DATA INTO JSON*/