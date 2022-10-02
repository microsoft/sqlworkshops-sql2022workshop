-- Use FIRST_VALUE to fill in gaps
USE GapFilling;
GO
SELECT timestamp
	   , VoltageReading
	   , FIRST_VALUE (VoltageReading) IGNORE NULLS OVER (
			ORDER BY timestamp ASC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING 
			) AS [FIRST_VALUE]
FROM MachineTelemetry
ORDER BY [timestamp];
GO