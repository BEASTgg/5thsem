create table Worker (worker_ID number(10) primary key,
    First_name varchar2(10),
    Last_name varchar2(10),
    Salary number(10),
    joining_date timestamp,
    department varchar2(10));

insert into Worker values(001,'Monika','Arora',100000, timestamp'2014-02-20 09:00:00', 'HR');
insert into Worker values(002,'Niharika','Verma',80000, timestamp'2014-06-11 09:00:00', 'Admin');
insert into Worker values(003,'Vishal','Singhal',300000, timestamp'2014-02-20 09:00:00', 'HR');
insert into Worker values(004,'Amitabh','Singh',500000, timestamp'2014-02-20 09:00:00', 'Admin');
insert into Worker values(005,'Vivek','Bhati',500000, timestamp'2014-06-11 09:00:00', 'Admin');
insert into Worker values(006,'Vipul','Diwan',200000, timestamp'2014-06-11 09:00:00', 'Account');
insert into Worker values(007,'Satish','Kumar',75000, timestamp'2014-01-20 09:00:00', 'Account');
insert into Worker values(008,'Geetika','Chauhan',90000, timestamp'2014-04-11 09:00:00', 'Admin');

create table Bonus (
    worker_ref_id number(10),
    bonus_date timestamp,
    bonus_amount number(10)
);

insert into Bonus values(1,Timestamp'2016-02-20 00:00:00',5000);
insert into Bonus values(2,Timestamp'2016-06-11 00:00:00',3000);
insert into Bonus values(3,Timestamp'2016-02-20 00:00:00',4000);
insert into Bonus values(1,Timestamp'2016-02-20 00:00:00',4500);
insert into Bonus values(2,Timestamp'2016-06-11 00:00:00',3500);

create table title(
worker_ref_id number(10),
worker_title varchar2(15),
affected_from timestamp
);

insert into title values(1,'Manager',timestamp'2016-02-20 00:00:00');
insert into title values(2,'Executive',timestamp'2016-06-11 00:00:00');
insert into title values(8,'Executive',timestamp'2016-06-11 00:00:00');
insert into title values(5,'Manager',timestamp'2016-06-11 00:00:00');
insert into title values(4,'Asst Manager',timestamp'2016-06-11 00:00:00');
insert into title values(7,'Executive',timestamp'2016-06-11 00:00:00');
insert into title values(6,'Lead',timestamp'2016-06-11 00:00:00');
insert into title values(3,'Lead',timestamp'2016-06-11 00:00:00');