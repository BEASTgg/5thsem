-- 1. Create Job_History table and insert the following data.

CREATE TABLE Job_History(
    Emp_id int(2),
    Start_date varchar(25),
    End_date varchar(25),
    Job_type char(25),
    D_name varchar(25)
);

INSERT INTO Job_History
VALUES
(1,'04-Jan-1998','30-Jun-2001','Engineer','Production'),
(2,'09-Feb-1998','28-Feb-2002','Salesman','Sales'),
(1,'01-Jul-2001','31-Dec-2010','Manager','R&D'),
(4,'27-Dec-2001','19-Sep-2016','Sales_Executive','Marketing'),
(2,'01-Mar-2002','30-Mar-2015','Sales_Executive','Marketing'),
(2,'01-Apr-2016','15-Dec-2017','Manager','Sales'),
(4,'20-Sep-2016','16-Dec-2017','ASST Manager','Sales'),
(6,'16-Jul-2000','30-Nov-2006','Clerk','Accounts'),
(5,'20-Mar-2002','12-Aug-2011','Engineer','R&D'),
(1,'01-Jan-2011','31-Jan-2012','Engineer','Production');

-- 2. Display the previous and current job_types of all the employees.

