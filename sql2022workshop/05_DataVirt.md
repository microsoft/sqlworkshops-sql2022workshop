![](./graphics/microsoftlogo.png)

# Workshop: SQL Server 2022 Workshop

#### <i>A Microsoft workshop from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/textbubble.png?raw=true"><b>     SQL Server 2022 Data Virtualization and Object Storage</b></h2>

SQL Server 2022 has enhancements to data virtualization and object storage including:

- REST API data sources including Azure Blob Storage (abs), Azure Data Lake Storage (adls), and S3 compatible storage providers.
- Native support for parquet and delta table files.
- Create tables as files in data sources based on a SELECT of SQL data (CETAS).
- Backup/restore of SQL Server databases in native format to and from S3 compatible object storage providers.

You will cover the following topics in this Module:

<dl>

  <dt><a href="#5-0">5.0 Using OPENROWSET with parquet</a></dt>
  <dt><a href="#5-0">5.1 Using parquet files with s3</a></dt>
  <dt><a href="#5-1">5.2 Using delta table files with s3</a></dt>
  <dt><a href="#5-2">5.3 Backup and Restore with s3</a></dt>
  <dt><a href="#5-2">5.4 Using s3 with minio for data virtualization and object storage</a></dt>
  
</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="5-0">     5.0 Using parquet files with s3</a></b></h2>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityiqp">     Exercise: Access data from parquet files with OPENROWSET</a></b></h2>

Follow the instructions in the readme.md file in the **[sql2022workshop\05_DataVirt\openrowset](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/05_DataVirt/openrowset)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="5-1">     5.1 Using parquet files with s3</a></b></h2>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityiqp">     Exercise: Access parquet files with T-SQL using s3 compatible object storage</a></b></h2>

Follow the instructions in the readme.md file in the **[sql2022workshop\05_DataVirt\parquet](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/05_DataVirt/parquet)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="5-2">     5.2 Using delta table files with s3</a></b></h2>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityquerystore">     Exercise: Access delta table files with T-SQL using s3 compatible object storage</a></b></h2>

Follow the instructions in the readme.md file in the **[sql2022workshop\05_DataVirt\delta](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/05_DataVirt/delta)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="5-3">     5.3 Backup and Restore with s3</a></b></h2>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityquerystore">     Exercise: Backup and Restore SQL Server databases using s3 compatible object storage</a></b></h2>

Follow the instructions in the readme.md file in the **[sql2022workshop\05_DataVirt\s3objectstorage](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/05_DataVirt/s3objectstorage)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="5-0">     5.4 Using s3 with minio for data virtualization and object storage</a></b></h2>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityiqp">     Exercise: How to use minio for s3 data virtualization and object storage</a></b></h2>

Follow the instructions in the readme.md file in the **[sql2022workshop\05_DataVirt\minio](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/05_DataVirt/minio)** folder.

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/geopin.png?raw=true"><b>  Next Steps</b></h2>

Next, Continue to <a href="./06_TSQL.md" target="_blank"><i>T-SQL enhancements in SQL Server 2022</i></a>.
