USE ContosoHR;
GO
-- See who dropped the ledger table
SELECT
t.[principal_name]
, t.[commit_time]
, h.[schema_name] + '.' + h.[table_name] AS [table_name]
, h.[ledger_view_schema_name] + '.' + h.[ledger_view_name] AS [view_name]
, h.[operation_type_desc]
FROM sys.ledger_table_history h
JOIN sys.database_ledger_transactions t
ON h.transaction_id = t.transaction_id;
GO