--Write a SQL query to generate level of hierarchy

CREATE TABLE suraj.Hierarchy (
	Id INT NOT NULL UNIQUE,
	[Name] VARCHAR(25) NOT NULL,
	ManagerId INT
	);

INSERT INTO suraj.Hierarchy
VALUES
	(1,'Keith',NULL),
	(2,'Josh',1),
	(3,'Robin',1),
	(4,'Raja',2),
	(5,'Tridi',NULL),
	(6,'Arijit',5),
	(7,'Amit',5),
	(8,'Dev',6);


--find level
WITH HierarchyCTE AS (
	(SELECT Id, [Name], ManagerId, 1 AS [Level]
	FROM suraj.Hierarchy
	WHERE ManagerId IS NULL)
	UNION ALL
	(SELECT e.Id, e.[Name], e.ManagerId, m.[Level]+1 AS [Level]
	FROM HierarchyCTE AS m
	INNER JOIN suraj.Hierarchy AS e
	ON m.Id=e.ManagerId)
	)

Select * from HierarchyCTE;