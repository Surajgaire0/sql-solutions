-- Create stored procedure to get 
-- 	details of each of the tables in each database which includes- schema name, table size (space used), no. of rows
-- 	table usage, last accessed date/time

CREATE PROCEDURE suraj.sp_GetAllTableInfo
AS
BEGIN
	SELECT Distinct DB_NAME() AS [Database_Name],
		t.name AS [Table],
		SCHEMA_NAME(t.schema_id) AS [Schema],
		t.object_id AS [Object_Id],
		t.create_date AS [Created_Date],
		t.modify_date AS [Modified_Date],
		p.rows AS [Rows],
		a.total_pages * 8 AS [Total_Space_KB],
		a.used_pages * 8 AS [Used_Space_KB]
	FROM sys.tables AS t
	INNER JOIN sys.partitions AS p ON t.object_id=p.object_id
	INNER JOIN (SELECT SUM(total_pages) AS total_pages,
			SUM(used_pages) AS used_pages,
			container_id
		FROM sys.allocation_units
		GROUP BY container_id
		) AS a 
		ON a.container_id=p.hobt_id;
END

GO

EXEC suraj.sp_GetAllTableInfo;