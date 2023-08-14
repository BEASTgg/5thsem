-- 1. Create a table employee with attributes emp_id, f_name, l_name, job_type, salary, dept,commission, manager_id.

CREATE TABLE employee (
    emp_id int(20),
    f_name varchar(50),
    l_name varchar(50),
    job_type varchar(50),
    salary int(20),
    dept varchar(50),
    commission char(20),
    manager_id int(20)
);

-- 2. Make emp_id as the primary key of employee table.

ALTER TABLE employee
ADD CONSTRAINT pk_employees PRIMARY KEY (emp_id);

-- 3. Make f_name and salary NOT NULL type.

ALTER TABLE employee
MODIFY COLUMN f_name varchar(50) NOT NULL,
MODIFY COLUMN salary int(20) NOT NULL;


-- 4. Add a column date_of_joining in the employee table.

ALTER TABLE employee
ADD date_of_joining varchar(25);

-- 5. Create a table department with attribute d_name, d_loc and HOD_id where d_name is primary key.

CREATE TABLE department (
    d_name varchar(50) NOT NULL PRIMARY KEY,
    d_loc varchar(50),
    HOD_id int(20)
);

-- 6. Create a table location with attributes loc_id, city and contact_no.

CREATE TABLE location (
    loc_id int(20) NOT NULL PRIMARY KEY,
    city varchar(50),
    contact_no int(20)
);

-- 7. Enhance the size of the ‘city’ attribute by 5, in the location table.

ALTER TABLE location
MODIFY city VARCHAR(55);

-- 8. Delete the contact_no attribute from the location table.

ALTER TABLE location
DROP COLUMN contact_no;

-- 9. Make the department attribute of the employee table its foreign key referencing the department table.

ALTER TABLE employee
ADD CONSTRAINT FK_employee FOREIGN KEY (dept)
REFERENCES department(d_name);

-- 10. Rename the city attribute to ‘address’ in the location table.

ALTER TABLE location
RENAME COLUMN city TO address;

-- 11. Rename the location table name to ‘loc’.

ALTER TABLE location
RENAME TO loc;

12. Insert the following rows in ‘loc’ table

INSERT INTO loc
VALUES
(1, 'Kolkata'),
(2, 'Mumbai');

-- 13. Truncate the table ‘loc’.

TRUNCATE TABLE loc;

-- 14. Drop the table ‘loc’.

DROP TABLE loc;

-- 15. Insert the following rowsin the department table:

INSERT INTO department
VALUES
('Sales', 'Kol', 4),
('Accounts', 'Delhi', 6),
('Production', 'Kol', 1),
('Marketing', 'Kol', 2),
('R&D', 'Marketing', 8);

-- 16. Insert the following rows in the employee table:

INSERT INTO employee
VALUES
(1,'Arun','Khan','Manager',90000,NULL,'Production',NULL,'04-Jan-1998'),
(2,'Barun','Kumar','Manager',80000,NULL,'Marketing',NULL,'09-Feb-1998'),
(3,'Chitra','Kapoor','Engineer',60000,NULL,'Production',1,'08-Jan-1998'),
(4,'Dheeraj','Mishra','Manager',75000,NULL,'Sales',4,'27-Dec-2001'),
(5,'Emma','Dutt','Engineer',55000,NULL,'Production',1,'20-Mar-2002'),
(6,'Floki','Dutt','Accountant',70000,NULL,'Accounts',NULL,'16-Jul-2000'),
(7,'Dheeraj','Kumar','Clerk',40000,NULL,'Accounts',6,'01-Jul-2016'),
(8,'Saul','Good','Engineer',60000,NULL,'R&D',NULL,'06-Sep-2014'),
(9,'Mou','Bhat','Clerk',30000,NULL,'Sales',4,'08-Mar-2001'),
(10,'Sunny','Deol','Salesman',20000,10000,'Marketing',2,'31-Mar-2001'),
(11,'Bobby','Deol','Engineer',35000,NULL,'R&D',8,'17-Oct-2017'),
(12,'Aamir','Khan','Salesman',15000,5000,'Marketing',2,'11-Jan-2013');
