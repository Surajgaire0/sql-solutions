--Write a trigger that gets fired each time insertion and deletion is made in employee table and 
--corresponding inserted/deleted record is dumped into audit table with operation field as INSERTED/DELETED

CREATE TABLE suraj.Emp (
	employeeName VARCHAR(20),
	departmentName VARCHAR(20),
	salary MONEY
	);

CREATE TABLE suraj.EmpAudit(
	employeeName VARCHAR(20),
	departmentName VARCHAR(20),
	salary MONEY,
	operation VARCHAR(10),
	eventdate DATETIME
	);

Go

CREATE TRIGGER Employee_Insert_Trigger
ON suraj.Emp
AFTER INSERT, DELETE
AS
BEGIN

	IF EXISTS(Select * FROM INSERTED)
		INSERT INTO suraj.EmpAudit
		SELECT employeeName, departmentName, salary, 'INSERTED', GETDATE()
		FROM INSERTED

	IF EXISTS(Select * FROM DELETED)
		INSERT INTO suraj.EmpAudit
		SELECT employeeName, departmentName, salary, 'DELETED', GETDATE()
		FROM DELETED
END