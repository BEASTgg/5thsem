-- 16. Find the employee l_name that is first and f_name that is last if they are arranged in an order

SELECT l_name, f_name FROM employee ORDER BY l_name ASC, f_name DESC;

-- 17. Find the number of employees working in each department

SELECT dept, COUNT(*) FROM employee GROUP BY dept;

-- 18. Find the number of departments from employee table

SELECT COUNT(DISTINCT dept) AS number_of_departments FROM employee;

-- 19. Find the average commission of the employees.

SELECT AVG(commission) AS average_commission FROM employee;

-- 20. Find the average salaries of the employees department wise

SELECT DISTINCT dept, AVG(salary) AS average_salary FROM employee GROUP BY dept;

-- 21. Find the sum of salary of different job_type according to different departments

SELECT DISTINCT dept, job_type, SUM(salary) AS total_salary FROM employee GROUP BY dept, job_type;

-- 22. Find the department name and average salaries of those departments whose average salary is greater than 40000

SELECT DISTINCT dept, AVG(salary) AS average_salary FROM employee GROUP BY dept HAVING AVG(salary) > 40000;

-- 23. Find the department name and maximum salaries of those departments whose maximum salary is greater than 55000

SELECT DISTINCT dept, MAX(salary) AS maximum_salary FROM employee GROUP BY dept HAVING MAX(salary) > 55000;

-- 24. Display the job_type and total monthly salary for each job_type where total payroll is exceeding 100000

SELECT DISTINCT job_type, SUM(salary) AS Total_salary FROM employee GROUP BY job_type HAVING SUM(salary) > 100000;

-- 25. Display the name of the department having maximum average salary.

SELECT dept FROM employee GROUP BY dept
HAVING AVG(salary) = (SELECT AVG(salary) FROM employee
GROUP BY dept ORDER BY AVG(salary) DESC
LIMIT 1);
