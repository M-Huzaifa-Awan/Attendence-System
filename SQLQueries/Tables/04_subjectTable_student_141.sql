DROP TABLE IF EXISTS student_141_SE;
DROP TABLE IF EXISTS student_141_WP;
DROP TABLE IF EXISTS student_141_Lab_WebProg;
DROP TABLE IF EXISTS student_141_DM;
DROP TABLE IF EXISTS student_141_AOOP;
DROP TABLE IF EXISTS student_141_Lab_AOOP;
DROP TABLE IF EXISTS student_141_DE;
DROP TABLE IF EXISTS student_141_DAA;

CREATE TABLE student_141_SE (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_WP (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_Lab_WebProg (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_DM (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_AOOP (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_Lab_AOOP (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_DE (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);

CREATE TABLE student_141_DAA (
    rollNo VARCHAR(255),
    DATE DATE,
    slot1 CHAR(1),
    slot2 CHAR(1),
    PRIMARY KEY (DATE)
);
