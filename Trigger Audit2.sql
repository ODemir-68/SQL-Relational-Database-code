DROP TABLE IF EXISTS loging_grade_change2;
CREATE TABLE loging_grade_change2 (
	log_no INT NOT NULL AUTO_INCREMENT,
    current_logged_in_user VARCHAR(50) NOT NULL,
    timestamp datetime NOT NULL DEFAULT NOW(),
    module_code CHAR(2) NOT NULL,
    delegate_no INT NOT NULL,
    old_grade TINYINT NOT NULL,
    new_grade TINYINT NOT NULL,
	CONSTRAINT pri_logging_grade_change2 PRIMARY KEY(log_no));