/*
 * How many breaker shifts are scheduled this week?
 */

SELECT COUNT(*) AS breaker_shifts_this_week
FROM Shift
WHERE Shift_Is_Breaker = 1
AND Shift_Start_Time >= DATEADD(wk, DATEDIFF(wk, 0, GETDATE()), 0)
AND Shift_Start_Time < DATEADD(wk, DATEDIFF(wk, 0, GETDATE()) + 1, 0);
