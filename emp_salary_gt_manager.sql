--Find employees with salary more than their managers salary

create table suraj.Employee_Manager(
	EmployeeId int,
	Name varchar(25),
	Department varchar(25),
	Salary float,
	ManagerId int
	);

insert into suraj.Employee_Manager
values
	(1,'one','A',10000,NULL),
	(2,'two','A',8000,1),
	(3,'three','A',11000,1),
	(4,'four','A',9000,2),
	(5,'five','A',7000,2),
	(6,'six','B',10000,NULL),
	(7,'seven','B',8000,6),
	(8,'eight','B',9000,6),
	(9,'nine','B',12000,6),
	(10,'ten','B',10000,6)


select e.EmployeeId, e.Name, e.Department, e.Salary, e.ManagerId
from suraj.Employee_Manager as m, suraj.Employee_Manager as e
where m.EmployeeId=e.ManagerId and e.Salary>m.Salary;
