INSERT INTO course (code, name, credits)
VALUES 	('WSD', 'Web Systems Development', '75'),
		('DDM', 'Database Design & Management', '100'),
        ('NSF', 'Network Security & Forensics', '75');
        
INSERT INTO module (code, name, cost, credits, course_code)
VALUES	('A2', 'ASP.NET', '250', '25', 'WSD'),
		('A3', 'PHP','250', '25', 'WSD'),
        ('A4', 'JavaFX','350','25', 'WSD'),
        ('B2', 'Oracle', '750', '50','DDM'),
        ('B3', 'SQLS', '750', '50', 'DDM'),
        ('C2', 'Law', '250', '25', 'NSF'),
        ('C3', 'Forensics', '350', '25', 'NSF'),
        ('C4', 'Networks', '250', '25', 'NSF');
        
INSERT INTO session (code, date, room)
VALUES	('A2', '2015.06.05', '305'),
        ('A3', '2015.06.06', '307'),
        ('A4', '2015.06.07', '305'),
        ('B2', '2015.08.22', '208'),
        ('B3', '2015.08.23', '208'),
        ('A2', '2016.05.01', '303'),
        ('A3', '2016.05.02', '305'),
        ('A4', '2016.05.03', '303'),
        ('B2', '2016.07.10', NULL),
        ('B3', '2016.07.11', NULL);
        
INSERT INTO delegate (no, name, phone)
VALUES	('2001', 'Mike', NULL),
		('2002', 'Andy', NULL),
        ('2003', 'Sarah', NULL),
        ('2004', 'Karen', NULL),
        ('2005', 'Lucy', NULL),
        ('2006', 'Steve', NULL),
        ('2007', 'Jenny', NULL),
        ('2008', 'Tom', NULL);

INSERT INTO take (no, code, grade)
VALUES	('2003', 'A2', '68'),
		('2003', 'A3', '72'),
        ('2003', 'A4', '53'),
        ('2005', 'A2', '48'),
        ('2005', 'A3', '52'),
        ('2002', 'A2', '20'),
        ('2002', 'A3', '30'),
        ('2002', 'A4', '50'),
        ('2008', 'B2', '90'),
        ('2007', 'B2', '73'),
        ('2007', 'B3', '63');