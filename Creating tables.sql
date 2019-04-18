CREATE TABLE course (
	code CHAR(3) NOT NULL,
    name VARCHAR(30) NOT NULL,
    credits TINYINT NOT NULL,
    CONSTRAINT pri_course PRIMARY KEY(code));
    
CREATE TABLE module (
	code CHAR(2) NOT NULL,
	name VARCHAR(30) NOT NULL,
    cost DECIMAL (8,2) NOT NULL DEFAULT 0.0,
    credits TINYINT NOT NULL,
    course_code CHAR(3) NOT NULL,
    CONSTRAINT pri_module PRIMARY KEY(code),
    CONSTRAINT for_coursecode FOREIGN KEY (course_code) REFERENCES course (code));
    
CREATE TABLE session (
	code CHAR(2) NOT NULL,
    date DATE NOT NULL,
    room VARCHAR(30) NULL,
    CONSTRAINT pri_session PRIMARY KEY(code,date),
    CONSTRAINT for_modulecode FOREIGN KEY(code) REFERENCES module (code));
    
CREATE TABLE delegate (
	no INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    phone VARCHAR(30) NULL,
    CONSTRAINT pri_delegate PRIMARY KEY(no));
    
CREATE TABLE take(
	no INT NOT NULL,
    code CHAR(2) NOT NULL,
    grade TINYINT NULL,
    CONSTRAINT pri_take PRIMARY KEY (no,code),
	CONSTRAINT for1_take FOREIGN KEY(no) REFERENCES delegate (no),
    CONSTRAINT for2_take FOREIGN KEY(code) REFERENCES module (code));
    
