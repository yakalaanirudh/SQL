/*CASE STATEMENT*/

--CASE end with END
DECLARE @myoption AS VARCHAR(10)='Option B'

SELECT CASE WHEN    @myoption='Option A' THEN 'First Option'
            WHEN    @myoption='Option B' THEN 'Second Option'
            ELSE    'No Option' END AS Myoptions


SELECT CASE @myoption   WHEN 'Option A' THEN 'First Option'
                        WHEN 'Option B' THEN 'First Option'
                        ELSE 'No Option' END AS Myoptions

GO
--The output will be a column named MyOptions
--Make sure the data type after then in each case are of same data type

/*CASE STATEMENT*/