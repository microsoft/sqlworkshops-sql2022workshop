# 5.0 Exercise for data virtualization with SQL Server 2022 using OPENROWSET

This is an exercise to see the fundamental capability of data virtualization using an object storage connector, Azure Blob Storage, with parquet files in SQL Server 2022.

## Prerequisites

- SQL Server 2022 Evaluation Edition with the Database Engine and PolyBase Query Service for External Data Feature installed. You can use the defaults in setup for Polybase. If you did not add the Polybase feature during SQL Server setup, add the feature using SQL Server setup. Then restart SQL Server.
- VM or computer with 2 CPUs and at least 8Gb RAM with the ability to connect to the internet.
- SQL Server Management Studio (SSMS). The latest 18.x build or 19.x build will work.

## Exercise: Use OPENROWSET to query parquet files

1. Execute the script **enablepolybase.sql** to enable the Polybase feature for the instance. If you encounter Msg 46923 you need to add the Polybase feature. The Polybase services do not need to running.
1. Restart SQL Server even if you installed the Polybase feature as part of setup. You can safely stop the Polybase services. They are not required to be running to use the new REST API connectors.
1. Execute the statements in the script **openrowset.sql** to view data from parquet files and a list a files from a public data set in Azure. If you encounter the following error

```sql
Msg 102, Level 15, State 1, Line 5
Incorrect syntax near 'FORMAT'
```
then either Polybase feature is not installed or you have not enabled Polybase in Step 1 and restarted SQL Server in Step 2.