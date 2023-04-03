/*
 * Number of sick days an employee has available
 */
USE Casino_DB;
GO

SELECT Emp_Num, Emp_Sick_Days
FROM Employee
ORDER BY Emp_Num;