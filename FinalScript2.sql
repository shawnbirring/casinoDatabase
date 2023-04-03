USE Casino_DB
GO

/*
 * Number of hours each employee worked per week?
 */

SELECT e.Emp_Num, SUM(DATEDIFF(hour, sh.Shift_Start_Time, sh.Shift_End_Time)) as hours_worked_per_week
FROM Employee e
JOIN Shift sh ON e.Emp_Num = sh.Shift_Assigned_To
JOIN Schedule s ON sh.Sch_ID = s.Sch_ID
GROUP BY e.Emp_Num, s.Sch_Start_Date
ORDER BY e.Emp_Num;

/*
 * Number of labor hours last week?
 */

SELECT SUM(DATEDIFF(hour, sh.Shift_Start_Time, sh.Shift_End_Time)) as total_hours_worked_last_week
FROM Shift sh
WHERE sh.Shift_Start_Time BETWEEN DATEADD(day, -8, GETDATE()) AND GETDATE();

/*
 * List of which employees worked breaker shifts in the last month.
 */

SELECT *
FROM Employee
WHERE Employee.Emp_Role = 'R000000004'
AND Employee.Emp_Num NOT IN (
    SELECT Shift_Assigned_To
    FROM Shift
    WHERE Shift_Is_Breaker = '0'
    AND Shift_Covered_By = NULL
    AND Shift_Start_Time >= DATEADD(month, -1, GETDATE())
);

/*
 * How many breaker shifts are scheduled this week?
 */

SELECT COUNT(*) AS Breaker_Shifts_This_Week
FROM Shift
WHERE Shift_Is_Breaker = 1
AND Shift_Start_Time >= DATEADD(wk, DATEDIFF(wk, 0, GETDATE()), 0)
AND Shift_Start_Time < DATEADD(wk, DATEDIFF(wk, 0, GETDATE()) + 1, 0);

/*
 * How many Slot Attendants are scheduled today?
 */

SELECT COUNT(*) AS Slot_Attendants_Scheduled_Today
FROM Shift
JOIN Employee ON Shift.Shift_Assigned_To = Employee.Emp_Num
WHERE CAST(Shift_Start_Time AS DATE) = CAST(GETDATE() AS DATE)
AND CAST(Shift_End_Time AS DATE) = CAST(GETDATE() AS DATE)
AND Employee.Emp_Role = 'R000000004';

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

/*
 * Number of active Written Warning (WW) employee A has?
 */

SELECT COUNT(*) AS Active_Warnings
FROM Written_Warning
WHERE WW_Recipient = 'E000000006' AND WW_Is_Active = 'Yes';

/*
 * List of active WW sorted by date and employee
 */

SELECT *
FROM Written_Warning
WHERE WW_Is_Active = 'Yes'
ORDER BY WW_Date_Issued, WW_Recipient;

/*
 * A list of an employee's discipline/performance actions
 */

SELECT WW_Details, WW_Date_Issued, WW_Is_Active
FROM Written_Warning
WHERE WW_Recipient = 'E000000006';

/*
 * Number of sick days an employee has available
 */

SELECT Emp_Num, Emp_Sick_Days
FROM Employee
ORDER BY Emp_Num;

/*
 * Number of vacation days an employee has available
 */

SELECT Emp_Num, Emp_Vacation_Days
FROM Employee
ORDER BY Emp_Num;

/*
 * Statistics on Employees:
 * Number of Female/Male employees,
 * Average age of employees?
 * Number of employees over 50?
 * Under 30
 */

SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Emp_Gender = 'F' THEN 1 ELSE 0 END) AS Female_Emp,
    SUM(CASE WHEN Emp_Gender = 'M' THEN 1 ELSE 0 END) AS Male_Emp,
    AVG(DATEDIFF(year, Emp_DOB, GETDATE())) AS Average_Age,
    SUM(CASE WHEN DATEDIFF(year, Emp_DOB, GETDATE()) > 50 THEN 1 ELSE 0 END) AS Emp_Over_50,
    SUM(CASE WHEN DATEDIFF(year, Emp_DOB, GETDATE()) < 30 THEN 1 ELSE 0 END) AS Emp_Under_30
FROM Employee;

/*
 * List of employees who has the mandatory certification expiring in the next 6 weeks
 */

SELECT R_ID, R_Training_Attendee, Cert_ID, DATEADD(day, R_Training_Valid_Duration, R_Training_Date) AS Cert_Expiration_Date
FROM Regulatory_Training
WHERE R_Training_Status = 'YES'
	AND DATEADD(day, R_Training_Valid_Duration, R_Training_Date) <= DATEADD(WEEK, 6, GETDATE())
ORDER BY R_Training_Attendee;

/*
 * List of employees who need updated in-house training
 */

SELECT DISTINCT Emp_Num, Emp_First_Name, Emp_Last_Name, IH_ID
FROM Employee
INNER JOIN InHouse_Training
ON Employee.Emp_Num = InHouse_Training.IH_Training_Attendee
WHERE (InHouse_Training.IH_Training_Status = 'NO')
OR (DATEDIFF(day, InHouse_Training.IH_Training_Date, GETDATE()) > InHouse_Training.IH_Training_Valid_Duration)

/*
 * List of employees who have expired training
 */

SELECT 
    Employee.Emp_Num,
    Employee.Emp_First_Name,
	Employee.Emp_Last_Name,
    InHouse_Training.IH_Training_Description,
    InHouse_Training.IH_Training_Date,
    InHouse_Training.IH_Training_Valid_Duration,
    DATEADD(DAY, InHouse_Training.IH_Training_Valid_Duration, InHouse_Training.IH_Training_Date) AS IH_Training_Expiry_Date
FROM 
    Employee 
JOIN 
    InHouse_Training
ON 
    Employee.Emp_Num = InHouse_Training.IH_Training_Attendee
WHERE
    DATEADD(DAY, InHouse_Training.IH_Training_Valid_Duration, InHouse_Training.IH_Training_Date) < GETDATE()
UNION ALL
SELECT 
    Employee.Emp_Num,
    Employee.Emp_First_Name,
	Employee.Emp_Last_Name,
    Regulatory_Training.R_Training_Description,
    Regulatory_Training.R_Training_Date,
    Regulatory_Training.R_Training_Valid_Duration,
    DATEADD(DAY, Regulatory_Training.R_Training_Valid_Duration, Regulatory_Training.R_Training_Date) AS R_Training_Expiry_Date
FROM 
    Employee 
JOIN 
    Regulatory_Training
ON 
    Employee.Emp_Num = Regulatory_Training.R_Training_Attendee
WHERE
    DATEADD(DAY, Regulatory_Training.R_Training_Valid_Duration, Regulatory_Training.R_Training_Date) < GETDATE();

/*
 * How many uniforms remain un-allocated?
 */

 SELECT SUM(Uniform_Count) - (
    SELECT COUNT(*)
    FROM Uniform_Issue
) AS Unallocated_Uniforms
FROM Uniform;