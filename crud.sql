--Perform Various CRUD Operation using DDL and DML Operations

--create table
create table suraj.book (
	id int identity(1,1) primary key,
	name varchar(25) not null,
	num_pages int
	);

--insert rows
insert into suraj.book(name,num_pages)
values ('science',200),
		('maths',300),
		('social',400),
		('computer',200);

--read
select * from suraj.book order by num_pages;

--update
update suraj.book
set num_pages=num_pages+10
where name like 's%';

--delete
delete from suraj.book
where name='maths';

--truncate
truncate table suraj.book;

--drop
drop table suraj.book;