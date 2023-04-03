/*
 * List of employees who have expired training
 */

/*
 * List of employees who have expired training
 */

USE Casino_DB;
GO

SELECT 
    Employee.Emp_Num,
    Employee.Emp_First_Name,
	Employee.Emp_Last_Name,
    InHouse_Training.IH_Training_Description,
    InHouse_Training.IH_Training_Date,
    InHouse_Training.IH_Training_Valid_Duration,
    DATEADD(MONTH, InHouse_Training.IH_Training_Valid_Duration, InHouse_Training.IH_Training_Date) AS IH_Training_Expiry_Date
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