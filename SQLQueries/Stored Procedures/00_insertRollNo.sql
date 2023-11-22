DELIMITER $$
DROP PROCEDURE IF EXISTS  sp_insert_roll_numbers$$
DELIMITER $$

CREATE PROCEDURE sp_insert_roll_numbers(
    IN p_tableName          VARCHAR(255), 
    IN p_subjectTableName   VARCHAR(255)
BEGIN
    SET @current_date = CURRENT_DATE();

    SET @sql_query = CONCAT('INSERT INTO ', p_subjectTableName, ' (rollNo, DATE, slot1, slot2) ', 
                            'SELECT rollNo, ?, "P", "P" FROM ', p_tableName);

    PREPARE dynamic_sql_query FROM @sql_query;
    EXECUTE dynamic_sql_query USING @current_date;

    DEALLOCATE PREPARE dynamic_sql_query;
END $$

DELIMITER ;