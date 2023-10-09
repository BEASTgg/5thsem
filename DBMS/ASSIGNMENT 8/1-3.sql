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
 
INSERT INTO publisher_city
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
(4001,'HP and Goblet Of Fire',1001,2001,3001,2002,600),
(4002,'HP and Order Of Phoenix',1001,2002,3001,2005,650),
(4003,'Two States',1002,2004,3001,2009,65),
(4004,'3 Mistakes of my life',1002,2004,3001,2007,55),
(4005,'Da Vinci Code',1004,2003,3001,2004,450),
(4006,'Angels and Demons',1004,2003,3001,2003,350),
(4007,'Artificial Intelligence',1003,2002,3002,1970,500);


INSERT INTO orderdetails
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

-- iv) Find the author of the book which has maximum sales.

WITH AuthorSales AS (
    SELECT C.author_id, SUM(O.quantity) AS total_sales
    FROM catalogue C
    JOIN orderdetails O ON C.book_id = O.book_id
    GROUP BY C.author_id
    ORDER BY SUM(O.quantity) DESC
)

-- v) Demonstrate how to increase price of books published by specific publisher by 10%

SELECT A.author_id, A.author_name
FROM author A
JOIN AuthorSales ASales ON A.author_id = ASales.author_id
WHERE ROWNUM = 1;
v) UPDATE catalogue c
SET c.price = c.price * 1.1
WHERE c.publisher_id = 2002 ;


-- 2. Consider the following database for BANK.
-- BRANCH(branch-name: string, branch-city: string, assets: real)
-- ACCOUNT(accno: int, branch-name: string, balance: real)
-- DEPOSITOR(customer-name: string, accno: int)
-- CUSTOMER(customer-name: string, customer-street: string, customer-city: string)
-- LOAN(loan-no: int, branch-name: string, amount: real)
-- BORROWER(customer-name: string, loan-no: int)
-- i) Create the above tables by properly specifying the primary keys and foreign keys.



-- ii) Enter atleast five tuples for each relation.



-- iii) Find all the customers who have atleast two accounts at the main branch.



-- iv) Find all customer who have an account at all the branches located in a specific city.



-- v) Demonstrate how t0 delete all account tuples at every branch located in specific city.


