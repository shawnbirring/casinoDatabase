/*
 * List of which employees worked breaker shifts in the last month.
 */
USE Casino_DB;
GO

SELECT Employee.Emp_Num, Employee.Emp_First_Name
FROM Employee
WHERE Employee.Emp_Role = 'R000000004'
AND Employee.Emp_Num NOT IN (
    SELECT Shift_Assigned_To
    FROM Shift
    WHERE Shift_Is_Breaker = '0'
    AND Shift_Covered_By = NULL;
    AND Shift_Start_Time >= DATEADD(month, -1, GETDATE())
);