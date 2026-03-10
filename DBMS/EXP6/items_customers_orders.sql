CREATE TABLE items (
itemid NUMBER PRIMARY KEY,
itemname VARCHAR2(50),
category VARCHAR2(50),
price NUMBER(10,2),
instock NUMBER
);

CREATE TABLE customers (
custid NUMBER PRIMARY KEY,
custname VARCHAR2(50),
address VARCHAR2(100),
state VARCHAR2(50)
);

CREATE TABLE orders (
orderid NUMBER PRIMARY KEY,
custid NUMBER,
itemid NUMBER,
quantity NUMBER,
orderdate DATE,
FOREIGN KEY (custid) REFERENCES customers(custid),
FOREIGN KEY (itemid) REFERENCES items(itemid)
);

CREATE TABLE delivery (
deliveryid NUMBER PRIMARY KEY,
custid NUMBER,
orderid NUMBER,
FOREIGN KEY (custid) REFERENCES customers(custid),
FOREIGN KEY (orderid) REFERENCES orders(orderid)
);


-- INSERT VALUES INTO ITEMS

Insert Into Items Values (1,'Tv','Electronics',60000,10);
INSERT INTO items VALUES (2,'lAPTOP','Electronics',20000,15);
INSERT INTO items VALUES (3,'Shirt','Clothing',1500,50);
INSERT INTO items VALUES (4,'Shoes','Footwear',3000,25);
INSERT INTO items VALUES (5,'Watch','Accessories',5000,20);


-- INSERT VALUES INTO CUSTOMERS

Insert Into Customers Values (1,'Alwin Jose George','MG Road','Kerala');
Insert Into Customers Values (2,'Joe','Park Street','Tamil Nadu');
Insert Into Customers Values (3,'Alwin Joshy','Marine Drive','Kerala');
Insert Into Customers Values (4,'Febin','Brigade Road','Karnataka');
INSERT INTO customers VALUES (5,'Nikhil','Banjara Hills','Telangana');


-- INSERT VALUES INTO ORDERS

INSERT INTO orders VALUES (101,1,1,1,SYSDATE);
INSERT INTO orders VALUES (102,1,2,2,SYSDATE);
INSERT INTO orders VALUES (103,2,3,3,SYSDATE);
INSERT INTO orders VALUES (104,3,4,1,SYSDATE);
INSERT INTO orders VALUES (105,4,5,2,SYSDATE);
INSERT INTO orders VALUES (106,1,3,4,SYSDATE);


-- INSERT VALUES INTO DELIVERY

INSERT INTO delivery VALUES (1,1,101);
INSERT INTO delivery VALUES (2,2,103);
INSERT INTO delivery VALUES (3,4,105);



---------------------------------------------------
-- BASIC JOIN QUERIES
---------------------------------------------------

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid = o.custid;

SELECT DISTINCT c.*
FROM customers c
JOIN delivery d ON c.custid = d.custid;

SELECT c.custname, o.orderid, o.orderdate
FROM customers c
JOIN orders o ON c.custid = o.custid
ORDER BY c.custname;



---------------------------------------------------
-- e) Name and price of items bought by 'mickey'
---------------------------------------------------

SELECT i.itemname, i.price
FROM items i
JOIN orders o ON i.itemid = o.itemid
JOIN customers c ON o.custid = c.custid
WHERE c.custname = 'mickey';



---------------------------------------------------
-- f) Customers who ordered after Jan 2013 but not delivered
---------------------------------------------------

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid = o.custid
WHERE o.orderdate > TO_DATE('31-01-2013','DD-MM-YYYY')
AND o.orderid NOT IN
(
SELECT orderid FROM delivery
);



---------------------------------------------------
-- g) Itemid of items ordered or not delivered
---------------------------------------------------

SELECT itemid
FROM orders
UNION
SELECT itemid
FROM orders
WHERE orderid NOT IN
(
SELECT orderid FROM delivery
);



---------------------------------------------------
-- h) Customers who placed order and received delivery
---------------------------------------------------

SELECT DISTINCT c.custname
FROM customers c
JOIN orders o ON c.custid = o.custid
JOIN delivery d ON o.orderid = d.orderid;



---------------------------------------------------
-- i) Customers who placed order but not delivered
---------------------------------------------------

SELECT DISTINCT c.custname
FROM customers c
JOIN orders o ON c.custid = o.custid
WHERE o.orderid NOT IN
(
SELECT orderid FROM delivery
);



---------------------------------------------------
-- j) Customer who placed most number of orders
---------------------------------------------------

SELECT custname
FROM customers
WHERE custid =
(
SELECT custid
FROM orders
GROUP BY custid
ORDER BY COUNT(orderid) DESC
FETCH FIRST 1 ROW ONLY
);



---------------------------------------------------
-- k) Customers who purchased items costing >5000
---------------------------------------------------

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid = o.custid
JOIN items i ON o.itemid = i.itemid
WHERE i.price > 5000;



---------------------------------------------------
-- l) Customers who did not order 'Samsung GalaxyS4'
---------------------------------------------------

SELECT custname, address
FROM customers
WHERE custid NOT IN
(
SELECT c.custid
FROM customers c
JOIN orders o ON c.custid = o.custid
JOIN items i ON o.itemid = i.itemid
WHERE i.itemname = 'Samsung GalaxyS4'
);



---------------------------------------------------
-- m) LEFT OUTER JOIN
---------------------------------------------------

SELECT c.custname, o.orderid
FROM customers c
LEFT OUTER JOIN orders
ON c.custid = o.custid;



---------------------------------------------------
-- RIGHT OUTER JOIN
---------------------------------------------------

SELECT c.custname, o.orderid
FROM customers c
RIGHT OUTER JOIN orders
ON c.custid = o.custid;



---------------------------------------------------
-- n) Customers grouped by state
---------------------------------------------------

SELECT state, COUNT(*) AS total_customers
FROM customers
GROUP BY state;



---------------------------------------------------
-- o) Items grouped by category having price > average
---------------------------------------------------

SELECT category, itemname, price
FROM items
WHERE price >
(
SELECT AVG(price) FROM items
)
ORDER BY category;
