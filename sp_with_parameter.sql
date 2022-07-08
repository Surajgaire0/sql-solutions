--Write a stored procedure to generate records by gender being passed as parameter

CREATE TABLE suraj.Gender (
	id int identity(1,1) primary key,
	gender varchar(6) check (gender in ('male','female','others'))
	);

GO

CREATE PROC suraj.sp_RecordByGender @gender VARCHAR(6)
AS
BEGIN
	INSERT INTO suraj.Gender(gender)
	VALUES (@gender)
END

GO

EXEC suraj.sp_RecordByGender @gender='others';