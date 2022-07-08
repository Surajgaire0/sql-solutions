--Write a stored procedure to generate records by gender being passed as parameter

CREATE TABLE suraj.Person (
	fname varchar(10),
	lname varchar(25),
	gender varchar(6) check (gender in ('male','female','others'))
	);

INSERT INTO suraj.Person
VALUES
	('Suresh','Pokhrel','male'),
	('padam','neupane','male'),
	('sita','pun','female'),
	('gita','pun','female'),
	('ram','pandey','others')

GO

CREATE PROC suraj.sp_GetRecordByGender @gender VARCHAR(6)
AS
BEGIN
	SELECT * FROM suraj.Person
	WHERE gender=@gender;
END

GO

EXEC suraj.sp_GETRecordByGender @gender='others';