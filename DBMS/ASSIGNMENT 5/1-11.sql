-- 1. Find the Cartesian product between Employee and Department table.

SELECT *FROM Employee
CROSS JOIN Department;

-- 2. Show the employee names and the respective department location.

SELECT employee.f_name, employee.l_name, department.d_loc FROM employee
JOIN department ON employee.dept = department.d_name;

-- 3. Find the employee name and date of joining who are working in Delhi.

SELECT employee.f_name, employee.l_name, employee.date_of_joining FROM employee
JOIN department ON employee.dept = department.d_name
WHERE department.d_loc = 'Delhi';

-- 4. Create a table ‘Emp_Address’ for storing the permanent address of the employees and insert the following values:

CREATE TABLE Emp_Address(
    Emp_id int(20),
    City varchar(20),
    District varchar(20),
    State varchar(20)
);

INSERT INTO Emp_Address
VALUES
(1,'Suri','Birbhum','WB'),
(2,'Kolkata','Kolkata','WB'),
(3,'Bhubaneswar','Khurda','Odisha'),
(4,'Durgapur','Burdwan','WB'),
(5,'Noida','GB Nagar','UP'),
(6,'Secunderabad','Hyderabad','Telangana'),
(7,'Derhadun','Dehradun','Uttarakhand'),
(8,'Asansol','Burdwan','WB'),
(9,'Siliguri','Darjeeling','WB'),
(10,'Kolkata','Kolkata','WB'),
(11,'Jalpaiguri','Jalpaiguri','WB'),
(12,'New Delhi','New Delhi','Delhi');

-- 5. Display the name of employees, department location and the city name the employee belongs to, from the Employee, Department and Emp_Address tables.

SELECT employee.f_name, employee.l_name, department.d_loc, Emp_Address.City FROM employee
JOIN department ON employee.dept = department.d_name
JOIN Emp_Address ON Emp_Address.Emp_id = employee.emp_id;

-- 6. Find the name of each department’s manager.

SELECT f_name, l_name, dept FROM employee
WHERE job_type = 'Manager'; 

-- 7. Create ‘Job_Grades’ table and insert the following values:

CREATE TABLE Job_Grades(
    GRADE char(10),
    LOWEST_SAL int(10),
    HIGHEST_SAL int(30)
);

INSERT INTO Job_Grades
VALUES
('A',10000,24999),
('B',25000,49999),
('C',50000,100000);

-- 8. Display the employee names with their respective job grades and salary.

SELECT f_name, salary,
    CASE 
        WHEN salary BETWEEN 10000 AND 24999 THEN 'A'
        WHEN salary BETWEEN 25000 AND 49999 THEN 'B'
        WHEN salary BETWEEN 50000 AND 100000 THEN 'C'
    END AS Job_Grades
FROM employee;

-- 9. Insert two rows in Employee table having ‘NULL’ values in dept field.

INSERT INTO employee
VALUES
(13,'Raj','Chatterjee','Mechanic',20000,5000,NULL,3,'08-Dec-2005'),
(14,'Rahul','Khan','Electrician',40000,2000,NULL,5,'12-Aug-1984');

-- 10. Insert two rows in Department table.

INSERT INTO department
VALUES
('Mechanic', 'Kol', 3),
('Electric', 'Delhi', 5);

-- 11. Perform the following joins considering Employee and Department tables.

-- a. Natural join

SELECT *FROM employee
NATURAL JOIN department;

-- b. Inner join

SELECT *FROM employee
INNER JOIN department ON employee.dept = department.d_name;

-- c. Left outer join

SELECT *FROM employee
LEFT OUTER JOIN department ON employee.dept = department.d_name;

-- d. Right outer join

SELECT *FROM employee
RIGHT OUTER JOIN department ON employee.dept = department.d_name;

-- e. Full outer join

-- FOR MYSQL -

SELECT *FROM employee
LEFT OUTER JOIN department ON employee.dept = department.d_name
UNION
SELECT *FROM employee
RIGHT OUTER JOIN department ON employee.dept = department.d_name;

-- FOR ORACLE SQL -

SELECT *FROM employee
FULL OUTER JOIN department ON employee.dept = department.d_name;
