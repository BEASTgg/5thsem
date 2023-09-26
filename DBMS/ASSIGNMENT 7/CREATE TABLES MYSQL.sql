CREATE TABLE Employee( 
    Emp_id int(10) PRIMARY KEY, 
    F_name varchar(10),
    L_name varchar(10),
    Job_type varchar(10),
    Salary int(10),
    Commission int(10),
    Dept int(10),
    Manager_id int(10),
    DOJ varchar(25)
);


INSERT INTO Employee
VALUES
(1,'Arun', 'Khan', 'Manager', 90000, NULL ,'Production', '', '04-Jan-1998'),
(2,'Barun', 'Kumar', 'Manager', 80000, NULL ,'Marketing', '', '09-Feb-1998'),
(3,'Chitra', 'Kapoor', 'Engineer', 60000, NULL ,'Production', 1, '08-Jan-1998'),
(4,'Dheeraj', 'Mishra', 'Manager', 75000, NULL ,'Sales', 4, '27-Dec-2001'),
(5,'Emma', 'Dutt', 'Engineer', 55000, NULL ,'Production', 1, '2-Mar-2002'),
(6,'Floki', 'Dutt', 'Accountant', 70000, NULL ,'Accounts', '', '16-Jul-2000'),
(7,'Dheeraj', 'Kumar', 'Clerk', 40000, NULL ,'Accounts', 6, '01-Jul-2016'),
(8,'Saul', 'Good', 'Engineer', 60000, NULL ,'R&D', '', '06-Sep-2014'),
(9,'Mou', 'Bhat', 'Clerk', 30000, NULL ,'Sales', 4, '08-Mar-2018'),
(10,'Sunny', 'Deol', 'Salesman', 20000, 10000,'Marketing', 2, '31-Mar-2001'),
(11,'Bobby', 'Deol', 'Engineer', 35000, '' ,'R&D', 8, '17-Oct-2017'),
(12,'Aamir', 'Khan', 'Salesman', 15000, 5000,'Marketing', 2, '11-Jan-2013');

CREATE TABLE Department( 
    D_name varchar(10) PRIMARY KEY, 
    D_loc varchar(10),
    Hod_id int(10)
);

INSERT into Department
VALUES
('Sales','Kol', 4),
('Accounts','Delhi', 6),
('Production','Kol', 1),
('Marketing','Kol', 2),
('R&D','Mumbai', 8);

CREATE TABLE Job_History (
    Emp_id int(10),
    Start_date varchar(25),
    End_date varchar(25),
    Job_type varchar(20),
    D_name varchar(20)
);

INSERT INTO Job_History
VALUES
(1, '04-Jun-1998', '30-Jun-2001', 'Engineer', 'Production'),
(2, '09-Feb-1998', '28-Feb-2002', 'Salesman', 'Sales'),
(1, '01-Jul-2001', '31-Dec-2010', 'Manager', 'R&D'),
(4, '27-Dec-2001', '19-Dec-2016', 'Sales_Executive', 'Marketing'),
(2, '01-Mar-2002', '30-Mar-2015', 'Sales_Executive', 'Marketing'),
(2, '01-Apr-2016', '15-Dec-2017', 'Manager', 'Sales'),
(4, '20-Sep-2016', '16-Dec-2017', 'Asst. Manager', 'Sales'),
(6, '16-Jul-2000', '30-Nov-2006', 'Clerk', 'Accounts'),
(5, '20-Mar-2002', '12-Aug-2011', 'Engineer', 'R&D'),
(1, '01-Jan-2011', '31-Jan-2012', 'Engineer', 'Production');
