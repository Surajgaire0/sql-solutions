--Find nth highest salary employee in each department

create table suraj.Employee (
	employeeName varchar(20),
	departmentName varchar(20),
	salary money
	);

insert into suraj.Employee
values
	('emp1','A',18000),
	('emp2','A',15000),
	('emp3','B',11000),
	('emp4','B',9000),
	('emp5','A',95000),
	('emp6','A',20000),
	('emp7','B',45000),
	('emp8','B',65000)

Go

--stored procedure to find nth highest salary
--Parameters: n --> for nth highest
create proc suraj.sp_NthHighestSalary @n tinyint
as
	select * from (
		select departmentName, employeeName, Salary,
			Rank() over(partition by departmentName order by salary desc) as rank_salary
		from suraj.Employee
		) as innerquery
	where rank_salary=@n;
	
Go

exec suraj.sp_NthHighestSalary @n=1;