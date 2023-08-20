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
