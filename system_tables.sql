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
FROM information_schema.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME LIKE 'PK%'
GROUP BY TABLE_SCHEMA, TABLE_NAME;

GO


-- 4. Select query that will generate truncate query for each tables in a schema

SELECT CONCAT('truncate table ',SCHEMA_NAME(schema_id),'.',name,';') AS truncate_query
FROM sys.tables;

GO


-- 5. Select query that will generate select query for each tables in a schema

SELECT CONCAT('Select ', STRING_AGG(COLUMN_NAME,', '), ' From ', TABLE_SCHEMA, '.', TABLE_NAME, ';') AS select_query
FROM INFORMATION_SCHEMA.COLUMNS
GROUP BY TABLE_SCHEMA, TABLE_NAME;

GO