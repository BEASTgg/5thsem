-- 5. Show the current date.

SELECT DATE_FORMAT(NOW(), '%Y/%d/%m') AS Todays_Date;

-> use 'SYSDATE' instead of 'NOW()' if u are doing it in oracle !

-- 6. Find the total experience of the employees in weeks who works in Sales department.

SELECT f_name , l_name , ROUND(DATEDIFF(NOW(), date_of_joining) / 7) AS Experience_in_weeks FROM employee
WHERE dept = 'Sales';

-> FOR ORACLE SQL use 

SELECT f_name, l_name, ROUND(MONTHS_BETWEEN(SYSDATE, date_of_joining) / 7) AS total_experience_in_weeks FROM employee
WHERE dept = 'Sales';


-- From this point Onwards nothing will work in MYSQL and can only be done in ORACLE --


-- 7. Display the use of the following functions on date

-- a. Months_between

SELECT MONTHS_BETWEEN(TO_DATE('2023-12-25', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD')) AS months_between FROM DUAL;

-- b. Add_months

SELECT ADD_MONTHS(TO_DATE('2023-01-25', 'YYYY-MM-DD'), 6) AS add_months FROM DUAL;

-- c. Next_day

SELECT NEXT_DAY(TO_DATE('2023-01-25', 'YYYY-MM-DD'), 'TUESDAY') AS next_day FROM DUAL;

-- d. Last_day

SELECT LAST_DAY(TO_DATE('2023-01-25', 'YYYY-MM-DD')) AS last_day FROM DUAL;

-- e. Round

SELECT ROUND(TO_DATE('2023-01-25 5:36:55', 'YYYY-MM-DD HH:MI:SS'), 'HH') AS round_time FROM DUAL;

-- f. Trunc

SELECT TRUNC(TO_DATE('2023-01-25 5:36:55', 'YYYY-MM-DD HH:MI:SS'), 'MM') AS trunc_date FROM DUAL;

-- g. To_char

SELECT TO_CHAR(TO_DATE('2023-01-25', 'YYYY-MM-DD'), 'Month DD - YYYY') AS to_char FROM DUAL;



-- From this point Onwards it will work in MYSQL too --



-- 8. Show the employee details with a revised salary. The salary is incremented in the following way:

-- a. 10% for sales department

SELECT emp_id, f_name, l_name, job_type, (salary + (salary * 0.1)) AS revised_salary, commission, dept, manager_id, date_of_joining FROM employee
WHERE dept = 'Sales';

-- b. 20% for marketing department

SELECT emp_id, f_name, l_name, job_type, (salary + (salary * 0.2)) AS revised_salary, commission, dept, manager_id, date_of_joining FROM employee
WHERE dept = 'Marketing';

-- c. No increment for others

SELECT *FROM employee
WHERE dept != 'Sales' AND dept != 'Marketing';

-- 9. Determine the tax for each employee in production department based on the monthly salary. The tax rate are as per the following data:

SELECT emp_id, f_name, salary, dept,
    CASE 
        WHEN salary BETWEEN 0 AND 19999 THEN 0
        WHEN salary BETWEEN 20000 AND 39999 THEN salary * 0.09
        WHEN salary BETWEEN 40000 AND 59999 THEN salary * 0.2
        WHEN salary BETWEEN 60000 AND 79999 THEN salary * 0.3
        ELSE salary * 0.45
    END AS tax
FROM employee WHERE dept = 'Production';

-- 10. Find the Cartesian product between Employee and Department table.

SELECT *FROM Employee
CROSS JOIN Department;

-- 11. Show the employee names and the respective department location.

SELECT employee.f_name, employee.l_name, department.d_loc FROM employee
JOIN department ON employee.dept = department.d_name;

-- 12. Give an example of the following joins considering employee and department tables.

--k. Natural join

SELECT *FROM employee
NATURAL JOIN department ON employee.dept = department.d_name;

-- l. Inner join

SELECT *FROM employee
INNER JOIN department ON employee.dept = department.d_name;

-- m. Left outer join

SELECT *FROM employee
LEFT OUTER JOIN department ON employee.dept = department.d_name;

-- n. Right outer join

SELECT *FROM employee
RIGHT OUTER JOIN department ON employee.dept = department.d_name;

-- o. Full outer join

SELECT *FROM employee
FULL OUTER JOIN department ON employee.dept = department.d_name;

-- 13. Write a query to find the address.

SELECT locations.location_id, locations.street_address, locations.city, locations.state_province, countries.country_name FROM locations
NATURAL JOIN contries ON locations.country_id = contries.country_id;

-- 14. Write a query to find the name.   -> incomplete QS

SELECT employees.first_name, employees.last_name, departments.department_id FROM employees
JOIN departments ON employees.employee_id = departments.deparment_id;
