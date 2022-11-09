SELECT @@SERVERNAME AS SERVERNAME, CASE   
      WHEN SERVERPROPERTY('EngineEdition') < 5 THEN 'SQL Server'
	  WHEN SERVERPROPERTY('EngineEdition') = 8 THEN 'Azure SQL Mananaged Instance'
END   
GO
SELECT DATABASEPROPERTYEX('WideWorldImporters', 'Updateability');
GO
SELECT DATABASEPROPERTYEX('WideWorldImporters', 'Version');
GO