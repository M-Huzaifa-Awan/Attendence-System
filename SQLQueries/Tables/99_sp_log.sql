CREATE TABLE DailyProcedureLog (
    ProcedureName NVARCHAR(255),
    LastExecutionDate DATETIME
);
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_attendance_today$$
DELIMITER $$

CREATE PROCEDURE sp_insert_attendance_today(
    IN p_tableName VARCHAR(255), -- Main table name (e.g., student_141)
    IN p_subjectTableName VARCHAR(255) -- Subject table name (e.g., student_141_AOOP)
)
BEGIN
    DECLARE last_execution_date DATE;

    -- Check the last execution timestamp for the given procedure
    SELECT LastExecutionDate INTO last_execution_date
    FROM DailyProcedureLog
    WHERE ProcedureName = 'sp_insert_attendance_daily';

    -- If the procedure has not been executed today, execute it and update the timestamp
    IF last_execution_date IS NULL OR DATEDIFF(CURRENT_DATE(), last_execution_date) > 0 THEN
        -- Execute the target procedure
        CALL sp_insert_attendance(p_tableName, p_subjectTableName);

        -- Update the last execution timestamp
        INSERT INTO DailyProcedureLog (ProcedureName, LastExecutionDate)
        VALUES ('sp_insert_attendance_daily', CURRENT_DATE());
    END IF;
END $$

DELIMITER ;
