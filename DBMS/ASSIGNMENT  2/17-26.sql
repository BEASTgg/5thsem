-- 17. Show the values of departmental table.

SELECT * FROM department;

-- 18. Select the department names and their locations.

SELECT d_name, d_loc FROM department;

-- 19. Show the employees f_name , l_name , salary and the salary after 1000rs Bonus.

SELECT f_name, l_name, salary, salary + 1000 AS salary_with_bonus FROM employee;

-- 20. Show the employees annual salary with a 1000rs. Yearly bonus and the annual salary with a 100rs Monthly bonus.

SELECT f_name, l_name, salary, salary + 1000 AS annual_salary_with_bonus, salary + (100 * 12) AS annual_salary_with_monthly_bonus FROM employee;

-- 21. Show f_name as NAME and annual salary as ANNSAL from the employee table.

SELECT f_name as NAME, salary * 12 AS ANNSAL FROM employee;

-- 22. Show the l_name as LasT AND 100rs. Incremented salary as NewSal.

SELECT l_name as LasT, salary + 100 AS NewSal FROM employee;

-- 23. Show the emp_id, f_name, l_name, job_type of the employee getting highest salary.

SELECT emp_id, f_name, l_name, job_type FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- 24. Show the emp_id, f_name, l_name, job_type of the employee getting minimum salary.

SELECT emp_id, f_name, l_name, job_type FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 25. Show the average salary of employees in the employee table.

SELECT AVG(salary) AS average_salary FROM employee;

-- 26. Consider the Insurance database given below. The primary keys are underlined and the data types are specified:

-- PERSON (driver-id: string, name: string, address: string)
-- CAR (Regno:string,model:string,year:int)
-- ACCIDENT (report-number:int,date:date,location:string)
-- OWNS (driver-id:string,regno:string)
-- PARTICIPATED (driver-id:string,regno:string,report-number:int,damage-amount:int)

-- i. Create the above tables by properly specifying the primary keys and the foreign keys.

CREATE TABLE person (
    driver_id char(20) NOT NULL PRIMARY KEY,
    name char(20),
    address char(20)
);

CREATE TABLE car (
    regno char(20) NOT NULL PRIMARY KEY,
    name char(20),
    year int(20)
);

CREATE TABLE accident (
    report_number int(20) NOT NULL PRIMARY KEY,
    date date,
    location char(20)
);

CREATE TABLE owns (
    driver_id char(20) NOT NULL PRIMARY KEY,
    regno char(20)
);

CREATE TABLE participated (
    driver_id char(20) NOT NULL PRIMARY KEY,
    regno char(20),
    report_number int(20),
    damage_amount int(20)
);

-- ii. Enter atleast five tuples for each relation.

INSERT INTO person
VALUES
('ABUDHS', 'Alex Miller', '45 Hinjewadi Road'),
('SURHWD', 'Ryan White', '20 Maya Villas Virar'),
('WADAFE', 'Ralf Falder', '82, Jayshree Heights, Borivali'),
('GEQAES', 'Eugene Hall', '77, Ishat Villas, NeerendraGarh'),
('WDFAFG', 'Gini Wick', '91, Binoya Society, Hinjewadi');

INSERT INTO car
VALUES
('EBIAYHQLML', 'Alex Miller', 2003),
('MOFDSVAHOG', 'Ryan White', 2001),
('KOTDUVAHBJ', 'Ralf Falder', 1998),
('HHVWZWAHYA', 'Eugene Hall',  2002),
('HGLMGALRKX', 'Gini Wick', 1999);

INSERT INTO accident
VALUES
(24, '2023-01-15', 'Aurangabad'),
(12, '2023-03-15', 'Bhubaneswar'),
(36, '2023-06-07', 'Faridabad'),
(74, '2023-03-15',  'New Delhi'),
(22, '2023-05-30', 'Jalandhar');

INSERT INTO owns
VALUES
('ABUDHS', 'EBIAYHQLML'),
('SURHWD', 'MOFDSVAHOG'),
('WADAFE', 'KOTDUVAHBJ'),
('GEQAES', 'HHVWZWAHYA'),
('WDFAFG', 'HGLMGALRKX');

INSERT INTO participated
VALUES
('ABUDHS', 'EBIAYHQLML' ,24 ,45000),
('SURHWD', 'MOFDSVAHOG' ,12 ,15000),
('WADAFE', 'KOTDUVAHBJ' ,36 ,24000),
('GEQAES', 'HHVWZWAHYA' ,74 ,65000),
('WDFAFG', 'HGLMGALRKX' ,22 ,95000);

-- iii. Demonstrate how you a. Update the damage amount for the car with a specific regno in accident with report number 12 to 25000 b. Add a new accident to the database

UPDATE 
