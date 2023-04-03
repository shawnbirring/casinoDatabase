/*
 * Number of labor hours last week?
 */

SELECT SUM(DATEDIFF(hour, sh.Shift_Start_Time, sh.Shift_End_Time)) as total_hours_worked_last_week
FROM Shift sh
WHERE sh.Shift_Start_Time BETWEEN DATEADD(day, -8, GETDATE()) AND GETDATE();