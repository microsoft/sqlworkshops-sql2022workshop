-- Use LAST_VALUE to fill in gaps
USE GapFilling;
GO
SELECT timestamp,
	    VoltageReading,
		LAST_VALUE (VoltageReading) IGNORE NULLS OVER
		(ORDER BY timestamp DESC) AS [LAST_VALUE]
FROM MachineTelemetry
ORDER BY [timestamp];
GO