--Write a SQL Query to generate following results

-- 1. Select Query that will return schema_name, along with all tables present in that schema

SELECT SCHEMA_NAME(schema_id) AS [Schema_name],
	STRING_AGG(name,', ') AS [Table_name]
FROM sys.tables
GROUP BY schema_id;

GO


-- 2. Select query that will return schema_name, table_name and comma separated list of fields present in that table

SELECT TABLE_SCHEMA, TABLE_NAME, STRING_AGG(COLUMN_NAME,', ') AS COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
GROUP BY TABLE_SCHEMA, TABLE_NAME
ORDER BY TABLE_SCHEMA;

GO


-- 3. Select query that will return schema_name, table_name and comma separated list of primary key present in that table

SELECT TABLE_SCHEMA,
	TABLE_NAME,
	STRING_AGG(COLUMN_NAME,', ') AS PRIMARY_KEY_FIELDS
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS u
WHERE EXISTS (SELECT name 
		FROM sys.key_constraints AS c 
		WHERE c.[type]='PK' AND u.CONSTRAINT_NAME=c.name)
GROUP BY TABLE_SCHEMA, TABLE_NAME;

GO


-- 4. Select query that will generate truncate query for each tables in a schema

DECLARE @schema_name varchar(50);
SET @schema_name='suraj';

SELECT CONCAT('truncate table ',SCHEMA_NAME(schema_id),'.',name,';') AS truncate_query
FROM sys.tables
WHERE SCHEMA_NAME(schema_id)=@schema_name;

GO


-- 5. Select query that will generate select query for each tables in a schema

DECLARE @schema_name varchar(50);
SET @schema_name='suraj';

SELECT TABLE_SCHEMA AS schema_name, 
	TABLE_NAME AS table_name,
	CONCAT('Select ', STRING_AGG(COLUMN_NAME,', '), ' From ', TABLE_SCHEMA, '.', TABLE_NAME, ';') AS query
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA=@schema_name
GROUP BY TABLE_SCHEMA, TABLE_NAME;

GO