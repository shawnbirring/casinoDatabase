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