/*
 * Number of hours each employee worked per week?
 */

USE Casino_DB;
GO

SELECT e.Emp_Num, SUM(DATEDIFF(hour, sh.Shift_Start_Time, sh.Shift_End_Time)) as hours_worked_per_week
FROM Employee e
JOIN Shift sh ON e.Emp_Num = sh.Shift_Assigned_To
JOIN Schedule s ON sh.Sch_ID = s.Sch_ID
GROUP BY e.Emp_Num, s.Sch_Start_Date
ORDER BY e.Emp_Num;
