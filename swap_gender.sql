--Update a table and swap gender values
--Gender Male should be updated to Female and Gender female should be updated to male

create table suraj.People (
	name varchar(25),
	gender varchar(6) check (gender in ('male','female','others'))
	);

insert into suraj.People
values
	('ram','male'),
	('sita','female'),
	('hari','male'),
	('gita','female'),
	('steve','others')


--swap gender
Update suraj.People
set gender=case
	when gender='male' then 'female'
	when gender='female' then 'male'
	else gender
	end;


select * from suraj.People;