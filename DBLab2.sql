CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL CONSTRAINT countries_pkey PRIMARY KEY,
  country_name VARCHAR(60),
  region_id INTEGER,
  population INTEGER
);

SELECT * FROM countries;

INSERT INTO countries(country_name, region_id, population) VALUES ('Mexico', 12, 3234563);

ALTER TABLE countries
    ALTER COLUMN region_id SET DEFAULT NULL;

INSERT INTO countries(country_name, population) VALUES ('Canada', 23245453);

UPDATE countries SET country_name = 'Kazakhstan';

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

UPDATE countries SET region_id = NULL;

DROP TABLE countries;

CREATE TABLE countries(
  country_id SERIAL CONSTRAINT countries_pkey PRIMARY KEY,
  country_name VARCHAR(60),
  region_id INTEGER,
  population INTEGER
);

SELECT * FROM countries;

INSERT INTO countries (country_name, region_id, population) VALUES ('France', 12, 123425422);

INSERT INTO countries (country_id, country_name) VALUES (3, 'Mexico');

INSERT INTO countries (region_id) VALUES (NULL);

INSERT INTO countries (country_id, country_name, population) VALUES (4, 'Spain', 2324354);

UPDATE countries SET country_id = 27
WHERE country_id = 4;

INSERT INTO countries VALUES
                             (DEFAULT, 'China', 131455453),
                             (DEFAULT, 'Vatican', 3423423),
                             (DEFAULT, 'Rome', 123134);

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

SELECT * FROM countries;

INSERT INTO countries VALUES(DEFAULT, DEFAULT, 235342);

INSERT INTO countries(country_name) VALUES(DEFAULT);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new(
  LIKE countries
);

INSERT INTO countries_new SELECT*FROM countries;

SELECT*FROM countries_new;

UPDATE countries SET region_id=1 WHERE region_id ISNULL;

UPDATE countries SET population=population*1.1
RETURNING country_name, population AS "New Population";

DELETE FROM countries WHERE population<100000;

DELETE FROM countries where population<100000;

SELECT * FROM countries;

DELETE FROM countries_new AS cn USING countries AS c
WHERE cn.country_id = c.country_id
returning *;

DELETE FROM countries
RETURNING *;






