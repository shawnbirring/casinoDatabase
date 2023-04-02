/*
 * Number of vacation days an employee has available
 */
 
USE Casino_DB;
GO

SELECT Emp_Num, Emp_Vacation_Days
FROM Employee
ORDER BY Emp_Num;
