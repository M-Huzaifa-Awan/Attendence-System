USE attendencesystem_db;
DROP TABLE IF EXISTS student_141;
CREATE TABLE student_141 (
  rollNo VARCHAR(20) PRIMARY KEY NOT NULL,
  NAME VARCHAR(255) NOT NULL 
);
INSERT INTO student_141 (rollNo, NAME) 
VALUES ('CS-55', 'Abdullah Khaliq'),
       ('CS-56', 'Abu Hurraira'),
       ('CS-57', 'Ahmad Abbas'),
       ('CS-58', 'Ali Hassan'),
       ('CS-60', 'Faiza Aziz'),
       ('CS-61', 'Faizan Mahmood'),
       ('CS-62', 'Haroon Abdullah'),
       ('CS-63', 'Maaz Shahzad'),
       ('CS-64', 'Maryam Nisar'),
       ('CS-65', 'Muhammad Azan'),
       ('CS-66', 'Muhammad Bilal'),
       ('CS-67', 'Muhammad Hamza'),
       ('CS-68', 'Muhammad Huzaifa Awan'),
       ('CS-69', 'Muhammad Ibrahim'),
       ('CS-70', 'Muhammad Kubaib'),
       ('CS-71', 'Muhammad Labeeb Amjad'),
       ('CS-73', 'Muhammad Tayab Uzman'),
       ('CS-75', 'Muntaha'),
       ('CS-76', 'Muqadas Javaid'),
       ('CS-77', 'Shaharyar Shah'),
       ('CS-78', 'Shahrooz Shahbaz'),
       ('CS-79', 'Zoofsahn'),
       ('CS-2822','Shaharmeer Basharat');
       SELECT * FROM student_141;


