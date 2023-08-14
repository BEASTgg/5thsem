-- 5. Write a query to create a table employee with empno, ename, designation and salary.

CREATE TABLE employee (
    empno int primary key,
    ename varchar(20) NOT NULL,
    designation varchar(20) NOT NULL,
    salary int(20) NOT NULL);

-- 6. Write a query to display the column name and data type of the table employee

desc employee;

-- 7. Write a query to create a table from an existing table with all the fields.

CREATE TABLE employee2 AS 
SELECT * FROM employee;

-- 8. Write a query to create table from an existing table with selected fields.

CREATE TABLE employee3 AS 
SELECT ename, designation FROM employee;

-- 9. Write a query to create a new table from an existing table without any record.

CREATE TABLE employee4 AS
SELECT * FROM employee WHERE 1=0;

-- 10. Write a query to Alter the column empno number(4) to empno number(6).

ALTER TABLE employee
MODIFY empno varchar(6);

-- 11. Write a query to Alter the table employee with multiple columns (empno, ename).

ALTER TABLE employee
MODIFY {empno int(10),
        ename varchar(50)};

-- 12. Write a query to add a new column in employee table.

ALTER TABLE employee
ADD DOJ date;

-- 13. Write a query to add multiple columns in employee table.

ALTER TABLE employee
ADD (
    Qualification varchar(20),
    DOB date
);

-- 14. Write a query to drop a column from an existing table employee.

ALTER TABLE employee
DROP COLUMN DOJ;

-- 15. Write a query to drop multiple columns from the employee table.

ALTER TABLE employee
DROP COLUMN Qualification, 
DROP COLUMN DOB;

-- 16. Write a query to rename table employee to emp

ALTER TABLE employee
RENAME TO tableEmployee;

