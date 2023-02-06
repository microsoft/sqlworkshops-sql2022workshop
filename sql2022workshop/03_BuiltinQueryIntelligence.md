
![](./graphics/microsoftlogo.png)

# Workshop: SQL Server 2022 Workshop

#### <i>A Microsoft workshop from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/textbubble.png?raw=true"><b>     SQL Server 2022 Built-in Query Intelligence</b></h2>

SQL Server 2022 provides built-in capabilities to reduce time for query tuning with the Query Store and next generation of Intelligent Query Processing features to help you gain faster and consistent performance with no code changes.

**Watch this video** on built-in query intelligence in SQL Server 2022 on Data Exposed:

<a href="http://www.youtube.com/watch?feature=player_embedded&v=Nd0mKM3O3sQ" target="_blank"><img src="http://img.youtube.com/vi/Nd0mKM3O3sQ/0.jpg" alt="Introducing SQL Server 2022" width="400" height="300" border="10" /></a>

Read through the entire module to learn about all the built-in query intelligent capabilities or go directly to the following exercises in this module to see built-in query intelligence in action:

<dl>

  <dt><a href="#3-0">3.0 Enhancements to Memory Grant feedback</a></dt>
  <dt><a href="#3-1">3.1 Parameter Sensitive Plan optimization</a></dt>
  <dt><a href="#3-2">3.2 DOP Feedback</a></dt>
  
</dl>

You can find demonstrations of other built-in query intelligence capabilities at https://aka.ms/sqlserver2022demos.

## Challenges for query tuning

Developers and SQL experts can all agree that while queries often "just work" meet performance expectations situations arise require performance troubleshooting for query performance and an exercise to tune a query. Tuning query performance can be an expensive and often lengthy process.

## Solutions for query tuning using the Query Store

The Query Store is a built-in set of query performance statistics stored in a user database. The Query Store automatically captures a history of queries, plans, and runtime statistics, and retains these for your review. It separates data by time windows so you can see database usage patterns and understand when query plan changes happened on the server. You can learn more about the Query Store at https://aka.ms/querystore. SQL Server 2022 includes important enhancements to the Query Store to reduce the amount of time for query tuning.

### Query Store on by default

Prior to SQL Server 2022, the Query Store must be enabled using the T-SQL **ALTER DATABASE** statement. For SQL Server 2022, any new database created will have the Query Store enabled by default. Databases that have been restored from previous versions of SQL Server will retain the Query Store settings captured when the database was backed up. The Query Store has had several enhancements since its inception in SQL Server 2016 that allow users to enable the Query Store without significantly affecting application performance. In addition, several new settings are possible in the Query Store to allow users to more easily control how query performance information is captured and cleaned up. Users have the option to disable the Query Store at any time using the T-SQL **ALTER DATABASE** statement.

### Query Store hints

Query Store hints provide an easy-to-use method for shaping query plans without changing application code. You can take any query that is stored in the Query Store and use system stored procedures to apply a query hint to affect the query plan with the intention of improving query performance with out changing application code. For example, you could apply a query store hint to require a query to use a specific MAXDOP value without changing the query text.

Query store hints are not intended to be used as a normal step to tune query performance but can be a useful tool for query tuning especially if you cannot change the query text in an application. In addition, some new Intelligent Query Processing features use a query store hint. You can view any persisted query store hints in the **sys.query_store_query_hints** catalog view. You can learn more about query store hints at https://aka.ms/querystorehints.

### Query Store for read replicas

While the Query Store is beneficial for reducing the amount of time required to tune queries or easily identify query performance issues, performance information is only available for queries executed against the primary replica in an Always On Availability Group. In SQL Server 2022 and new option is available using the T-SQL **ALTER DATABASE** statement to enable the Query Store to collect performance information for read-only queries executed on secondary replicas. All performance information for all replicas is persisted on the primary replica. New information is captured in the Query Store to indicate which replica is associated with a query or query plan.

> NOTE: Trace flag 12606 is required in order to be able enable Query Store for secondary replicas

### Query store for Intelligent Query Processing

While the Query Store collected key performance information for queries, the query processor in SQL Server 2022 will also use the Query Store to persist information to accelerate query performance including to support features such as Optimized Plan Forcing, Memory Grant feedback, Cardinality Estimation (CE) Model feedback, and Degree of Parallelism (DOP) feedback.

<p style="border-bottom: 1px solid lightgrey;"></p>

## Solutions for faster performance with no code changes using the next generation of Intelligent Query Processing (IQP)

Intelligent Query Processing is a family of capabilities built into the query processor in the database engine designed to accelerate performance with no code changes. The next generation of Intelligent Query Processing is built on a foundation of capabilities found in SQL Server 2017 and 2019 as seen in the following figure:

![SQL Server Intelligent Query Processing Feature Family](./graphics/iqp-feature-family.svg)

As you can see in this diagram there have been several IQP features that were part of SQL Server 2017 and SQL Server 2019. SQL Server 2022 adds several new capabilities for IQP. You can keep up to date with all the latest on IQP capabilities at https://aka.ms/iqp. Let's examine each of these new capabilities.

The database engine uses two principles to make decisions for Intelligent Query Processing (IQP):

- Avoid causing any query performance regressions by using a new method or automation.
- Provide a method at the database or query level to disable a specific IQP capability. This allows you to pick and choose which IQP feature you want enabled at the database or query level while using other IQP feature depending on your dbcompat level.

The rest of this module is organized into capabilities based on:

- Features available based on any dbcompat level
- Additional features available based on dbcompat level 140+
- Additional features available based on dbcompat level 160

## Capabilities after upgrading to SQL Server 2022

If you upgrade to SQL Server 2022 there are new capabilities to accelerate performance independent of the database compatibility level (dbcompat) you use for your database. This allows you to take advantage of new features even if you need to use a dbcompat from a previous version of SQL Server. This includes **Approximate Percentile Functions** and **Optimized Plan Forcing**. Learn more about dbcompat at https://aka.ms/dbcompat.

### Approximate Percentile functions

SQL Server includes two T-SQL functions to help analytic workload calculate a percentile of a range of values: **PERCENTILE_CONT** and **PERCENTILE_DISC**. SQL Server 2022 provides *approximate* equivalent to these two functions: **APPROX_PERCENTILE_CONT** and **APPROX_PERCENTILE_DISC**. These could can be extremely useful for analytic workloads for with exceptionally large sets of data. These functions will perform faster, and the implementation guarantees up to a 1.33% error rate within a 99% probability.

### Optimized Plan Forcing

Optimized plan forcing is a new capability in SQL Server 2022 intended to reduce the time it takes to compile certain queries if the query plan is forced in Query Store.

Some queries by their nature can take a significant amount of time to compile. Optimized plan forcing provides a method to reduce the time it takes to compile a query by storing in the Query Store *compilation steps* for eligible queries that have query plans that are forced in the Query Store. Query plan forcing allows you to lock in a query plan for a specific query. The next time a query needs to be compiled that has optimized plan forcing enabled, compilation steps are used to significantly accelerate the compile phase to execute a query. You can learn more about Optimized Plan Forcing at https://learn.microsoft.com/sql/relational-databases/performance/optimized-plan-forcing-query-store.

<p style="border-bottom: 1px solid lightgrey;"></p>

## SQL Server 2022 additional capabilities using dbcompat 140 or greater

You can get additional Intelligent Query Processing capabilities to enhance memory grant feedback in SQL Server 2022 if you are using dbcompat 140 or greater. This includes **Memory Grant Percentiles** and **Memory Grant Feedback**. Memory grant feedback was introduced in SQL Server 2017 (batch mode) and SQL Server 2019 (row mode). Memory grant feedback is a mechanism where the query processor will *learn* from execution feedback to adjust a memory grant for further executions thereby avoiding or reducing tempdb spills and RESOURCE_SEMAPHORE waits.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="3-0">     3.0 Enhancements to Memory Grant Feedback</a></b></h2>

### Memory Grant Feedback Percentiles

Prior to SQL Server 2022, memory grant feedback was based on the most recent execution for a specific query. This could result in some cases of different feedback adjustments which could lead to the query processor to disable memory grant feedback for a specific query. In SQL Server 2022, memory grant feedback uses a percentile method to look at memory grants over several executions before using a memory grant feedback.

### Memory Grant Feedback Persistence

Prior to SQL Server 2022, memory grant feedback was only stored in a cached plan in memory. If the cache plan was evicted, memory grant feedback would have to be recalculated on new query executions. In SQL Server 2022, if the Query Store. is enabled memory grant feedback will be persisted in the Query Store. You can view memory grant feedback persistence from the **sys.query_store_plan_feedback** catalog view.

You can learn more about memory grant feedback at https://learn.microsoft.com/sql/relational-databases/performance/intelligent-query-processing-feedback#memory-grant-feedback.

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityiqp">     Exercise: Automatic performance healing with Memory Grant Feedback Persistence </a></b></h2>

In this exercise you will learn how to see how memory grant feedback can improve query performance automatically including persisting feedback to the Query Store.

Follow the instructions in the readme.md file in the **[sql2022workshop\03_BuiltinQueryIntelligence\persistedmgf](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/03_BuiltinQueryIntelligence/persistedmgf)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

## SQL Server 2022 additional capabilities using dbcompat 160 or greater

You can get additional Intelligent Query Processing capabilities if you use dbcompat 160 or greater. This includes **Parameter Sensitive Plan Optimization**, **Cardinality Estimation (CE) Feedback**, and **Degree of Parallelism (DOP)**.Feedback.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="3-1">     3.1 Parameter Sensitive Plan Optimization</a></b></h2>

When a query is compiled, values for any parameters used in queries in a stored procedure or parameterized query are using to make decisions to build an execution plan. This concept is commonly known as *parameter sniffing*. Only one query plan can exist in cache for statements in a stored procedure or parameterized query. In most cases this does not result in any performance problems for applications. However, there are situations where the data retrieved for queries based on parameters can be *skewed*, or not evenly distributed. In these cases, the single cache plan may not be optimal for different parameter values. This problem is known as a *parameter sensitive plan*.

In SQL Server 2022, the optimizer can detect parameter sensitive plan scenarios and cache multiple plans for the same stored procedure or parameterized query. The optimizer uses a concept called *query variants* to aggregate sets of parameter values to match a query plan best suited for those parameter values.

You can learn more about Parameter Sensitive Plan Optimization at https://aka.ms/pspopt.

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityquerystore">     Exercise: Get consistent performance with Parameter Sensitive Plan optimization</a></b></h2>

In this exercise, you will learn how Parameter Sensitive Plan Optimization can help gain consistent performance for stored procedures that are sensitive to parameter values.

Follow the instructions in the readme.md file in the **[sql2022workshop\03_BuiltinQueryIntelligence\pspopt](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/03_BuiltinQueryIntelligence/pspopt)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

### Cardinality Estimation (CE) Feedback

In SQL Server 2014 with dbcompat 120 Microsoft started using a new *model* within the query processor to make certain assumptions about cardinality estimation for certain query patterns. In some cases, the new model generated a more correct query plan but might result in slower performance than with the *legacy* CE model. The CE model scenarios include correlation, join containment, and row goal. Since SQL Server 2014 several options have been included to uses the legacy CE model or control CE behavior at the query level with trace flags or query hints.

In SQL Server 2022, if the Query Store is enabled, the optimizer will evaluate highly repetitive queries that match patterns for CE model scenarios where the model may be making an incorrect assumption. The optimizer will then attempt to test and verify whether a query hint could be used to allow the query to perform faster. Upon verification of faster performance, a query hint will be persisted in the Query Store to be used for future query executions. You can see any applied query hints for CE feedback in the **sys.query_store_query_hints** catalog view and CE feedback details in the **sys.query_store_plan_feedback** catalog view. CE feedback will not be used if the legacy CE model has been enabled, if a query plan is forced in the query store, or a query has existing query store hints.

You can learn more about CE feedback at https://aka.ms/cefeedback.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pencil2.png?raw=true"><b><a name="3-2">     3.2 DOP Feedback</a></b></h2>

The optimizer in SQL Server will in some cases run pieces of the query plan called operators using parallelism with multiple concurrent threads. The number of threads used for a query plan operator is called Degree of Parallelism (DOP). SQL Server can control the maximum number of threads per operator using server, database, resource group, or query settings called max degree of parallelism or MAXDOP. Setting the right MAXDOP for a SQL Server deployment can be a complex and sometimes difficult exercise.

In SQL Server 2022, the optimizer can use a technique called DOP feedback to find the *parallel efficiency* for a query. Parallel efficiency is the minimum DOP for a query that can result in the same overall query duration (factoring our common waits). Reducing the DOP for a query can provide more threads and CPU resources for other queries for application.

DOP feedback requires the Query Store to be enabled, dbcompat 160, and a database setting called DOP_FEEDBACK to be turned on. With these settings, the optimizer will work in coordination with Query Store background tasks to look for repetitive and long-running queries that could benefit from a lower DOP. A feedback cycle will be used to validate an adjusted query duration (factoring out waits) will not regress with a lower DOP value and that lower overall CPU is observed for the query. After a period of validation, a lower DOP is considered stabilized and will be persisted in the Query Store. The optimizer will continue to validate lower DOP values in a stepwise down fashion to find the best parallel efficiency or a minimum DOP which is 2. DOP feedback will never increase DOP and will honor the MAXDOP setting for a query depending on server, database, resource governor, or query hint that has been applied.

DOP feedback does not require recompilation but validation will be examined on any new query compilation. You can observe persisted DOP feedback values in the **sys.query_store_plan_feedback** catalog view. You can see what is the most recent DOP used for a query using the last_dop column from the Dynamic Management View sys.dm_exec_query_stats and the **sys.query_store_runtime_stats** catalog view.

You can learn more about DOP feedback at https://aka.ms/dopfeedback.

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/point1.png?raw=true"><b><a name="activityquerystore">     Exercise: Gain parallel efficiency with DOP Feedback</a></b></h2>

In this exercise you will learn how SQL Server in cooperation with the Query Store can achieve parallel efficiency for a query over time.

Follow the instructions in the readme.md file in the **[sql2022workshop\03_BuiltinQueryIntelligence\dopfeedback](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/main/sql2022workshop/03_BuiltinQueryIntelligence/dopfeedback)** folder.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/geopin.png?raw=true"><b>  Next Steps</b></h2>

Next, Continue to <a href="./04_Engine.md" target="_blank"><i>Security, Scalability, and Availability</i></a>.
