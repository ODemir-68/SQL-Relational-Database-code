CREATE TABLE loging_grade_change (
	log_no INT NOT NULL AUTO_INCREMENT,
    current_logged_in_user VARCHAR(50) NOT NULL,
    timestamp datetime NOT NULL DEFAULT NOW(),
    delegate_no INT NOT NULL,
    old_grade TINYINT NOT NULL,
    new_grade TINYINT NOT NULL,
	CONSTRAINT pri_logging_grade_change PRIMARY KEY(log_no),
    CONSTRAINT for_delegate_no FOREIGN KEY(delegate_no) REFERENCES take (no));
    


