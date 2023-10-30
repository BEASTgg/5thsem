-- 1. The following tables are maintained by a book dealer
-- AUTHOR(author-id: int, name: string, city: string, country: string)
-- PUBLISHER(publisher-id: int name: string, city: string, country: string)
-- CATLOG(book-id: int, title : string, author-id: int, publisher-id: int, category: int, year:
-- int, price: int)
-- CATEGORY(category-id: int, description: string)
-- ORDER-DETAILS(order-no: int, book-id: int, quantity: int)

-- i) Create above tables by properly specifying the primary keys and the foreign keys.

CREATE TABLE author (
    author_id INT(25),
    author_name VARCHAR(25),
    author_city VARCHAR(25),
    author_country VARCHAR(25),
    PRIMARY KEY(author_id)
);

CREATE TABLE publisher (
    publisher_id INT(25),
    publisher_name VARCHAR(25),
    publisher_city VARCHAR(25),
    publisher_country VARCHAR(25),
    PRIMARY KEY (publisher_id)
);

CREATE TABLE category (
    category_id INT(25),
    description VARCHAR(25),
    PRIMARY KEY (category_id) );

CREATE TABLE catalogue(
    book_id INT(25),
    book_title VARCHAR(25),
    author_id INT(25),
    publisher_id INT(25),
    category_id INT(25),
    year INT(25),
    price INT(25),
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id));

CREATE TABLE orderdetails(
    order_id INT(25),
    book_id INT(25),
    quantity INT(25),
    PRIMARY KEY (order_id),
    FOREIGN KEY (book_id) REFERENCES catalogue(book_id));

-- ii) Enter atleast five tuples for each relation.

INSERT INTO author
VALUES
(1001,'JK Rowling','London','England'),
(1002,'Chetan Bhagat','Mumbai','India'),
(1003,'John McCarthy','Chicago','USA'),
(1004,'Dan Brown','California','USA'),
(1005,'Ana Huang','New york','USA');
 
INSERT INTO publisher
VALUES
(2001,'Bloomsbury','London','England'),
(2002,'Scholastic','Washington','USA'),
(2003,'Pearson','London','England'),
(2004,'Rupa','Delhi','India') ,
(2005,'MC Graw Hill','New York','USA');


INSERT INTO category
VALUES
(3001,'Fiction'),
(3002,'Non-Fiction'),
(3003,'thriller'),
(3004,'action'),
(3005,'fiction');

 
INSERT INTO catalogue
VALUES
(4001,'HP and Goblet Of Fire',1001,2001,3001,2002,600),
(4002,'HP and Order Of Phoenix',1001,2002,3001,2005,650),
(4003,'Two States',1002,2004,3001,2009,65),
(4004,'3 Mistakes of my life',1002,2004,3001,2007,55),
(4005,'Da Vinci Code',1004,2003,3001,2004,450),
(4006,'Angels and Demons',1004,2003,3001,2003,350),
(4007,'Artificial Intelligence',1003,2002,3002,1970,500);


INSERT INTO orderdetails
VALUES
(5001,4001,5),
(5002,4002,7),
(5003,4003,15),
(5004,4004,11),
(5005,4005,9),
(5006,4006,8),
(5007,4007,2),
(5008,4004,3);

-- iii) Give the details of the authors who have 2 or more books in the catalog and the price of the books is greater than the average price of the books in the catalog and the year of publication is after 2010.

SELECT A.author_name, B.book_title, B.Price, B.Year
FROM Author A
JOIN Catalogue B ON A.author_id = B.author_id
WHERE B.Year > 2001
AND A.author_id IN (
    SELECT A1.author_id
    FROM Author A1
    JOIN Catalogue B1 ON A1.author_id = B1.author_id
    GROUP BY A1.author_id, A1.author_name
    HAVING COUNT(B1.book_id) >= 2
       AND AVG(B1.Price) < (
           SELECT AVG(Price) FROM Catalogue
       )
);

-- iv) Find the author of the book which has maximum sales.

             --For Oracle

WITH AuthorSales AS (
    SELECT C.author_id, SUM(O.quantity) AS total_sales
    FROM catalogue C
    JOIN orderdetails O ON C.book_id = O.book_id
    GROUP BY C.author_id
    ORDER BY SUM(O.quantity) DESC
)
SELECT A.author_id, A.author_name
FROM author A
JOIN AuthorSales ASales ON A.author_id = ASales.author_id
WHERE ROWNUM = 1;

              --For Mysql

WITH AuthorSales AS (
    SELECT C.author_id, SUM(O.quantity) AS total_sales
    FROM catalogue C
    JOIN orderdetails O ON C.book_id = O.book_id
    GROUP BY C.author_id
    ORDER BY SUM(O.quantity) DESC
)
SELECT A.author_id, A.author_name
FROM author A
JOIN AuthorSales ASales ON A.author_id = ASales.author_id
LIMIT 1;

-- v) Demonstrate how to increase price of books published by specific publisher by 10%

UPDATE catalogue c
SET c.price = c.price + (c.price * 0.1)
WHERE c.publisher_id = 2002 ;

-- 2. Consider the following database for BANK.
-- BRANCH(branch-name: string, branch-city: string, assets: real)
-- ACCOUNT(accno: int, branch-name: string, balance: real)
-- DEPOSITOR(customer-name: string, accno: int)
-- CUSTOMER(customer-name: string, customer-street: string, customer-city: string)
-- LOAN(loan-no: int, branch-name: string, amount: real)
-- BORROWER(customer-name: string, loan-no: int)

-- i) Create the above tables by properly specifying the primary keys and foreign keys.

CREATE TABLE branch(
    branch_name VARCHAR(15) NOT NULL PRIMARY KEY,
    branch_city VARCHAR(15),
    assets INT(10)
);

CREATE TABLE account(
    accno INT(8) NOT NULL PRIMARY KEY,
    branch_name VARCHAR(15),
    balance INT(10),
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name) ON DELETE CASCADE
);

CREATE TABLE customer(
    customer_name VARCHAR(15) NOT NULL PRIMARY KEY,
    customer_street VARCHAR(15),
    customer_city VARCHAR(15)
);

CREATE TABLE loan(
    loan_number INT(8) NOT NULL PRIMARY KEY,
    branch_name VARCHAR(15),
    amount INT(10),
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name) ON DELETE CASCADE
);

CREATE TABLE depositor(
    customer_name VARCHAR(15),
    accno INT(8),
    PRIMARY KEY(customer_name, accno),
    FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
    FOREIGN KEY(accno) REFERENCES account(accno)
);

CREATE TABLE borrower(
    customer_name  VARCHAR(15),
    loan_number INT(8),
    PRIMARY KEY(customer_name, loan_number),
    FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
    FOREIGN KEY(loan_number) REFERENCES loan(loan_number)
);

-- ii) Enter atleast five tuples for each relation.

INSERT INTO branch
VALUES
('Main','c1',10000),
('b2','c2',20000),
('b3','c3',30000),
('b4','c4',40000),
('b5','c5',50000);

INSERT INTO account
VALUES
(12,'Main',3000),
(22,'b2',4000),
(32,'b3',5000),
(42,'b4',6000),
(52,'Main',7000),
(62,'b5',7000);

INSERT INTO customer
VALUES
('cust1','cstreet1','c1'),
('cust2','cstreet2','c2'),
('cust3','cstreet3','c3'),
('cust4','cstreet4','c4'),
('cust5','cstreet5','c5');

INSERT INTO depositor
VALUES
('cust1',12),
('cust2',22),
('cust3',32),
('cust4',42),
('cust1',52),
('cust5',62);


INSERT INTO loan
VALUES
(10,'Main',10000),
(20,'b2',20000),
(30,'b3',30000),
(40,'b4',40000),
(50,'b5',50000);

INSERT INTO borrower
VALUES
('cust1',10),
('cust2',20),
('cust3',30),
('cust4',40),
('cust5',50);

-- iii) Find all the customers who have atleast two accounts at the main branch.

SELECT DISTINCT D.customer_name
FROM DEPOSITOR D
INNER JOIN ACCOUNT A ON D.accno = A.accno
WHERE A.branch_name = 'Main'
GROUP BY D.customer_name
HAVING COUNT(DISTINCT A.accno) >= 2;

-- iv) Find all customer who have an account at all the branches located in a specific city.

SELECT DISTINCT D.customer_name
FROM DEPOSITOR D
WHERE NOT EXISTS (
    SELECT B.branch_name
    FROM BRANCH B
    WHERE B.branch_city = 'c2'
    AND NOT EXISTS (
        SELECT A.accno
        FROM ACCOUNT A
        WHERE A.branch_name = B.branch_name
        AND A.accno = D.accno
    )
);

-- 3. Consider the following database for ORDER PROCESSING.
-- CUSTOMER(cust-no: int, cname: string, city: string)
-- ORDER(orderno: int, odate: date, ord-amt: real)
-- ORDER_ITEM(orderno: int, itemno:int, qty: int)
-- ITEM(itemno: int, unitprice: real)
-- SHIPMENT(orderno: int, warehouseno: int, ship-date: date)
-- WAREHOUSE(warehouseno: int, city: string)

-- i) Create the above tables by properly specifying the primary keys and the foreign keys

CREATE TABLE customer(
    cust_no int(25),
    cname char(25),
    city char(25)
);

CREATE TABLE orders(
    orderno int(25),
    odate date,
    ord_amt int(25)
);

CREATE TABLE order_item(
    orderno int(25),
    itemno int(25),
    qty int(25)
);

CREATE TABLE item(
    itemno int(25),
    unitprice int(25)
);

CREATE TABLE shipment(
    orderno int(25),
    warehouseno int(25),
    ship_date date
);

CREATE TABLE warehouse(
    warehouseno int(25),
    city char(25)
);

-- ii) Enter atleast five tuples for each relation.

INSERT INTO customer
VALUES
(100, 'Alex', 'Kolkata'),
(101, 'Mason', 'Delhi'),
(102, 'Ghost', 'Noida'),
(103, 'Antonio', 'Carol Bagh'),
(104, 'Sokolov', 'Noida');

INSERT INTO orders
VALUES
(990, '2023-06-09', 25000),
(991, '2023-01-12', 28000),
(992, '2023-05-05', 2000),
(993, '2023-06-23', 1200),
(994, '2023-03-10', 4050);

INSERT INTO order_item
VALUES
(990, 500, 5),
(991, 501, 15),
(992, 502, 10),
(993, 503, 2),
(994, 504, 3);

INSERT INTO item
VALUES
(500, 25),
(501, 50),
(502, 75),
(503, 100),
(504, 125);

INSERT INTO shipment
VALUES
(990, 5, '2023-06-27'),
(991, 10, '2023-05-27'),
(992, 15, '2023-04-19'),
(993, 20, '2023-01-30'),
(994, 25, '2023-07-08');

INSERT INTO warehouse
VALUES
(5, 'Kolkata'),
(10, 'Delhi'),
(15, 'Noida'),
(20, 'Carol Bagh'),
(25, 'Noida');

-- iii) List the order number and ship date for all orders shipped from particular warehouse

SELECT O.orderno, S.ship_date
FROM ORDERS O
INNER JOIN SHIPMENT S ON O.orderno = S.orderno
INNER JOIN WAREHOUSE W ON S.warehouseno = W.warehouseno
WHERE W.city = 'Noida';

-- iv) Produce a listing: customer name, no of orders, average order amount

SELECT C.cname AS "Customer Name", COUNT(O.orderno) AS "No of Orders", AVG(O.ord_amt) AS "Average Order Amount"
FROM CUSTOMER C
JOIN ORDERS O ON C.cust_no = O.cust_no
JOIN ORDER_ITEM OI ON O.orderno = OI.orderno
GROUP BY C.cname;

-- v) List the orders that were not shipped within 30 days of ordering

SELECT O.orderno, O.odate, S.ship_date
FROM ORDERS O
JOIN SHIPMENT S ON O.orderno = S.orderno
WHERE S.ship_date IS NULL OR (DATEDIFF(S.ship_date , O.odate)) > 30;
