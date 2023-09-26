CREATE TABLE Employee( 
emp_id number(10) PRIMARY KEY, 
f_name varchar(10),
l_name varchar(10),
job_type varchar(10),
salary number(10),
Commission number(10),
dept varchar(10),
manager_id number(10),
doj date);


INSERT INTO Employee VALUES(1,'Arun', 'Khan', 'Manager', 90000, '' ,'Production', '', '04-Jan-1998');
INSERT INTO Employee VALUES(2,'Barun', 'Kumar', 'Manager', 80000, '' ,'Marketing', '', '09-Feb-1998');
INSERT INTO Employee VALUES(3,'Chitra', 'Kapoor', 'Engineer', 60000, '' ,'Production', 1, '08-Jan-1998');
INSERT INTO Employee VALUES(4,'Dheeraj', 'Mishra', 'Manager', 75000, '' ,'Sales', 4, '27-Dec-2001');
INSERT INTO Employee VALUES(5,'Emma', 'Dutt', 'Engineer', 55000, '' ,'Production', 1, '2-Mar-2002');
INSERT INTO Employee VALUES(6,'Floki', 'Dutt', 'Accountant', 70000, '' ,'Accounts', '', '16-Jul-2000');
INSERT INTO Employee VALUES(7,'Dheeraj', 'Kumar', 'Clerk', 40000, '' ,'Accounts', 6, '01-Jul-2016');
INSERT INTO Employee VALUES(8,'Saul', 'Good', 'Engineer', 60000, '' ,'R&D', '', '06-Sep-2014');
INSERT INTO Employee VALUES(9,'Mou', 'Bhat', 'Clerk', 30000, '' ,'Sales', 4, '08-Mar-2018');
INSERT INTO Employee VALUES(10,'Sunny', 'Deol', 'Salesman', 20000, 10000,'Marketing', 2, '31-Mar-2001');
INSERT INTO Employee VALUES(11,'Bobby', 'Deol', 'Engineer', 35000, '' ,'R&D', 8, '17-Oct-2017');
INSERT INTO Employee VALUES(12,'Aamir', 'Khan', 'Salesman', 15000, 5000,'Marketing', 2, '11-Jan-2013');

CREATE TABLE Department( 
d_name varchar(10) PRIMARY KEY, 
d_loc varchar(10),
hod_id int(10));

INSERT into Department VALUES('Sales','Kol', 4);
INSERT into Department VALUES('Accounts','Delhi', 6);
INSERT into Department VALUES('Production','Kol', 1);
INSERT into Department VALUES('Marketing','Kol', 2);
INSERT into Department VALUES('R&D','Mumbai', 8);

create table Job_History (emp_id number(10),
start_date date,
end_date date,
job_type varchar2(20),
d_name varchar2(20));

insert into Job_History values (1, '04-Jun-1998', '30-Jun-2001', 'Engineer', 'Production');
insert into Job_History values (2, '09-Feb-1998', '28-Feb-2002', 'Salesman', 'Sales');
insert into Job_History values (1, '01-Jul-2001', '31-Dec-2010', 'Manager', 'R&D');
insert into Job_History values (4, '27-Dec-2001', '19-Dec-2016', 'Sales_Executive', 'Marketing');
insert into Job_History values (2, '01-Mar-2002', '30-Mar-2015', 'Sales_Executive', 'Marketing');
insert into Job_History values (2, '01-Apr-2016', '15-Dec-2017', 'Manager', 'Sales');
insert into Job_History values (4, '20-Sep-2016', '16-Dec-2017', 'Asst. Manager', 'Sales');
insert into Job_History values (6, '16-Jul-2000', '30-Nov-2006', 'Clerk', 'Accounts');
insert into Job_History values (5, '20-Mar-2002', '12-Aug-2011', 'Engineer', 'R&D');
insert into Job_History values (1, '01-Jan-2011', '31-Jan-2012', 'Engineer', 'Production');