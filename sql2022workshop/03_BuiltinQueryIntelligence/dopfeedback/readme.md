# DOP Feedback in SQL Server 2022

This demo will show you how to see how to get consistent performance with less CPU resources for queries that require parallel operators

## Pre-requisites

- SQL Server 2022 Evaluation or Developer Edition
- VM or computer with 8 CPUs and at least 24Gb RAM.
    > **Note:** This exercise is very CPU sensitive. You should execute this exercise on a VM or computer that is "dedicated" to SQL Server and has fast I/O storage. Slow I/O or slow CPU speeds may affect the ability to see the results of this exercise. 
- SQL Server Management Studio (SSMS). The latest 18.x build or 19.x build will work.
- Download **ostress.exe** from https://aka.ms/ostress. Install using the RMLSetup.msi file that is downloaded. Use all defaults.
    > **Note:** If you are using a named instance you will need to edit **workload_index_scan_users.cmd** to include a -S.`<instance name>`

    > **IMPORTANT:** The workload requires queries to have a duration of *at least 10 seconds per execution* to be eligible for DOP feedback. You can use the XEProfiler in SSMS to see how fast your queries are executing. If you run the workload and don't see queries are eligible you can try to edit workload_index_scan_users.cmd to add more users using the -n parameter by providing a value > 1.

## Steps

1. Execute **configmaxdop.sql** to configure MAXDOP to 0 for the instance.
1. Copy the customized **WideWorldImporters** sample database from [https://aka.ms/wwi_dop](https://aka.ms/wwi_dop) to a local directory (The restore script assumes **c:\sql_sample_databases**).

    > **Note:** If you try to restore the default sample WideWorldImporters you can use the restorewwi.sql, populatedata.sql and rebuild_index.sql scripts to customize the database for the exercise.

1. Restore this database to your SQL Server 2022 instance. You can use the provided **restorewwi.sql** script. You may need to change the directory paths for the location of your backup and where you will restore the database files.

    > **IMPORTANT:** If you have permission issues to restore the backup you can try to copy the backup into the default "data" folder for your SQL Server installation and try the restore again. You will need to edit the restorewwi.sql script accordingly. The default for most instances is C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA

1. Execute **proc.sql** to create a stored procedure
1. Execute **dopxe.sql** to create and start an XEvent session. Use SSMS to Watch the XE session to see Live Data.
1. Execute **dopfeedback.sql** to set Query Store settings and db setting for DOP feedback. 
1. Run **workload_index_scan_users.cmd** from a command prompt. After the workload starts go to the next step to see XEvent data. This will take around 15 minutes to run.
1. Look at the XE session live data from the session you created from **dopxe.sql**.

    You should first see a **dop_feedback_eligible_query** event. This will take several minutes to first appear. Then you will see a series of **dop_feedback_provided** and **dop_feedback_validation** events until you see a final **dop_feedback_stabilized** event with a feedback_dop value of 4. Depending on your system it is possible the system can stabilize at a feedback_dop value of 2. If you encounter a **dop_feedback_reverted** event immediately then consider retrying the lab by starting back at **step 5**. If you encounter it more than once, you can try to restart SQL Server and/or the VM or computer.

    > **IMPORTANT:** The workload requires queries to have a duration of *at least 10 seconds per execution* to be eligible for DOP feedback. You can use the XEProfiler in SSMS to see how fast your queries are executing. If you run the workload and don't see queries are eligible you can try to edit workload_index_scan_users.cmd to add more users using the -n parameter by providing a value > 1.

1. Run the script **dop_query_stats.sql** to see the changes in DOP and resulting stats. Note the small decrease in avg duration and decrease in needed CPU across the various **last_dop** values.
1. Run the script **check_query_feedback.sql** to see the persisted DOP feedback. Examine the values in the **feedback_desc** field to see the BaselineStats and LastGoodFeedback values.
1. Look at **Top Resource Consuming Queries** report in SSMS. Change Statistics to Avg for Duration. Notice the decrease over time until stabilization. Do the same for Avg for CPU.