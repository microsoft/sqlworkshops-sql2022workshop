
-- Step 1: Setup Gapfilling

USE tempdb;
GO

DROP TABLE IF EXISTS #MachineTelemetry;
GO

CREATE TABLE #MachineTelemetry (
	timestamp DATETIME
	, VoltageReading NUMERIC(9, 6)
	, PressureReading NUMERIC(9, 6)
);
GO

INSERT INTO #MachineTelemetry
(
       [timestamp]
       , VoltageReading
       , PressureReading
)
VALUES
  ('2020-09-07 06:14:50.000', NULL, NULL)
, ('2020-09-07 06:14:51.000', 164.990400, 7.223600)
, ('2020-09-07 06:14:52.000', 162.241300, 93.992800)
, ('2020-09-07 06:14:53.000', 163.271200, NULL)
, ('2020-09-07 06:14:54.000', 161.368100, 93.403700)
, ('2020-09-07 06:14:55.000', NULL, NULL)
, ('2020-09-07 06:14:56.000', NULL, 98.364800)
, ('2020-09-07 06:14:59.000', NULL, 94.098300)
, ('2020-09-07 06:15:01.000', 157.695700, 103.359100)
, ('2020-09-07 06:15:02.000', 157.019200, NULL)
, ('2020-09-07 06:15:04.000', NULL, 95.352000)
, ('2020-09-07 06:15:06.000', 159.183500, 100.748200);
GO


-- Step 2: Use FIRST_VALUE to fill in gaps

SELECT timestamp
	   , VoltageReading
	   , FIRST_VALUE (VoltageReading) IGNORE NULLS OVER (
			ORDER BY timestamp ASC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
			) AS [FIRST_VALUE]
FROM #MachineTelemetry
ORDER BY [timestamp];
GO