/*FILTERED INDICES*/

--Too many indices causes delay in queries
--If we want index on some rows(or for some condition where) we can use filtered index

CREATE NONCLUSTERED INDEX idx_tblEmployee3 on [dbo].[tblEmployee]([DateOfBirth]) WHERE Manager="SergeyBrin"
--The above is a filtered index

--Advantages of filtered index
    --Improve query performance
    --Reduces maintenance cost
    --Reduces storage cost

/*FILTERED INDICES*/