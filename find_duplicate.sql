--Find all employees having duplicate entries in following table

create table suraj.EmpSalary (
	[Name] varchar(20),
	Salary int
	);

insert into suraj.EmpSalary
values
	('A',24000),
	('B',20000),
	('C',34000),
	('D',90000),
	('E',45000),
	('F',60000),
	('G',87000),
	('A',24000),
	('D',90000)

select [Name], Salary
from suraj.EmpSalary
group by [Name], Salary
having count(*)>1;