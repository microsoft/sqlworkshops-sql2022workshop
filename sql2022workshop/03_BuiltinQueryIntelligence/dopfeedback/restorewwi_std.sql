USE master;
GO
DROP DATABASE IF EXISTS WideWorldImporters;
GO
-- Edit the locations for files to match your storage
RESTORE DATABASE WideWorldImporters FROM DISK = 'c:\sql_sample_databases\wwi_dop_std.bak' with
MOVE 'WWI_Primary' TO 'c:\sql_sample_databases\WideWorldImporters.mdf',
MOVE 'WWI_UserData' TO 'c:\sql_sample_databases\WideWorldImporters_UserData.ndf',
MOVE 'WWI_Log' TO 'c:\sql_sample_databases\WideWorldImporters.ldf',
stats=5;
GO