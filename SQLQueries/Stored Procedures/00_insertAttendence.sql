DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_attendance_today$$ 
DELIMITER $$
CREATE PROCEDURE sp_insert_attendance_today(
  IN p_tableName VARCHAR(255),
  IN p_subjectTableName VARCHAR(255)
)
BEGIN
  DECLARE last_execution_date DATE;

  SELECT LastExecutionDate INTO last_execution_date
  FROM DailyProcedureLog
  WHERE ProcedureName = 'sp_insert_attendance_daily' AND subjName = p_subjectTableName;

  IF (last_execution_date IS NULL OR 
      DATEDIFF(CURRENT_DATE(), last_execution_date) > 0) THEN
    
    CALL sp_insert_attendance(p_tableName, p_subjectTableName);
    
    INSERT INTO DailyProcedureLog (ProcedureName,  
                                   LastExecutionDate,
                                   subjName) 
    VALUES ('sp_insert_attendance_daily',
            CURRENT_DATE(),
            p_subjectTableName);
             
  END IF;
END$$
DELIMITER ;
