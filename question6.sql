/*
 * Any Slot Attendants who have not been assigned to Section NORTH in the last month
 */

SELECT *
FROM Employee
WHERE Employee.Emp_Role = 'R000000004'
AND Employee.Emp_Num NOT IN (
    SELECT Shift_Assigned_To
    FROM Shift
    WHERE Section_ID = 'SEC0000001'
    AND Shift_Start_Time >= DATEADD(month, -1, GETDATE())
);