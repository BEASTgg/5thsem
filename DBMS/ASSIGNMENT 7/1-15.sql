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

SELECT employee.F_name, employee.job_type AS PrevJob, Job_History.job_type CurrJob FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id;

-- 3. Display the previous and current department and job_types of all the employees.

SELECT employee.F_name, employee.dept AS PrevDept, Job_History.D_name AS CurrDept, Job_History.job_type FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id;

-- 4. Display the employee id and job_types of the employees who currently have a job title that they held previously.

SELECT employee.Emp_id, Job_history.job_type FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id
WHERE employee.job_type = Job_History.job_type;

-- 5. Find the name of those employees who have not changed their jobs once.

SELECT CONCAT(employee.F_name, ' ' , employee.L_name) AS NameOfEmployee FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id
WHERE employee.job_type = Job_History.job_type;

-- 6. Find the names of the employees who earn more than Chitra.

SELECT CONCAT(F_name, ' ', L_name) AS NameOfEmployee FROM employee
WHERE salary > (SELECT salary FROM employee WHERE F_name = 'Chitra');

-- 7. Find the details of those employees who have the same job_type as of emp_id 7.

SELECT *FROM employee
WHERE job_type = (SELECT job_type FROM employee WHERE Emp_id = 7);

-- 8. Find the details of the employees whose job_type is same as that of emp_id 3 and whose salary is greater than that of emp_id 7.

SELECT *FROM employee
WHERE job_type = (SELECT job_type FROM employee WHERE Emp_id = 3) AND salary > (SELECT salary FROM employee WHERE Emp_id = 7);

-- 9. Display l_name, job_type and the salary of the employees whose salary is equal to the minimum salary.

SELECT L_name, job_type, salary FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 10. Find the job_type with lowest average salary.

SELECT job_type, AVG(salary) AS average_salary FROM employee
GROUP BY job_type
ORDER BY average_salary ASC
LIMIT 1;

-- 11. Display all the departments that have a minimum salary greater than that of ‘Sales’ department.

SELECT dept FROM employee GROUP BY dept
HAVING MIN(salary) > (SELECT MIN(salary) FROM employee WHERE dept = 'Sales');

-- 12. Find the employees who earn the same salary for each department.



-- 13. Display the employees who are not engineers and whose salary is less than that of any engineer.

SELECT CONCAT(F_name, ' ', L_name) AS NameOfEmployee FROM employee
WHERE job_type != 'Engineer' AND salary < (SELECT MIN(salary) FROM employee WHERE job_type = 'Engineer');

-- 14. Display the employees whose salary is less than the salary of all employees with a job_type ‘Clerk’ and whose job_type is not ‘Clerk’.

SELECT CONCAT(F_name, ' ', L_name) AS NameOfEmployee FROM employee
WHERE salary < (SELECT MIN(salary) FROM employee WHERE job_type = 'Clerk') AND job_type != 'Clerk';

-- 15. Consider the following database of students enrollment in courses and books adopted for each course.

-- STUDENT(regno: string, name: string, major: strong, bdate: date)
-- COURSE(course-no: int cname: string, dept: string)
-- ENROLL(reg-no: string, course-no: int, sem: int, marks: int)
-- BOOK-ADOPTION(course-no: int, sem: int, book-isbn: int)
-- TEXT(book-isbn: int, book-title: string, publisher: string, author: string)

-- i) Create the above tables by properly specifying the primary keys and the foreign keys

CREATE TABLE STUDENT(
    regno char(25),
    name char(25),
    major char(25),
    bdate date
);

CREATE TABLE COURSE(
    course_no int(25),
    cname char(25),
    dept char(25)
);

CREATE TABLE ENROLL(
    reg_no char(25),
    course_no int(25),
    sem int(25),
    marks int(25)
);

CREATE TABLE BOOK_ADOPTION(
    course_no int(25),
    sem int(25),
    book_isbn int(25)
);

CREATE TABLE TEXT(
    book_isbn int(25),
    book_title char(25),
    publisher char(25),
    author char(25)
);

-- ii) Enter atleast five tuples for each relation.



-- iii) Demonstrate how you add a new text book to the database and make this book be adopted by some department.



-- iv) Produce a list of text books (include Course-no, book-isbn, book-title) in the alphabetical order for courses offered by the ‘Compute Science’ department that use more than two books.



-- v) List any department that has all its adopted books published by a specific publisher.

