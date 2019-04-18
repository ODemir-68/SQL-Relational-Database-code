CREATE VIEW future_sessions
AS 
	SELECT session.date 
		FROM session
		WHERE (date > '2016.01.01')
    WITH CHECK OPTION;

