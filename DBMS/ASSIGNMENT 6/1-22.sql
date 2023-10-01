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

SELECT * FROM worker
LEFT JOIN bonus ON worker.worker_id = bonus.worker_ref_id
WHERE bonus.worker_ref_id IS NULL;

-- 14. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.

SELECT *FROM Worker    -- For MYSQL
LIMIT 10;

SELECT TOP 10 *FROM Worker;    -- For ORACLE

-- 15. Write An SQL Query To Fetch The List Of Employees With The Same Salary.

SELECT first_name,salary FROM worker 
WHERE Salary IN (SELECT Salary FROM worker GROUP BY Salary HAVING COUNT(*) > 1);

-- 16. Write An SQL Query To Show All Departments Along With The Number Of People Working There.

SELECT DEPARTMENT, COUNT(*) AS NO_OF_EMPLOYEE FROM Worker GROUP BY DEPARTMENT;

-- 17. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.

SELECT department, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS EmployeeName, MAX(SALARY) FROM Worker GROUP BY department;    -- Giving error!

-- 18. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.

SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- 19. Consider the following relations for an order processing database application in a company.

-- i) Create the above tables by properly specifying the primary keys and the foreign keys.

CREATE TABLE CUSTOMER(
  Cust int(25) NOT NULL PRIMARY KEY,
  Cname char(25),
  City char(25)
);

CREATE TABLE ORDERR(
  Orderr int(25) NOT NULL PRIMARY KEY,
  Odate date,
  Cust int(25),
  Ord_Amt int(25),
  FOREIGN KEY (Cust) REFERENCES CUSTOMER(Cust)
);

CREATE TABLE ORDERR_ITEM(
  Orderr int(25) NOT NULL PRIMARY KEY,
  Item int(25),
  qty int(25)
);

CREATE TABLE ITEM(
  Item int(25),
  Unit_Price int(25)
);

CREATE TABLE SHIPMENT(
  Orderr int(25),
  Warehouse int(25) NOT NULL PRIMARY KEY,
  Ship_Date date
);

CREATE TABLE WAREHOUSE(
  Warehouse int(25),
  City char(25),
  FOREIGN KEY (Warehouse) REFERENCES SHIPMENT(Warehouse)
);

-- ii) Enter at least five tuples for each relation.

INSERT INTO CUSTOMER
VALUES
(234, 'Jake', 'Kolkata'),
(345, 'Paul', 'Varanashi'),
(626, 'Robie', 'Noida'),
(328, 'Mischel', 'Delhi'),
(457, 'Marie', 'Jadavpur');

INSERT INTO ORDERR
VALUES
(100, '2023-06-13', 234, 5600),
(101, '2023-01-04', 345, 45673),
(102, '2023-02-24', 626, 9564),
(103, '2023-05-27', 328, 3563),
(104, '2023-07-09', 457, 8543);

INSERT INTO ORDERR_ITEM
VALUES
(100, 10, 12),
(101, 11, 34),
(102, 12, 56),
(103, 13, 76),
(104, 14, 36);

INSERT INTO ITEM
VALUES
(10, 25000),
(11, 45000),
(12, 35000),
(13, 15000),
(14, 75000);

INSERT INTO SHIPMENT
VALUES
(100, 3546, '2023-01-16'),
(101, 7546, '2023-04-02'),
(102, 2453, '2023-01-20'),
(103, 6432, '2023-06-11'),
(104, 2423, '2023-07-09');

INSERT INTO WAREHOUSE
VALUES
(3546, 'kolkata'),
(7546, 'Varanashi'),
(2453, 'Noida'),
(6432, 'Delhi'),
(2423, 'Jadavpur');

-- iii) Produce a listing: CUSTNAME, NO_OF_ORDERS, AVG_ORDER_AMT, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer

SELECT CUSTOMER.Cname AS CUSTNAME, COUNT(ORDERR.Orderr) AS NO_OF_ORDERS, AVG(ORDERR.Ord_Amt) AS AVG_ORDER_AMT FROM ORDERR
JOIN CUSTOMER ON CUSTOMER.Cust = ORDERR.Cust
GROUP BY CUSTNAME;

-- iv) List the Order# for the orders that were shipped from all the warehouses that the company has in a specific city

SELECT Orderr AS Order_id FROM SHIPMENT
JOIN Warehouse ON WAREHOUSE.Warehouse = SHIPMENT.Warehouse
WHERE City = 'Kolkata';

-- v) Demonstrate how you delete Item# 10 from the ITEM table and make that field null in the ORDER- ITEM table.

DELETE FROM ITEM WHERE Item = 10;
UPDATE ORDERR_ITEM SET Item = NULL WHERE Item = 10;

-- 20. Create a table Emp(e_no, e_name, e_phone, e_addr,e_salary) to store records of 10 employees:

-- i) Alter the data type of e_no from number to varchar

ALTER TABLE Emp
MODIFY e_no VARCHAR(50); 

-- ii) Alter table by setting e_no as primary key

ALTER TABLE Emp
ADD CONSTRAINT PK PRIMARY KEY (e_no);

-- iii) Alter table by adding a column e_pin

ALTER TABLE Emp
ADD e_pin VARCHAR(25);

-- iv) Update the phone number of an employee in the table

UPDATE Emp
SET e_phone = '8648798872'
WHERE e_no = '100';


-- 21. Create a table Dept(dept_no, dept_name,e_no, dept_loc,dept_hod) to store records of 10 departments:

-- i) Create the reference between Emp and Dept table with e_no attribute.

CREATE TABLE Dept(
    dept_no int(25) NOT NULL PRIMARY KEY,
    dept_name varchar(25),
    e_no int(25),
    dept_loc char(25),
    dept_hod char(25)
);

CREATE TABLE Emp(
    e_no int(25),
    e_name varchar(25),
    e_phone int(25),
    e_addr varchar(25),
    e_salary int(25),
    FOREIGN KEY (e_no) REFERENCES Dept(e_no)
);

-- ii) Assign dept_no as primary key.

ALTER TABLE Dept
ADD CONSTRAINT PK PRIMARY KEY (dept_no);

-- iii) Update the dept_hod for one department.

UPDATE Emp
SET dept_hod = 'Ameer'
WHERE dept_no = '100';

-- iv) Delete one department

DELETE FROM Dept
WHERE dept_no = '110';

-- 22. Solve the following queries

-- i) Write a query to find the employee name and dept_hod whose dept_hod is SAY, “John”.

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS EmployeeName, dept_hod FROM employee
WHERE dept_hod = 'John';

-- ii) Write a query to find the average salary of the employee of CSE department.

SELECT AVG(salary) AS Average_Salary FROM employee
WHERE dept = 'CSE';
