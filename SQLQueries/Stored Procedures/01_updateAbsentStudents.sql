DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_absent_students$$
DELIMITER $$

CREATE PROCEDURE sp_update_absent_students(
    IN p_rollNo           VARCHAR(15),
    IN p_tableName        VARCHAR(15),
    IN p_subjectTableName VARCHAR(30),
    IN p_slot             CHAR(1)
)
BEGIN
    SET @current_date = CURRENT_DATE();

    SET @sql_update_query = CONCAT('UPDATE ', p_subjectTableName, ' SET slot', p_slot, ' = "A" WHERE rollNo = \'', p_rollNo, '\'');

    PREPARE dynamic_update_sql_query FROM @sql_update_query;
    EXECUTE dynamic_update_sql_query;
    DEALLOCATE PREPARE dynamic_update_sql_query;
END $$

DELIMITER ;
