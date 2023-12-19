-- creo il database
CREATE DATABASE `db_university_schema`;

-- uso il database
USE `db_university_schema`;

-- creo la tabella departments
CREATE TABLE `departments` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`address` VARCHAR(255) NOT NULL,
	`phone` VARCHAR(20) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`website` VARCHAR(255) NOT NULL,
	`head_of_department` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);

-- creo la tabella degrees
CREATE TABLE `degrees` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`level` VARCHAR(255) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`website` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

-- creo la tabella students
CREATE TABLE `students` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`surname` VARCHAR(255) NOT NULL,
	`date_of_birth` DATE NOT NULL,
	`fiscal_code` CHAR(16) NOT NULL,
	`enrolment_date` DATE NOT NULL,
	`registration_number` INT NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);

-- modifico la tabella degrees per aggiungere la FK
ALTER TABLE `degrees`
ADD COLUMN `department_id` INT;

ALTER TABLE `degrees`
ADD FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`);

-- modifico la tabella students per aggiungere la FK
ALTER TABLE `students`
ADD COLUMN `degree_id` INT;

ALTER TABLE `students`
ADD FOREIGN KEY (`degree_id`) REFERENCES `degrees`(`id`);

-- aggiungo la colonna name alla tabella departments dopo l'id
ALTER TABLE departments
ADD name VARCHAR(255) NOT NULL AFTER id;


-- inserisco 5 record nella tabella departments
INSERT INTO departments (name, address, phone, email, website, head_of_department)
VALUES ('Informatica', 'Via Informatica 1', '1234567890', 'informatica@email.com', 'www.informatica.com', 'Prof. Informatica');

INSERT INTO departments (name, address, phone, email, website, head_of_department)
VALUES ('Scienze', 'Via Scienze 2', '1549851065', 'scienze@email.com', 'www.scienze.com', 'Prof. Scienze');

INSERT INTO departments (name, address, phone, email, website, head_of_department)
VALUES ('Chimica', 'Via Chimica 3', '4567891254', 'chimica@email.com', 'www.chimica.com', 'Prof. Chimica');

INSERT INTO departments (name, address, phone, email, website, head_of_department)
VALUES ('Geologia', 'Via Geologia 4', '5124981254', 'geologia@email.com', 'www.geologia.com', 'Prof. Geologia');

INSERT INTO departments (name, address, phone, email, website, head_of_department)
VALUES ('Biotecnologie', 'Via Biotecnologie 5', '1587430219', 'biotecnologie@email.com', 'www.biotecnologie.com', 'Prof. Biotecnologie');

-- inserisco 5 record nella tabella degrees
INSERT INTO degrees (name, `level`, address, email, website, department_id)
VALUES ('Laurea in scienze', 'Triennale', 'Via Scienze 2', 'www.scienze.com', 'www.scienze.com', 2);

INSERT INTO degrees (name, `level`, address, email, website, department_id)
VALUES ('Laurea in informatica', 'Magistrale', 'Via Informatica 1', 'informatica@email.com', 'www.informatica.com', 1);

INSERT INTO degrees (name, `level`, address, email, website, department_id)
VALUES ('Laurea in chimica', 'Triennale', 'Via Chimica 3', 'chimica@email.com', 'www.chimica.com', 5);

INSERT INTO degrees (name, `level`, address, email, website, department_id)
VALUES ('Laurea in geologia', 'Magistrale', 'Via Geologia 4', 'geologia@email.com', 'www.geologia.com', 4);

INSERT INTO degrees (name, `level`, address, email, website, department_id)
VALUES ('Laurea in biotecnologie', 'Triennale', 'Via Biotecnologie 5', 'biotecnologie@email.com', 'www.biotecnologie.com', 3);

-- inserisco 5 record nella tabella students
INSERT INTO students (name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email, degree_id)
VALUES ('Mario', 'Rossi', '1999-12-10', 'A8HG3JK9P2S4L6TR', '2020-11-03', 542, 'mariorossi@email.com', 2);

INSERT INTO students (name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email, degree_id)
VALUES ('Manuel', 'Agnelli', '1995-06-22', 'B7N5MD1FG2HT3YA', '2018-10-23', 452, 'manuelagnelli@email.com', 3);

INSERT INTO students (name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email, degree_id)
VALUES ('James', 'Heatfield', '1997-02-12', 'C4EVR9Q1WP5OL', '2017-11-03', 651, 'jamesheatfield@email.com', 5);

INSERT INTO students (name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email, degree_id)
VALUES ('Eddie', 'Vedder', '1996-03-21', 'D2SAGH8JK4LM9N', '2020-11-03', 351, 'eddievedder@email.com', 6);

INSERT INTO students (name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email, degree_id)
VALUES ('Peter', 'Parker', '1999-05-27', 'E6FR3TY7IU2OP1K', '2021-10-25', 157, 'peterparker@email.com', 4);

-- modifico il record nella tabella degrees
UPDATE degrees SET email = 'scienze@email.com' WHERE id = 2;

-- elimino un record nella tabella degrees
DELETE FROM degrees WHERE id = 1;