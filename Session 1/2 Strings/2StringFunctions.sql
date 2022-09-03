/*STRING FUNCTIONS*/


DECLARE @chrASCII as varchar(10) = 'hellothere'
DECLARE @chrUNICODE as nvarchar(10) = N'helloϞ'

select left(@chrASCII,2) as myASCII, right(@chrUNICODE,2) as myUNICODE      /*  'he'       'oϞ' */
select substring(@chrASCII,3,2) as middleletters                            /*  'll'    */
select ltrim(rtrim(@chrASCII)) as myTRIM
select replace(@chrASCII,'l','L') as myReplace                              /*    'heLLoϞ'  */
select upper(@chrASCII) as myUPPER                                          /*    HELLOTHERE  */
select lower(@chrASCII) as myLOWER                                          /*    hellothere  */


/*There is no trim function in sql so we have to ltrim from left and rtrim from right



/*STRING FUNCTIONS*/