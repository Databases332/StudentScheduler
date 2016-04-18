USE scheduler;

DROP TABLE IF EXISTS GradeReport,ClassSession,Class,Student,Major;
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

