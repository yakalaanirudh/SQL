/*JSON_MODIFY*/

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
/*
json_modify
--It takes 3 parameters
1) variable
2)What to modify
3)new value
*/
SELECT json_modify(@json,'strict $.Shopping.Items[0].Item','Big Bananas')
/*
--Output
{
    "name":"Phillip",
    "Shopping:
        {"ShoppingTrip":1,
        "Items":
        [
            {"Item":"Big Bananas","Cost":5},
            {"Item":"Apples","Cost":4},
            {"Item":"Cherries","Cost":3}
        ]
        }
}
'
*/



SELECT json_modify(@json,'strict $.Shopping.Items[0]','{"Item":"Big Bananas","Cost":7}')    --It wont work properly
SELECT json_modify(@json,'strict $.Shopping.Items[0]',json_query('{"Item":"Big Bananas","Cost":7}'))    --This works
/*
--Output
{
    "name":"Phillip",
    "Shopping:
        {"ShoppingTrip":1,
        "Items":
        [
            {"Item":"Big Bananas","Cost":7},
            {"Item":"Apples","Cost":4},
            {"Item":"Cherries","Cost":3}
        ]
        }
}
'
*/

--To add a property     
SELECT json_modify(@json,'strict $.Date','2022-01-01')      --fails
--remove strict
SELECT json_modify(@json,'$.Date','2022-01-01')             --works

/*JSON_MODIFY*/