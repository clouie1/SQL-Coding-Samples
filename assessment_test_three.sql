-- Assessment Test 3 -------
CREATE TABLE students(
    student_id serial PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARACHAR(45) NOT NULL,
    homeroom_number integer,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(115) UNIQUE,
    grad_year integer
);

CREATE TABLE teachers(
    teacher_id serial PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    homeroom_number integer,
    department VARCHAR(255),
    email VARCHAR(115) UNIQUE,
    phone VARCHAR(50) UNIQUE,
    grad_year integer
);

INSERT INTO students(student_id, first_name, last_name, homeroom_number, phone, grad_year)
VALUES (1, 'Mark', 'Watney', 5, '7775554321', 2035)

INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES('Jonas','Salk',5,'Biology','jsalk@school.org','7755554321');
