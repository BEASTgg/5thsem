-- 1. Show the use of upper and lower function.

SELECT UPPER('hello world!'), LOWER('HELLO WORLD!');

-- 2. Show the use of concat, instr and length function

SELECT CONCAT('Hello' , 'world');

SELECT INSTR('Hello World', 'r');

SELECT LENGTH('Hello world!');

-- 3. Show the use of the following functions on numeric values:

-- a. Sqrt()

SELECT sqrt(25);

-- b. Power()

SELECT POWER(5,2);

-- c. Ceil()

SELECT CEIL(12.534);

-- d. Substr()

SELECT SUBSTR('Hellow World', 3, 3);

-- e. Max()

SELECT MAX(salary) FROM employee;

-- f. min()

SELECT MIN(salary) FROM employee;

-- g. Round()

SELECT ROUND(24.674);

-- h. avg()

SELECT AVG(salary) FROM employee;

-- i. count()

SELECT COUNT(dept) FROM employee;

-- j. Exp()

SELECT EXP(5);

-- k. mod()

SELECT MOD(8, 4);

-- 4. Solve the following queries

-- a. Find the ceiling and floor value of 14.887.

SELECT CEIL(14.887), FLOOR(14.887);

-- b. Find out the round-off 17.49989.

SELECT ROUND(17.49989);

-- c. Calculate 8^7.

SELECT POWER(8, 7);