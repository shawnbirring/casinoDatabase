/*
 * How many uniforms remain un-allocated?
 */
 SELECT SUM(Uniform_Count) - (
    SELECT COUNT(*)
    FROM Uniform_Issue
) AS Unallocated_Uniforms
FROM Uniform;