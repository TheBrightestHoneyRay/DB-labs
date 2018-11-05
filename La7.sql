CREATE DATABASE lab7;

--1
CREATE INDEX idx_country ON countries(name);

--2
CREATE INDEX idx_country ON employees(name, surname);

--3
CREATE UNIQUE INDEX uidx_country
  ON employees (salary)
  WHERE salary > value1 AND salary < value2;

--4
CREATE INDEX idx_sub ON employees(substring(name FROM 1 to 4));

--5
CREATE INDEX idx_emp ON employees(depertment_id, salary)
  WHERE salary < value2;

CREATE INDEX idx_dep ON departments(department_id, budget)
  WHERE budget > value2;



