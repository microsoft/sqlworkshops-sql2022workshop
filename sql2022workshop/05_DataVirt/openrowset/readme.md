# 5.0 Exercise for data virtualization with SQL Server 2022 using OPENROWSET

This is an exercise to see the fundamental capability of data virtualization using an object storage connector, Azure Blob Storage, with parquet files in SQL Server 2022.

## Prerequisites

- SQL Server 2022 Evaluation Edition with the Database Engine and PolyBase Query Service for External Data Feature installed. You can use the defaults in setup for Polybase.
- VM or computer with 2 CPUs and at least 8Gb RAM with the ability to connect to the internet.
- SQL Server Management Studio (SSMS). The latest 18.x build or 19.x build will work.

## Exercise: Use OPENROWSET to query parquet files

1. Execute the script **enablepolybase.sql** to enable the Polybase feature for the instance.
1. Restart SQL Server.
1. Execute the statements in the script **openrowset.sql** to view data from parquet files and a list a files from a public data set in Azure.