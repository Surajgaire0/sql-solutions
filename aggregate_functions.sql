--Find min, max, avg and sum of salary for each department

create table suraj.Employee (
	employeeName varchar(20),
	departmentName varchar(20),
	salary money
	);

insert into suraj.Employee
values
	('emp1','A',18000),
	('emp1','A',15000),
	('emp1','B',11000),
	('emp1','B',9000),
	('emp1','A',95000),
	('emp1','A',20000)

select departmentName, 
	min(salary) as min_salary, 
	max(salary) as max_salary, 
	avg(salary) as avg_salary, 
	sum(salary) as sum_salary
from suraj.Employee
group by departmentName;