/*
 * Number of active Written Warning (WW) employee A has?
 */
SELECT COUNT(*) AS Active_Warnings
FROM Written_Warning
WHERE WW_Recipient = 'E000000006' AND WW_Is_Active = 'Yes';