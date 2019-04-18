CALL new_schedule_course('DDM', '2016-03-01');


DELIMITER $$

CREATE PROCEDURE new_schedule_course
	(IN u_course_code CHAR(3), IN s_date DATE)
	BEGIN
		DECLARE loop_finished BOOLEAN DEFAULT FALSE;
        DECLARE input_of_course_code CHAR(3);        
        DECLARE cursor_for_module CURSOR for
			SELECT code FROM module WHERE course.code = u_course_code;
	
		DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET loop_finished = TRUE;
        
        OPEN cursor_for_module;
        
        loopy:LOOP
        
        FETCH cursor_for_module INTO input_of_course_code;
        
        IF (loop_finished = TRUE) THEN
			LEAVE loopy;
		END IF;
        
        IF (s_date < DATE_ADD(CURDATE(), INTERVAL 1 MONTH)) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Start date of course must be one month in advance';
		END IF;
        
        IF	(WEEKDAY(s_date) < 5) THEN 
			INSERT INTO session (code, date) VALUES (u_course_code,s_date);
            SET s_date = DATE_ADD(s_date, INTERVAL 1 DAY);
		ELSE 
			WHILE
			(WEEKDAY(s_date)>=5) DO
				SET s_date = DATE_ADD(s_date, INTERVAL 1 DAY);
		END WHILE;
		INSERT INTO session (code, date) VALUES (u_course_code,s_date);
        SET s_date = DATE_ADD(s_date, INTERVAL 1 DAY);
        
        END IF;
	END LOOP loopy;
	CLOSE cursor_for_module;
END$$

DELIMITER ;



