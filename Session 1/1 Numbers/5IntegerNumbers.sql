/*INTEGER NUMBERS*/


/*INTEGER TYPES*/
/*
Data type	    Range	                                                                    Storage
bigint          -2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)	8 Bytes
int             -2^31 (-2,147,483,648) to 2^31-1 (2,147,483,647)	                        4 Bytes
smallint        -2^15 (-32,768) to 2^15-1 (32,767)	                                        2 Bytes
tinyint         -0 to 255	                                                                1 Byte
*/
/*INTEGER TYPES*/
--We can use like DECLARE @myvar AS tinyint=2


/*INTEGER NUMBERS*/





/*NON-INTEGER NUMBERS*/

/*NUMERIC AND DECIMAL*/
/*
NUMERIC and DECIMAL are one and the same
DECIMAL[(p[s])] NUMERIC[(p[s])] 
p   -Precision  -The total number of digits in the number
s   -The number of digits to the right of the decimal point

DECALRE @myvar AS numeric(7,2)=31252.65
/*NUMERIC AND DECIMAL*/


/*MONEY AND SMALL MONEY*/
/*Money and small money are used for monetary data and are accurate to ten-thousandtg of the monetary units they represent

money	
    -922,337,203,685,477.5808 to 922,337,203,685,477.5807 (-922,337,203,685,477.58
    to 922,337,203,685,477.58 for Informatica. Informatica only supports two decimals, not four.)	
    8 bytes


smallmoney	- 214,748.3648 to 214,748.3647	4 bytes
/*MONEY AND SMALL MONEY*/


/*FLOAT AND REAL*/

/*
float [ (n) ] Where n is the number of bits that are used to store the mantissa of the float number in scientific notation 
and, therefore, dictates the precision and storage size. If n is specified, it must be a value between 1 and 53. 
The default value of n is 53.

n value	    Precision	Storage size
1-24	    7 digits	4 bytes
25-53	    15 digits	8 bytes
*/


/*
Approximate-number data types for use with floating point numeric data. 
Floating point data is approximate; therefore, not all values in the data type range can be represented exactly. 
The ISO synonym for real is float(24).
*/


/*
Data type	Range	                                                        Storage
float	-   1.79E+308 to -2.23E-308, 0 and 2.23E-308 to 1.79E+308	        Depends on the value of n
real	-   3.40E + 38 to -1.18E - 38, 0 and 1.18E - 38 to 3.40E + 38	    4 Bytes
*/



/*FLOAT AND REAL*/




/*NON-INTEGER NUMBERS*/