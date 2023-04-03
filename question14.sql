/*
 * List of employees who need updated in-house training
 */
USE Casino_DB;
GO

SELECT DISTINCT Emp_Num, Emp_First_Name, Emp_Last_Name, IH_ID
FROM Employee
INNER JOIN InHouse_Training
ON Employee.Emp_Num = InHouse_Training.IH_Training_Attendee
WHERE (InHouse_Training.IH_Training_Status = 'NO')
OR (DATEDIFF(day, InHouse_Training.IH_Training_Date, GETDATE()) > InHouse_Training.IH_Training_Valid_Duration)