/*
 * How many Slot Attendants are scheduled today?
 */
SELECT COUNT(*) AS Slot_Attendants_Scheduled_Today
FROM Shift
JOIN Employee ON Shift.Shift_Assigned_To = Employee.Emp_Num
WHERE CAST(Shift_Start_Time AS DATE) = CAST(GETDATE() AS DATE)
AND CAST(Shift_End_Time AS DATE) = CAST(GETDATE() AS DATE)
AND Employee.Emp_Role = 'R000000004';