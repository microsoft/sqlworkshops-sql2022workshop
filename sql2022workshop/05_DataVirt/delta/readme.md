# 5.2 Exercise for Data Virtualization using S3 providers for SQL Server 2022 for delta tables

This is an exercise for data virtualization in SQL Server 2022 using the new REST API "connector" for S3 object storage for delta tables. Delta tables are supported with any of the new REST API connectors including Azure Blob Storage (abs), Azure Data Lake Storage (adls), and S3 compatible storage. This exercise will focus on how to use S3 compatible storage.

## Prerequisites

- You can view the T-SQL notebook with results in a web browser in Github or with Azure Data Studio.

## Exercise for using delta tables with S3

**Review** all the steps and queries in the Azure Data Studio notebook **querydelta.ipynb**. You can only execute the steps in this notebook if you complete the prereqs and steps in the [minio](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/05_DataVirt/minio) exercise.