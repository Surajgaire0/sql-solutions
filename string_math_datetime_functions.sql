------------------string functions

Select ASCII('A');
--65

Select CHAR(65);
--A

Select 'Hi'+LTRIM('   Hello   ')+'World';
--HiHello World

Select 'Hi'+TRIM('   Hello   ')+'World';
--HIHelloWorld

Select 'Hi'+RTRIM('   Hello   ')+'World';
--Hi HelloWorld

Select LOWER('Hello world');
--hello world

Select Upper ('Hello world');
--HELLO WORLD

Select REVERSE('Hello World');
--dlroW olleH

Select LEN('Hello');
--5

Select LEFT('Hello',2);
--He

Select RIGHT('Hello',2);
--lo

Select SUBSTRING('Hello world',3,4);
--llo 

Select PATINDEX('%__lo%','Hello world');
--2

Select CHARINDEX('el','hello');
--2

Select REPLICATE('Hello',4);
--HelloHelloHelloHello

Select STUFF('Hello',2,3,'stuff');
--Hstuffo

Select 'Hi'+SPACE(5)+'again';
--Hi     again

Select REPLACE('Hello','l','e');
--Heeeo


----------------datetime functions

Select DAY(GETDATE());

Select MONTH(GETDATE());

Select YEAR('April 23 2011');
--2011

Select DATENAME(month,'April 23 2011');
--April

Select DATEPART(month,'April 23 2011');
--4

Select DATEADD(month,3,'April 23 2011');
--2011-07-23 00:00:00.000

Select DATEDIFF(year,'2017-08-04','2023-08-02');
--6


------------------mathematical functions

Select ABS(-1);
--1

Select CEILING(-1.2);
-- -1

Select FLOOR(-1.4);
-- -2

Select SQUARE(21);
--441

Select SQRT(441);
--21

Select POWER(3,4);
--81

Select RAND();

Select ROUND(112.334,2);
--112.330