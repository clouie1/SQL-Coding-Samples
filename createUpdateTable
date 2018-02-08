CREATE TABLE account(
	user_id serial PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(355) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP);
    

CREATE TABLE role(
	role_id serial PRIMARY KEY,
	role_name VARCHAR(255) UNIQUE NOT NULL);


CREATE TABLE account_role(
	user_id integer NOT NULL,
	role_id integer NOT NULL,
	grant_date timestamp without time zone,
	PRIMARY KEY (user_id, role_id));
    

CREATE TABLE leads(
	user_id serial PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(355) UNIQUE NOT NULL,
	minutes integer NOT NULL,
	sign_up_ts TIMESTAMP NOT NULL
);

----------- INSERT INTO table -------------
CREATE TABLE link(
    ID serial PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    rel VARCHAR(50)
);

INSERT INTO link(url, name)
VALUES ('www.google.com','Google');

INSERT INTO link(url, name)
VALUES ('www.yahoo.com','Yahoo');

SELECT * FROM link;

INSERT INTO link(url, name)
VALUES ('www.bing.com','Bing'),
		('www.amazon.com', 'Amazon');

SELECT * FROM link;


CREATE TABLE link_copy (LIKE link);

SELECT * FROM link_copy;

INSERT INTO link_copy
SELECT * FROM link
WHERE name = 'Bing';

SELECT * FROM link_copy;

--------------- UPDATE table ----------------
INSERT INTO link (url,name)
VALUES ('www.a.com', 'A'),
	('www.b.com', 'B');
    
UPDATE link
SET description = 'Empty Description';

SELECT * FROM link;

UPDATE link 
SET description = 'An ecommerce corporation'
WHERE name LIKE 'A%';

UPDATE link
SET description = name;

UPDATE link
SET description = 'New Description'
WHERE id = 1
-- similar to just selecting...
RETURNING id,url,name,description;

----------- DELETE FROM table ------------------
SELECT * FROM link;

DELETE FROM link
WHERE name LIKE 'B%';

DELETE FROM link
WHERE name = 'A'
RETURNING *;


---------- ALTER Table ------------------
DROP TABLE IF EXISTS link;

CREATE TABLE link(
    link_id serial PRIMARY KEY,
    title VARCHAR(512) NOT NULL,
    url VARCHAR(1023) NOT NULL UNIQUE
);

ALTER TABLE link ADD COLUMN active boolean;
SELECT * FROM link;

-- drop a column
ALTER TABLE link DROP COLUMN active;

-- rename a column
ALTER TABLE link RENAME COLUMN title TO new_title;

-- rename the table
ALTER TABLE link RENAME TO url_table;

SELECT * FROM url_table;


---------------- DROP TABLE ---------------------
CREATE TABLE test_two(
	test_id serial PRIMARY KEY
);

DROP TABLE test_two;

SELECT * FROM test_two;

DROP TABLE IF EXISTS test_two RESTRICT
-- postgreSQL use restrict by default


----------- CHECK constraint ------------------
CREATE TABLE new_users(
	id serial PRIMARY KEY,
    first_name VARCHAR(50),
    birth_date DATE CHECK(birth_date > '1900-01-01'),
    join_date DATE CHECK(join_date > birth_date),
    salary integer CHECK(salary>0)
);

SELECT * FROM new_users;

INSERT INTO new_users(first_name, birth_date, join_date, salary)
VALUES ('Joe','1980-02-02','1990-04-04',-10);
	

CREATE TABLE checktest(
    sales integer CONSTRAINT positve_sales CHECK(sales>0)
);
-- 'CONSTRAINT' ALLOW YOU TO NAME YOUR CONSTRAINT THAT YOU ARE CHECKING

INSERT INTO checktest(sales)
VALUES (10);


---------- NOT NULL constraint -----------
CREATE TABLE learn_null(
    first_name VARCHAR(50),
    sales integer NOT NULL
);

INSERT INTO learn_null(first_name, sales)
VALUES('John',12),
	('',13);

SELECT * FROM learn_null;

------------ UNIQUE constraint -------------
CREATE TABLE people(
    id serial PRIMARY KEY,
    first_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

INSERT INTO people(id,first_name,email)
VALUES (1,'Joe','joe@cool.com')

SELECT * FROM people;

INSERT INTO people(id,first_name,email)
VALUES (2,'Joseph','joe@cool.com')

