USE ContosoHR;
GO
BEGIN TRANSACTION;
GO
UPDATE dbo.Employees
SET Salary = Salary + 50000
WHERE EmployeeID = 8;
GO
INSERT INTO dbo.AuditEvents VALUES (getdate(), 'troy', 'UPDATE dbo.Employees SET Salary = Salary + 50000 WHERE EmployeeID = 8');
GO
COMMIT TRANSACTION;
GO