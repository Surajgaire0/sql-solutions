--Write a query to identify and delete duplicate records from following table

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

--find duplicates
select [Name], Salary
from suraj.EmpSalary
group by [Name], Salary
having count(*)>1;


--remove duplicates
select [Name], Salary
into #tempEmpSalary
from suraj.EmpSalary
group by [Name], Salary;

truncate table suraj.EmpSalary;

insert into suraj.EmpSalary
select * from #tempEmpSalary;

--see final result
select * from suraj.EmpSalary;