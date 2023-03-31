# Casino Database
This assignment is a group submission and counts as your final delivery for the term project.

# Here is what you need to submit:

A final version of your logical ERD and data dictionary where the feedback given is applied. This would be the basis for your implementation. 
A SQL script that creates your database schema (structures) as well as populating it with some data (at least 10 rows for each table when applicable)
A second SQL script that includes queries answering all the questions the client needs the DB to provide answers to. 
DB Creation & Data Loading Script
Complete your database implementation which you started in Week 8 Lab. Build all the tables. Make sure you are defining your columns based on the data dictionary you developed previously. The columns should have the same types as indicated in your data dictionary. All other details should be implemented accordingly. For example if the attribute is required,  make sue that you include NOT NULL in your column definition.  

After you have created all your tables, populate your database with some data. Include the data entry in your script. When applicable, at least 10 records are expected. But some tables might not get to have 10 records.

# Questions and Answer Script
Create a second script (.sql or .txt file only) making sure to use the "use <db-name>" command at the top to switch the context to your own DB. A list of questions is given below. Copy each question to your script as a comment. Then write a SQL query to answer that question right after. If you are not answering a question you still need to include the question and explain why you are not answering it.

When writing queries, you might notice that some required columns are missing from your DB, or you might notice that you have not modeled/implemented some necessary entities, attributes or relationships. You should change your DB to add these missing pieces until you have everything you need to answer all the questions. Feel free to add more data to your DB to make the queries return sensible results. If you are adding more data, include the insert statements in the first script (DB creation script)

# List of Questions
1. Number of hours each employee worked per week?
2. Number of labor hours last week?
3. List of which employees worked breaker shifts in the last month.
4. How many breaker shifts are scheduled this week?
5. How many Slot Attendants are scheduled today?
6. Any Slot Attendants who have not been assigned to Section NORTH in the last month
7. Number of active Written Warning (WW) employee A has?
8. List of active WW sorted by date and employee
9. A list of an employee's discipline/performance actions
10. Number of sick days an employee has available
11. Number of vacation days an employee has available
12. Statistics on Employees: Number of Female/Male employees, Average age of employees? Number of employees over 50? Under 30
13. List of employees who has the mandatory certification expiring in the next 6 weeks
14. List of employees who need updated in-house training
15. List of employees who have expired training
16. How many uniforms remain un-allocated?
17. How your projects will be evaluated
18. When you submit your project, I will:

Run the first script you submitted to create your DB. I expect the DB to be loaded with sample data. 
Run the second script to see answers to the questions. I expect to have all your queries run without errors and produce the correct answer.
I will create the relational diagram of your DB using SQL Server and see if it is consistent with your final ERD.
Then I will create the data dictionary for your DB and see if it is consistent with your final Data Dictionary.
