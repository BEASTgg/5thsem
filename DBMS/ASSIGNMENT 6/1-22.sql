-- 1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case alias as WORKER_FIRSTNAME.

SELECT UPPER(FIRST_NAME) AS WORKER_FIRSTNAME FROM Worker;

-- 2. Write An SQL Query To Print The First Three Characters Of FIRST_NAME From Worker Table.

SELECT SUBSTRING(FIRST_NAME, 1, 3) AS First3 FROM Worker;

-- 3. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.

SELECT INSTR(FIRST_NAME, 'A') AS Position_of_A FROM Worker
WHERE FIRST_NAME = 'Amitabh';

-- 4. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Worker;

-- 5. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.

SELECT *FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- 6. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.

SELECT *FROM Worker
WHERE FIRST_NAME LIKE '%A%';

-- 7. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.

SELECT *FROM Worker
WHERE FIRST_NAME LIKE '%A';

-- 8. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.

SELECT *FROM Worker
WHERE SALARY BETWEEN 100000 AND 500000;

-- 9. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.

SELECT COUNT(FIRST_NAME) AS NO_OF_EMPLOYEE, DEPARTMENT FROM Worker
WHERE DEPARTMENT = 'Admin'
GROUP BY DEPARTMENT;

-- 10. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.

SELECT COUNT(*) AS NO_OF_EMPLOYEE, DEPARTMENT FROM Worker
GROUP BY DEPARTMENT
ORDER BY NO_OF_EMPLOYEE DESC;

-- 11. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.

SELECT Worker.* FROM Worker
JOIN Title ON Title.WORKER_REF_ID = Worker.WORKER_ID
WHERE Title.WORKER_TITLE = 'Manager';

-- 12. Write An SQL Query To Show Only Odd Rows From A Table.

SELECT *FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS row_num FROM Worker) AS numbered_rows
WHERE row_num % 2 != 0;

-- 13. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.



-- 14. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.

SELECT *FROM Worker    -- For MYSQL
LIMIT 10;

SELECT TOP 10 *FROM Worker;    -- For ORACLE

-- 15. Write An SQL Query To Fetch The List Of Employees With The Same Salary.



-- 16. Write An SQL Query To Show All Departments Along With The Number Of People Working There.

SELECT DEPARTMENT, COUNT(*) AS NO_OF_EMPLOYEE FROM Worker GROUP BY DEPARTMENT;

-- 17. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.

SELECT FIRST_NAME FROM Worker GROUP BY DEPARTMENT
WHERE SALARY = (SELECT MAX(SALARY) FROM Worker GROUP BY DEPARTMENT);

-- 18. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.



-- 19. Consider the following relations for an order processing database application in a company.

-- i) Create the above tables by properly specifying the primary keys and the foreign keys.



-- ii) Enter at least five tuples for each relation.



-- iii) Produce a listing: CUSTNAME, NO_OF_ORDERS, AVG_ORDER_AMT, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer



-- iv) List the Order# for the ordersthat were shipped from all the warehouses that the company has in a specific city



-- v) Demonstrate how you delete Item# 10 from the ITEM table and make that field null in the ORDER- ITEM table.

-- 20. Create a table Emp(e_no, e_name, e_phone, e_addr,e_salary) to store records of 10 employees:

-- i) Alter the data type of e_no from number to varchar



-- ii) Alter table by setting e_no as primary key



-- iii) Alter table by adding a column e_pin



-- iv) Update the phone number of an employee in the table

-- 21. Create a table Dept(dept_no, dept_name,e_no, dept_loc,dept_hod) to store records of 10 departments:

-- i) Create the reference between Emp and Dept table with e_no attribute.



-- ii) Assign dept_no as primary key.



-- iii) Update the dept_hod for one department.



-- iv) Delete one department