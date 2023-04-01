/*
 * List of active WW sorted by date and employee
 */

SELECT WW_ID, WW_Recipient, WW_Issuer, WW_Details, WW_Date_Issued
FROM Written_Warning
WHERE WW_Is_Active = 'Yes'
ORDER BY WW_Date_Issued, WW_Recipient;