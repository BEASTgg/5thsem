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



-- 3. Display the previous and current department and job_types of all the employees.



-- 4. Display the employee id and job_types of the employees who currently have a job title that they held previously.



-- 5. Find the name of those employees who have not changed their jobs once.



-- 6. Find the names of the employees who earn more than Chitra.



-- 7. Find the details of those employees who have the same job_type as of emp_id 7.



-- 8. Find the details of the employees whose job_type is same as that of emp_id 3 and whose salary is greater than that of emp_id 7.



-- 9. Display l_name, job_type and the salary of the employees whose salary is equal to the minimum salary.



-- 10. Find the job_type with lowest average salary.



-- 11. Display all the departments that have a minimum salary greater than that of ‘Sales’ department.



-- 12. Find the employees who earn the same salary for each department.



-- 13. Display the employees who are not engineers and whose salary is less than that of any engineer.



-- 14. Display the employees whose salary is less than the salary of all employees with a job_type ‘Clerk’ and whose job_type is not ‘Clerk’.



-- 15. Consider the following database of students enrollment in courses and books adopted for each course.

-- STUDENT(regno: string, name: string, major: strong, bdate: date)
-- COURSE(course-no: int cname: string, dept: string)
-- ENROLL(reg-no: string, course-no: int, sem: int, marks: int)
-- BOOK-ADOPTION(course-no: int, sem: int, book-isbn: int)
-- TEXT(book-isbn: int, book-title: string, publisher: string, author: string)

-- i) Create the above tables by properly specifying the primary keys and the foreign keys



-- ii) Enter atleast five tuples for each relation.



-- iii) Demonstrate how you add a new text book to the database and make this book be adopted by some department.



-- iv) Produce a list of text books (include Course-no, book-isbn, book-title) in the alphabetical order for courses offered by the ‘Compute Science’ department that use more than two books.



-- v) List any department that has all its adopted books published by a specific publisher.


