/*
 * How many breaker shifts are scheduled this week?
 */

SELECT COUNT(*) AS Breaker_Shifts_This_Week
FROM Shift
WHERE Shift_Is_Breaker = 1
AND Shift_Start_Time >= DATEADD(wk, DATEDIFF(wk, 0, GETDATE()), 0)
AND Shift_Start_Time < DATEADD(wk, DATEDIFF(wk, 0, GETDATE()) + 1, 0);
