CREATE DATABASE lab4;

CREATE TABLE warehouses(
  code INTEGER,
  location VARCHAR(255),
  capacity INTEGER
);

CREATE TABLE boxes(
  code CHARACTER(4),
  contents CHARACTER VARYING(255),
  value REAL,
  warehouse INTEGER
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

SELECT * FROM warehouses;

SELECT * FROM boxes WHERE value between 50 AND 150;

SELECT DISTINCT ON(warehouse) * FROM boxes;

SELECT Contents,count(*) FROM boxes GROUP by Contents;

SELECT warehouse, count(*) AS num FROM boxes WHERE contents = 'Papers' GROUP BY warehouse;

INSERT INTO warehouses
VALUES
       (6, 'New York', 3);

SELECT * FROM warehouses;

INSERT INTO boxes
VALUES
       ('H5RT', 'Papers', 200, 2);

SELECT * FROM boxes;

UPDATE boxes
SET value = value * 0.8
WHERE value = (SELECT value FROM boxes ORDER BY value LIMIT 1 OFFSET 2);

DELETE FROM boxes WHERE value < 150;

DELETE FROM boxes WHERE warehouse in (SELECT code FROM warehouses WHERE location = 'New York')
RETURNING code, warehouse;
