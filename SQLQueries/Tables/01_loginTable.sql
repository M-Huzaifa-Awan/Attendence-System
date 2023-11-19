USE attendencesystem_db;
DROP TABLE IF EXISTS loginInfo;
CREATE TABLE loginInfo(
email		VARCHAR(255) UNIQUE,
PASSWORD	VARCHAR(50));
INSERT INTO loginInfo VALUES ('huzaifa@gmail.com','123');
SELECT * FROM loginInfo;
