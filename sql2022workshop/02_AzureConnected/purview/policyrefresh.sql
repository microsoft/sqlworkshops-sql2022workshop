-- Force immediate download of latest published policies
USE master;
GO
exec sp_external_policy_refresh reload;
GO

-- Check the policy cache is updated
USE master;
GO
SELECT * FROM sys.dm_external_policy_cache;
GO