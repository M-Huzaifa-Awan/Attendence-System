DELIMITER $$
DROP PROCEDURE IF EXISTS  sp_insert_attendance$$
DELIMITER $$

CREATE PROCEDURE sp_insert_attendance(
    IN p_tableName VARCHAR(255), -- Main table name (e.g., student_141)
    IN p_subjectTableName VARCHAR(255) -- Subject table name (e.g., student_141_AOOP)
)
BEGIN
    -- Declare variables
    SET @current_date = CURRENT_DATE();

    -- Build dynamic SQL query
    SET @sql_query = CONCAT('INSERT INTO ', p_subjectTableName, ' (rollNo, DATE, slot1, slot2) ', 
                            'SELECT rollNo, ?, "P", "P" FROM ', p_tableName);

    -- Prepare and execute the dynamic SQL query
    PREPARE dynamic_sql_query FROM @sql_query;
    -- Set parameter values, execute, etc.
    -- Execute the prepared statement with current date
    EXECUTE dynamic_sql_query USING @current_date;

    -- Deallocate the prepared statement
    DEALLOCATE PREPARE dynamic_sql_query;
END $$

DELIMITER ;


