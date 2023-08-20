-- 1. Show f_name, l_name and job_type from employees.

SELECT f_name, l_name, job_type FROM employee;

-- 2. Show employee details in the following fashion:

SELECT CONCAT(f_name, ' is a ', dept) AS Employee_Details FROM employee;

-- 3. Show the monthly salary details in the following fashion

SELECT CONCAT(f_name, '''s monthly salary is Rs ', salary) AS Monthly_Salary_Details FROM employee;

-- 4. Show the different department names from department table.

SELECT d_name FROM department;

-- 5. Show the employee names who works in ‘Sales’.

SELECT f_name FROM employee
WHERE dept = 'Sales';

-- 6. Show the employee names who gets salary of more than 50000 per month.

SELECT f_name FROM employee
WHERE salary > 50000;

-- 7. Show the details of the employee whose manager id is not 1.

SELECT *FROM employee
WHERE manager_id != 1 OR manager_id IS NULL;

-- 8. Show the employee details whose salary ranges between 40000 and 70000.

SELECT *FROM employee
WHERE Salary BETWEEN 40000 AND 70000;

-- 9. Show the details of the employees who works under the manager having id 1, 6 and 8.

SELECT *FROM employee
WHERE manager_id IN (1, 6, 8);

-- 10. Select the f_name and salary of those employees whose last name starts with ‘K’.

SELECT f_name, salary FROM employee
WHERE l_name LIKE 'K%';

-- 11. Select the f_name and salary of those employees whose last name starts with ‘K’ and ends with ‘R’.

SELECT f_name, salary FROM employee
WHERE l_name LIKE 'K%R';

-- 12. Show the details of those employees where 3rd letter of l_name is ‘o’.

SELECT *FROM employee
WHERE l_name LIKE '__o%';

-- 13. Select the details of those employees who works as an engineer with monthly salary more than 50000.

SELECT *FROM employee
WHERE job_type = 'Engineer' AND salary > 50000;

-- 14. Select the employees whose department is ‘Production’ or monthly salary is more than 60000 per month.

SELECT *FROM employee
WHERE dept = 'Production' OR salary > 60000;

-- 15. Find the minimum salary, maximum salary, total salary, average salary of the employees who work in ‘Sales’ department.

SELECT MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary, SUM(salary) AS total_salary, AVG(salary) AS average_salary FROM employee
WHERE dept = 'Sales';
