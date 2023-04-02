/*
 * List of active WW sorted by date and employee
 */

SELECT *
FROM Written_Warning
WHERE WW_Is_Active = 'Yes'
ORDER BY WW_Date_Issued, WW_Recipient;