# Exercise for Parameter Sensitive Plan Optimization (PSP) in SQL Server 2022

The following is an exercise to learn Parameter Sensitive Plan Optimization in SQL Server 2022.

## Prerequisites

- SQL Server 2022 Evaluation Edition
- VM or computer with at min 2 CPUs and 8Gb RAM.
- SQL Server Management Studio (SSMS). The latest 18.x build or 19.x build will work.
- Download **ostress.exe** from https://aka.ms/ostress. Install using the RMLSetup.msi file that is downloaded. Use all defaults.

## Setup the exercise

1. Create a directory called **c:\sql_sample_databases** to store backups and files.
2. Download a backup of a customized version of the WideWorldImporters sample database from [https://aka.ms/wwi_pspopt](https://aka.ms/wwi_pspopt) from and copy it into c:\sql_sample_databases directory.

**Note**: If you try to restore the default sample WideWorldImporters you can use the populatedata.sql and rebuild_index.sql scripts to customize the database for the exercise.

3. Restore the WideWorldImporters backup. You can edit and use the **restorewwi.sql** script to match the location of your backup and target data and log files. This script assumes c:\sql_sample_databases.
4. Create a new procedure to be used for the workload test using **proc.sql**.
5. Execute the script **setup.sql** from SSMS. This will ensure the WideWorldImporters database is at **dbcompat 150** and clear the query store.

## See a PSP problem for a single query execution

1. Load the script **query_plan_seek.sql** and set the actual execution plan option in SSMS by using the GUI or `<Ctrl>`+`<M>`. Run **query_plan_seek.sql** **twice** in a query window in SSMS. Note the query execution time is fast (< 1 second). Check the timings from SET STATISTICS TIME ON from the second execution. The query is run twice so the 2nd execution will not require a compile. This is the time we want to compare. Note the query plan uses an Index Seek.
2. In a different query window load the script **query_plan_scan.sql** and set the actual execution option in SSMS by using the GUI or `<Ctrl>`+`<M>`. Run **query_plan_scan.sql** in a query windows in SSMS. This will take a few minutes to run. Note the query plan uses an Clustered Index Scan and parallelism.
3. Now go back and run **query_plan_seek.sql** again. Note that even though the query executes quickly (< 1 sec), the timing from SET STATISTICS TIME is significantly longer than the previous execution. Also note the query plan also uses a clustered index scan and parallelism.

## See a workload problem for PSP

**Note**: If you are using a named instance you will need to edit **workload_index_seek.cmd** and **workload_index_scan.cmd** to use<br>`-S.\<instance name>`

1. Execute the script **clear.sql** to clear plan cache and query store. Remember dbcompat is still set to 150.
1. Setup perfmon to capture **`Processor\% Processor Time`** (not Processor Information) and **`SQL Server:SQL Statistics\Batch Requests/sec`** counters.
1. Run **workload_index_seek.cmd 10** from the command prompt. This should finish very quickly. The parameter is the number of users. You may want to increase this for machines with 8 CPUs or more. Observe perfmon counters.
1. Run **workload_index_scan.cmd**. This should take longer but now locks into cache a plan for a scan.
1. Run **workload_index_seek.cmd 10** again. Observe perfmon counters. Notice much higher CPU and much lower batch requests/sec. Also note the workload doesn't finish in a few seconds as before.
1. Hit `<Ctrl>`+`<C>` in the command window for **workload_index_seek.cmd** as it can take minutes to complete.
1. Use the script **suppliercount.sql** to see the skew in supplierID values in the table. This explains why "one size does not fit all" for the stored procedure based on parameter values.

## Solve the problem in SQL Server 2022 with no code changes

1. Let's get this workload to run much faster and consistently using PSP optimization. Execute the T-SQL script **dbcompat160.sql** with SSMS.
2. Run **workload_index_seek.cmd 10** again. Should finish in a few seconds.
3. Run **workload_index_scan.cmd** again.
4. Run **workload_index_seek.cmd 10** again and see that it now finishes again in a few seconds. Observe perfmon counters and see consistent performance.
5. Run the **Top Resource Consuming Queries** report from SSMS (Use Object Explorer and choose Query Store under your database context to find this report) and see that there are two plans for the same stored procedure. The one difference is that there is new OPTION applied to the query for each procedure which is why there are two different "queries" in the Query Store.
6. Execute the script **query_store_plans.sql**. Look into the details of the results to see the query text is the same but slightly different with the option to use variants. But notice the query_hash is the same value.
7. Execute the script **query_store_parent_query.sql** and observe this is the text of the query from the stored procedure without variant options. This is the text from the *parent plan*.
8. Execute the script **query_store_dispatcher_plan.sql**. If you click on the dispatcher_plan value you will see a graphical plan operator called Multiple Plan.
9. To find the parent stored procedure of the statements from variants execute the script **getsprocinqds.sql**.