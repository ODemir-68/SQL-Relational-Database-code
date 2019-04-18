SELECT module.code, module.name, module.credits
	FROM module;

SELECT delegate.no, delegate.name
	FROM delegate
    ORDER BY delegate.name DESC;
    
SELECT course.code, course.name, course.credits
	FROM course
	WHERE (course.name LIKE 'Network%');

SELECT MAX(grade) AS 'Highest Grade'
	FROM take;

SELECT take.no
	FROM take
	WHERE take.grade =  
    (SELECT MAX(grade) FROM take);
    
SELECT delegate.no, delegate.name
	FROM delegate
	WHERE delegate.no IN  
    (SELECT take.no FROM take
		WHERE take.grade = 
        (SELECT MAX(grade) FROM take));

SELECT session.code, session.date
	FROM session
	WHERE (date BETWEEN '2016.01.01' AND '2016.12.31') AND (session.room IS NULL);
    
SELECT module.name, take.code, delegate.name, delegate.no
	FROM module INNER JOIN take 
    ON module.code = take.code
    INNER JOIN delegate 
    ON take.no = delegate.no
    WHERE (take.grade < 40);
    
SELECT delegate.name, delegate.no, take.grade
	FROM delegate INNER JOIN take
    ON delegate.no = take.no
    WHERE take.grade = 
		(SELECT MAX(grade) FROM take);
    
SELECT delegate.name, delegate.no, course.code, course.credits, SUM(take.grade) AS total_student_credits
	FROM delegate INNER JOIN take
    ON delegate.no = take.no
    INNER JOIN module
    ON take.code = module.code
    INNER JOIN course
    ON module.course_code = course.code
    WHERE take.grade > 40 GROUP BY delegate.name;

SELECT delegate.name, delegate.no, course.code, course.credits, SUM(take.grade) AS total_student_credits
	FROM delegate INNER JOIN take
    ON delegate.no = take.no
    INNER JOIN module
    ON take.code = module.code
    INNER JOIN course
    ON module.course_code = course.code
    WHERE take.grade > 40 GROUP BY delegate.name
		HAVING (total_student_credits > course.credits);

