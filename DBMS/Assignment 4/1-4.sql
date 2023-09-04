-- 1. Show the use of upper and lower function.

SELECT UPPER('hello world!'), LOWER('HELLO WORLD!');

-- 2. Show the use of concat, instr and length function

SELECT CONCAT('Hello' , 'world') FROM DUAL;

SELECT INSTR('Hello World', 'r') FROM DUAL;

SELECT LENGTH('Hello world!') FROM DUAL;

-- 3. Show the use of the following functions on numeric values:

-- a. Sqrt()

SELECT sqrt(25) FROM DUAL;

-- b. Power()

SELECT POWER(5,2) FROM DUAL;

-- c. Ceil()

SELECT CEIL(12.534) FROM DUAL;

-- d. Substr()

SELECT SUBSTR('Hellow World', 3, 3) FROM DUAL;

-- e. Max()

SELECT MAX(salary) FROM employee;

-- f. min()

SELECT MIN(salary) FROM employee;

-- g. Round()

SELECT ROUND(24.674) FROM DUAL;

-- h. avg()

SELECT AVG(salary) FROM employee;

-- i. count()

SELECT COUNT(dept) FROM employee;

-- j. Exp()

SELECT EXP(5) FROM DUAL;

-- k. mod()

SELECT MOD(8, 4) FROM DUAL;

-- 4. Solve the following queries

-- a. Find the ceiling and floor value of 14.887.

SELECT CEIL(14.887), FLOOR(14.887) FROM DUAL;

-- b. Find out the round-off 17.49989.

SELECT ROUND(17.49989) FROM DUAL;

-- c. Calculate 8^7.

SELECT POWER(8, 7) FROM DUAL;
