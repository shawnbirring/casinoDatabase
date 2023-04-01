/*
 * How many breaker shifts are scheduled this week?
 */

SELECT COUNT(*) AS breaker_shifts_this_week
FROM Shift
WHERE Shift_Is_Breaker = 1
AND Sch_ID = 'SCH01';