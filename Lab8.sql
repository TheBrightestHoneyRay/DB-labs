CREATE DATABASE lab8;

CREATE TABLE salesman(
  salesman_id INTEGER,
  name VARCHAR(50),
  city VARCHAR(70),
  commision NUMERIC
);

CREATE TABLE customers(
  customer_id INTEGER,
  cust_name VARCHAR(50),
  city VARCHAR(70),
  grade INTEGER,
  salesman_id INTEGER
);

CREATE TABLE orders(
  ord_no INTEGER,
  purch_amt NUMERIC,
  ord_date VARCHAR(11),
  customer_id INTEGER,
  salesman_id INTEGER
);

INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15),
                            (5002, 'Nail Knite', 'Paris', 0.13),
                            (5005, 'Pit Alex', 'London', 0.11),
                            (5006, 'Mc Lyon', 'Paris', 0.14),
                            (5003, 'Lauson Hen', NULL, 0.12),
                            (5007, 'Paul Adam', 'Rome', 0.13);


INSERT INTO customers VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', NULL, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                             (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (70002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007, 948.5, '2012-09-10', 3005, 5002),
                          (70005, 2400.6, '2012-07-27', 3007, 5001),
                          (70008, 5760, '2012-09-10', 3002, 5001);

--3
CREATE ROLE junior_dev LOGIN;

--4
CREATE VIEW cust_view
  AS SELECT * FROM customers WHERE city = 'New York';

--5
CREATE VIEW order_view
  AS SELECT * FROM orders;

GRANT ALL PRIVILEGES ON order_view TO junior_dev;

--6
CREATE VIEW grade_view
  AS SELECT * FROM customers
  WHERE grade = (SELECT max(grade) FROM customers);

SELECT * FROM grade_view;

GRANT SELECT ON grade_view TO junior_dev;
--7
CREATE VIEW number_salesman_in_city
  AS(SELECT count(salesman_id)
     FROM salesman GROUP BY (city));

SELECT * from number_salesman_in_city;

--8
CREATE VIEW salesman_with_many_cust
  AS(SELECT * from salesman
     WHERE salesman_id
             IN (select salesman_id from customers
                 GROUP by(customers.salesman_id)
                 HAVING count(cust_name) > 1));
CREATE ROLE intern;

--9
GRANT intern TO junior_dev;--WITH ADMIN OPTION;









