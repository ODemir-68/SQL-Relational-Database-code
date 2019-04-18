DROP TRIGGER IF EXISTS trg_grade_change;
DELIMITER $$    

CREATE TRIGGER trg_grade_change AFTER UPDATE ON take FOR EACH ROW
    BEGIN   
        IF (NEW.grade != OLD.grade) THEN 
            INSERT INTO loging_grade_change (current_logged_in_user, delegate_no, old_grade, new_grade)
            VALUES (current_user, OLD.no, OLD.grade, NEW.grade);
        END IF;
    END;$$

DELIMITER ;

