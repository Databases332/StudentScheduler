USE heroku_9aece095e067a9a;

DROP TABLE IF EXISTS GradeReport,ClassSession,Class,Student,Major;
DROP VIEW StudentDescription;
CREATE TABLE Major
(
	MajorId INTEGER NOT NULL,
	Name VARCHAR(30) NOT NULL,
	PRIMARY KEY(MajorId)
);

CREATE TABLE Student
(
	StudentId INTEGER NOT NULL,
	Name VARCHAR(30) NOT NULL,
	MajorId INTEGER NOT NULL,
	PRIMARY KEY(StudentId),
	FOREIGN KEY(MajorId) REFERENCES Major(MajorId) 
);

CREATE TABLE Class
(
	PreRequisite VARCHAR(8),
	MajorId INTEGER,
	Name VARCHAR(8) NOT NULL,
	PRIMARY KEY(Name),
	FOREIGN KEY (MajorId) REFERENCES Major(MajorId) 
);

CREATE TABLE ClassSession
(
	SessionId INTEGER NOT NULL,
	ClassName VARCHAR(8) NOT NULL,
	Time INTEGER NOT NULL,
	PRIMARY KEY(SessionId),
	FOREIGN KEY (ClassName) REFERENCES Class(Name) 
);

CREATE TABLE GradeReport
(
	SessionId INTEGER NOT NULL,
	StudentId INTEGER NOT NULL,
	Pass BIT NOT NULL
);

CREATE VIEW StudentDescription AS 
    SELECT Student.Name
        , Major.Name as MajorName
        , COUNT(GradeReport.StudentId) AS 'ClassesTaken'
        , Student.StudentId 
    FROM Student 
        INNER JOIN GradeReport ON GradeReport.StudentId = Student.StudentId 
        INNER JOIN Major ON Major.MajorId = Student.MajorId 
    GROUP BY GradeReport.StudentId;
