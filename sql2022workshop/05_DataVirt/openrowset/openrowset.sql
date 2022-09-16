--Quick query on a folder to see what files exist on a stored in a publicly available storage account:
SELECT files.filepath()
FROM OPENROWSET(
BULK 'abs://nyctlc@azureopendatastorage.blob.core.windows.net/yellow/puYear=2001/puMonth=1',
FORMAT = 'parquet'
) AS files
GO
--Quick query on a file of parquet files stored in a publicly available storage account:
SELECT *
FROM OPENROWSET(
BULK 'abs://nyctlc@azureopendatastorage.blob.core.windows.net/yellow/puYear=2001/puMonth=1',
FORMAT = 'parquet'
) AS taxidata
GO