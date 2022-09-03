/*CREATING JSON AND ISJSON*/

DECLARE @json nvarchar(4000)
SET @json='
{
    "name":"Phillip",
    "ShoppingTrip":1
}
'

SELECT @json        --{"name":"Phillip","ShoppingTrip":1}


SEELCT isjson(@json)        --It tells if the variable is a json or not --It returns 1 or 0


SET @json='
{
    "name":"Phillip",
    "Shopping:
        {"ShoppingTrip":1,
        "Items":
        {"Item":"Bananas","Cost":5},
        {"Item":"Apples","Cost":4}
        }
}
'
--The above is not a Json because a value cant have multiple objects,we need to place them in an array


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



/*CREATING JSON AND ISJSON*/