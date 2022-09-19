USE [WideWorldImporters];
GO
SELECT  Pl.plan_id as QueryStorePlanId, Pl.query_id as QueryStoreQueryId, qvr.query_variant_query_id, qvr.parent_query_id,
qvr.dispatcher_plan_id,OBJECT_NAME(Qry.object_id) as ObjectName, Txt.query_sql_text,
convert(xml,Pl.query_plan)as ShowPlanXML, Qry.query_hash,Rs.first_execution_time, Rs.last_execution_time,
Rs.count_executions AS NumberOfExecutions, Qry.count_compiles AS NumberOfCompiles, RS.avg_rowcount, Rs.max_rowcount,
Qry.initial_compile_start_time, Qry.last_compile_start_time, Pl.plan_type_desc
FROM sys.query_store_runtime_stats AS Rs
JOIN sys.query_store_plan AS Pl
ON Rs.plan_id = Pl.plan_id
JOIN sys.query_store_query_variant qvr
ON Pl.query_id = qvr.query_variant_query_id
JOIN sys.query_store_query as Qry
ON qvr.parent_query_id = Qry.query_id
JOIN sys.query_store_query_text AS Txt  
ON Qry.query_text_id = Txt.query_text_id  
ORDER BY Pl.query_id, Rs.last_execution_time;
GO