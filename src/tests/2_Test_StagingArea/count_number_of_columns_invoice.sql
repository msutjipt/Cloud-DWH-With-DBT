SELECT COUNT(*) AS count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'stg_Invoice' and DATA_TYPE = 'binary'
HAVING COUNT(*) != 3