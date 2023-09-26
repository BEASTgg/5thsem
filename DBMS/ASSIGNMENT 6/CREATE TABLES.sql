CREATE TABLE Worker (
    Worker_ID int(10) primary key,
    First_name varchar(10),
    Last_name varchar(10),
    Salary int(10),
    Joining_date timestamp,
    Department varchar(10));

INSERT INTO Worker
VALUES
(001,'Monika','Arora',100000, timestamp'2014-02-20 09:00:00', 'HR'),
(002,'Niharika','Verma',80000, timestamp'2014-06-11 09:00:00', 'Admin'),
(003,'Vishal','Singhal',300000, timestamp'2014-02-20 09:00:00', 'HR'),
(004,'Amitabh','Singh',500000, timestamp'2014-02-20 09:00:00', 'Admin'),
(005,'Vivek','Bhati',500000, timestamp'2014-06-11 09:00:00', 'Admin'),
(006,'Vipul','Diwan',200000, timestamp'2014-06-11 09:00:00', 'Account'),
(007,'Satish','Kumar',75000, timestamp'2014-01-20 09:00:00', 'Account'),
(008,'Geetika','Chauhan',90000, timestamp'2014-04-11 09:00:00', 'Admin');


CREATE TABLE Bonus (
    Worker_ref_id int(10),
    Bonus_date timestamp,
    Bonus_amount int(10)
);

INSERT INTO BONUS
VALUES
(1,Timestamp'2016-02-20 00:00:00',5000),
(2,Timestamp'2016-06-11 00:00:00',3000),
(3,Timestamp'2016-02-20 00:00:00',4000),
(1,Timestamp'2016-02-20 00:00:00',4500),
(2,Timestamp'2016-06-11 00:00:00',3500);


CREATE TABLE Title(
    Worker_ref_id int(10),
    Worker_title varchar(15),
    Affected_from timestamp
);

INSERT INTO Title
VALUES
(1,'Manager',timestamp'2016-02-20 00:00:00'),
(2,'Executive',timestamp'2016-06-11 00:00:00'),
(8,'Executive',timestamp'2016-06-11 00:00:00'),
(5,'Manager',timestamp'2016-06-11 00:00:00'),
(4,'Asst Manager',timestamp'2016-06-11 00:00:00'),
(7,'Executive',timestamp'2016-06-11 00:00:00'),
(6,'Lead',timestamp'2016-06-11 00:00:00'),
(3,'Lead',timestamp'2016-06-11 00:00:00');