/*
 * A list of an employee's discipline/performance actions
 */
USE Casino_DB;
GO

SELECT WW_Details, WW_Date_Issued, WW_Is_Active
FROM Written_Warning
WHERE WW_Recipient = 'E000000006';