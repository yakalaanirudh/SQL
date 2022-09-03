/*STRINGS*/


/*-- char - ASCII - 1 byte
-- varchar - ASCII - 1 byte
-- nchar - UNICODE - 2 bytes
-- nvarchar - UNICODE - 2 bytes

-- ASCII: A-Z, a-z, 0-9  
--       65   97   48   32  128 (0-255)

ASCII   -English Aplhabets only
UNICODE -Includes other languages too

char        -works in ASCII range       -1 byte
varchar     -works in ASCII range       -1 byte
nchar       -works in UNICODE range     -2 byte
nvarchar    -works in UNICODE range     -2 byte
*/

--char(10)      /*10 is the maximum number of characters allowed*/
/*varchar takes two extra bytes*/
DECLARE @chrMyCharacters as char(10)
set @chrMyCharacters = 'hello'
SELECT @chrMyCharacters as myString, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as MyDataLength
-- Always prefix nchar and nvarchar values with N (capital N).

/*
String      Length      Datalength(char(10))
Anirudh     7           10
Anu         3           10
asdfghjkla  10          10
''          0           10


String      Length      Datalength(varchar(10))
Anirudh     7           9
Anu         3           5
asdfghjkla  10          12
''          0           2
*/

/*nchar and nvarchar write N before the string
N'hello{symbol}'

char        -number of bytes        =number of characters
varchar     -number of bytes        =number of characters+2
nvarchar    -number of bytes        =(number of characters*2)+2



/*STRINGS*/