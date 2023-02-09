USE master;
GO
CREATE LOGIN [annahoffman@aadsqldboutlook.onmicrosoft.com] FROM EXTERNAL PROVIDER; 
GO
EXEC sp_addsrvrolemember @loginame='annahoffman@aadsqldboutlook.onmicrosoft.com', @rolename='sysadmin';
GO