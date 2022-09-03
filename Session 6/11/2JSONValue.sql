/*JSON_VALUE AND JSON_QUERY*/

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

--json_value        --returns one value
--json_query        --returns an object or an array


SELECT json_query(@json,'$')        --$ means entire object     
/*
--Output
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
*/


SELECT json_query(@json,'$.Shopping')
/*
--Output
{"ShoppingTrip":1,
        "Items":
        [
            {"Item":"Bananas","Cost":5},
            {"Item":"Apples","Cost":4},
            {"Item":"Cherries","Cost":3}
        ]
}
*/


SELECT json_query(@json,'$.Shopping.Items')
/*
--Output
[
    {"Item":"Bananas","Cost":5},
    {"Item":"Apples","Cost":4},
    {"Item":"Cherries","Cost":3}
]
*/

SELECT json_value(@json,'$.name')       --Phillip


SELECT json_value(@json,'strict $.name')        --Instead of NULL it gives a error


SELECT json_value(@json,'strict $.Shopping.ShoppingTrip')       --1


SELECT json_value(@json,'strict $.Shopping.Items')                  --Error because it is an array we need to use json_query
SELECT json_value(@json,'strict $.Shopping.Items[0].Item')          --Bananas
SELECT json_value(@json,'strict $.Shopping.Items[0].Cost')          --5



*/
/*JSON_VALUE AND JSON_QUERY*/