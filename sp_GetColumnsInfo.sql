--Create stored procedure to get
--	schema, table information, column information, databases

CREATE PROCEDURE suraj.sp_GetColumnsInfo @table_name varchar(25), @schema_name varchar(25)
AS
BEGIN
	DECLARE @constraints_table TABLE (
		column_name varchar(25),
		has_pk_constraint varchar(5),
		has_fk_constraint varchar(5),
		has_unique_constraint varchar(5),
		has_check_constraint varchar(5)
		);

	INSERT INTO @constraints_table
	SELECT ccu.COLUMN_NAME, 
		IIF(tc.CONSTRAINT_TYPE='Primary Key','Yes','No') AS has_pk_constraint,
		IIF(tc.CONSTRAINT_TYPE='Foreign key','Yes','No') AS has_fk_constraint,
		IIF(tc.CONSTRAINT_TYPE='Unique','Yes','No') AS has_unique_constraint,
		IIF(tc.CONSTRAINT_TYPE='Check','Yes','No') AS has_ckeck_constraint
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
	INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS ccu
		ON tc.CONSTRAINT_NAME=ccu.CONSTRAINT_NAME
	where ccu.TABLE_NAME=@table_name AND ccu.TABLE_SCHEMA=@schema_name;


	SELECT t.name AS [Table_Name],
		t.object_id AS [Object_id],
		SCHEMA_NAME(t.schema_id) AS [Schema_Name],
		DB_NAME() AS [Database_Name],
		c.name AS [Column_Name],
		c.max_length AS [Max_Length],
		c.precision AS [Precision],
		c.scale AS [Scale],
		IIF(c.is_nullable=1,'Yes','No') AS [Is_Nullable],
		IIF(c.is_identity=1,'Yes','No') AS [Is_Identity],
		IIF(c.is_computed=1,'Yes','No') AS [Is_Computed],
		ISNULL(ct.has_pk_constraint,'No') AS [has_pk_constraint],
		ISNULL(ct.has_fk_constraint,'No') AS [has_fk_constraint],
		ISNULL(ct.has_check_constraint,'No') AS [has_check_constraint],
		ISNULL(ct.has_unique_constraint,'No') AS [has_unique_constraint]
	FROM sys.tables AS t
	INNER JOIN sys.columns AS c ON t.object_id=c.object_id
	LEFT JOIN (SELECT column_name, MAX(has_pk_constraint) AS has_pk_constraint, 
					MAX(has_fk_constraint) AS has_fk_constraint,
					MAX(has_unique_constraint) AS has_unique_constraint,
					MAX(has_check_constraint) AS has_check_constraint
				from @constraints_table
				group by COLUMN_NAME) AS ct 
					ON ct.column_name=c.name
	WHERE t.name=@table_name AND SCHEMA_NAME(t.schema_id)=@schema_name;
END

GO

EXEC suraj.sp_GetColumnsInfo @table_name='Animals', @schema_name='suraj';