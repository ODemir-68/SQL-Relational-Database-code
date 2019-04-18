DROP TRIGGER IF EXISTS trg_grade_change2;
DELIMITER $$    

CREATE TRIGGER trg_grade_change2 AFTER UPDATE ON take FOR EACH ROW
    BEGIN   
        IF (NEW.grade != OLD.grade) THEN 
            INSERT INTO loging_grade_change2 (current_logged_in_user,module_code ,delegate_no, old_grade, new_grade)
            VALUES (current_user, OLD.code, OLD.no, OLD.grade, NEW.grade);
        END IF;
    END$$

DELIMITER ;