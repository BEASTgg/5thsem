-- 17. Show the values of departmental table.

SELECT * FROM department;

-- 18. Select the department names and their locations.

SELECT d_name, d_loc FROM department;

-- 19. Show the employees f_name , l_name , salary and the salary after 1000rs Bonus.

SELECT f_name, l_name, salary, salary + 1000 AS salary_with_bonus FROM employee;

-- 20. Show the employees annual salary with a 1000rs. Yearly bonus and the annual salary with a 100rs Monthly bonus.

SELECT f_name, l_name, salary, (salary * 12) + 1000 AS annual_salary_with_bonus, (salary + 100) * 12 AS annual_salary_with_monthly_bonus FROM employee;

-- 21. Show f_name as NAME and annual salary as ANNSAL from the employee table.

SELECT f_name AS NAME, salary * 12 AS ANNSAL FROM employee;

-- 22. Show the l_name as LasT AND 100rs. Incremented salary as NewSal.

SELECT l_name AS LasT, salary + 100 AS NewSal FROM employee;

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

-- i> Create the above tables by properly specifying the primary keys and the foreign keys

CREATE TABLE person (
    driver_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE car (
    regno VARCHAR(20) PRIMARY KEY,
    model VARCHAR(100),
    year INT
);

CREATE TABLE accident (
    report_number INT PRIMARY KEY,
    date DATE,
    location VARCHAR(200)
);

CREATE TABLE owns (
    driver_id VARCHAR(50),
    regno VARCHAR(20),
    PRIMARY KEY (driver_id, regno),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (regno) REFERENCES car(regno)
);

CREATE TABLE participated (
    driver_id VARCHAR(50),
    regno VARCHAR(20),
    report_number INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, regno, report_number),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (regno) REFERENCES car(regno),
    FOREIGN KEY (report_number) REFERENCES accident(report_number)
);

-- ii> Enter atleast five tuples for each relation

INSERT INTO person
VALUES
('D1', 'John Doe', '123 Main St'),
('D2', 'Saul Goodman', '456 Elm St'),
('D3', 'Walter White', '789 Oak Ave'),
('D4', 'Jesse Pinkman', '101 Maple Rd'),
('D5', 'John Titor', '222 Pine Ln');

INSERT INTO car
VALUES
('ABC123', 'Swift Dzire', 2010),
('DEF456', 'Grand i10', 2006),
('GHI789', 'Ford Mustang', 2008),
('JKL012', 'Alto 800', 2008),
('MNO345', 'Indigo', 2011);

INSERT INTO accident
VALUES
(1, '2011-07-15', 'Intersection A'),
(2, '2006-08-05', 'Highway B'),
(3, '2010-06-20', 'Street C'),
(4, '2007-07-02', 'Road D'),
(5, '2013-08-10', 'Avenue E');

INSERT INTO owns
VALUES
('D1', 'ABC123'),
('D2', 'DEF456'),
('D3', 'GHI789'),
('D4', 'JKL012'),
('D5', 'MNO345');

INSERT INTO participated
VALUES
('D1', 'ABC123', 1, 5000),
('D2', 'DEF456', 2, 8000),
('D3', 'GHI789', 1, 3000),
('D4', 'JKL012', 3, 2000),
('D5', 'MNO345', 4, 6000);

-- iii> Demonstrate how you a. Update the damage amount for the car with a specific regno in accident with report number 12 to 25000 b. Add a new accident to the database

UPDATE participated
SET damage_amount = 25000
WHERE regno = 'ABC123' AND report_number = 12;

INSERT INTO accident (report_number, date, location)
VALUES (6, '2006-09-01', 'Street F');

-- iv> Find the total number of people who owned cars that were involved in accidents in 2006.

SELECT COUNT(DISTINCT P.driver_id) AS total_people FROM PERSON P
JOIN OWNS O ON P.driver_id = O.driver_id
JOIN PARTICIPATED PT ON O.regno = PT.regno
JOIN ACCIDENT A ON PT.report_number = A.report_number
WHERE YEAR(A.date) = 2006;

-- v> Find the number of accidents in which cars belonging to a specific model were involved.

SELECT COUNT(DISTINCT A.report_number) AS total_accidents FROM ACCIDENT A
JOIN PARTICIPATED PT ON A.report_number = PT.report_number
JOIN CAR C ON PT.regno = C.regno
WHERE C.model = 'Ford Mustang';
