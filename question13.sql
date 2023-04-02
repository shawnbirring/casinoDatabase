/*
 * List of employees who has the mandatory certification expiring in the next 6 weeks
 */
 
USE Casino_DB;
GO

SELECT R_Training_Attendee
FROM Regulatory_Training
WHERE R_Training_Status = 'YES'
	AND DATEADD(day, R_Training_Valid_Duration, R_Training_Date) <= DATEADD(WEEK, 6, GETDATE())
ORDER BY R_Training_Attendee;
