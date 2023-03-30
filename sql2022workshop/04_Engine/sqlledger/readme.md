# Exercises for Ledger for SQL Server for SQL Server 2022

These are exercises to learn Ledger for SQL Server for SQL Server 2022. In this exercise, you will learn how to use ledger for the following scenario.

- Our company wants to use an updatable ledger table to audit what changes are made to an Employees table that records human resources information.
- We want to use ledger to see when changes are made, what the actual change was (INSERT, UPDATE, DELETE) and see the SQL principal that was associated with the change.
- A web application also can be used to make changes to this table but the web application uses a common "app" login. So we will require web developers to capture the "true user" of the web application that results in a change to the table and record this information in a separate append-only ledger table. Therefore, when a change is found for the table for the "app" SQL principal we can use the append-only ledger table to see who the "true user" who made the change from the web application. Since this is an append-only ledger table, any SQL sysadmin cannot tamper with this table by making direct updates.

## Prerequisistes

- SQL Server 2022 Evaluation or Developer Edition. **You must configure SQL Server for mixed mode authentication**. You will be creating two SQL logins for this exercise: A sysadmin login called **bob** and an "application" login called **app**.
- Virtual machine or computer with minimum 2 CPUs with 8Gb RAM.
- SQL Server Management Studio (SSMS). The latest SSMS 18.x will work but SSMS 19.x has a new visualization for Ledger tables so the examples in demo 1 were done with the latest SSMS 19.x preview build.
- Install **Azure Data Studio (ADS)** from https://aka.ms/azuredatastudio. T-SQL notebooks are used in this module.

## Exercise 1: Using an updatable ledger table

This exercise will show you the fundamentals of an updatable ledger table.

1. Create a SQL based sysadmin login called **bob** by executing the script **addsysadminlogin.sql** from SSMS as the **default sysadmin** for the SQL Server instance.
2. **Login with the 'bob' sysadmin user created in the previous step**. If you get an login failure make sure you have Mixed Mode Authentication enabled for SQL Server.
2. Create the database schema, add an app login, and users by executing the script **createdb.sql** from SSMS.
3. Create an updatable ledger table for Employees by executing the script **createemployeeledger.sql** from SSMS. Use SSMS Object Explorer to see the tables have properties next to their name that they are ledger tables and a new visual icon to indicate it is a ledger table.
5. Populate initial employee data using the script **populateemployees.sql** from SSMS. 
6. Examine the data in the employee table using the script **getallemployees.sql**. Notice there are "hidden" columns that are not shown if you execute a SELECT *. Some of these columns are NULL or 0 because no updates have been made to the data. You normally will not use these columns but use the *ledger view* to see information about changes to the employees table.
7. Look at the employees ledger view by executing the script **getemployeesledger.sql**. This is a view from the Employees table and a ledger *history* table. Notice the ledger has the transaction information from hidden columns in the table plus an indication of what type of operation was performed on the ledger for a specific row.
8. Examine the definition of the ledger view by executing **getemployeesledgerview.sql**. The ledger history table uses the name **MSSQL_LedgerHistoryFor_[objectid of table]**. Notice the view is a union of the original table (for new inserts) and updates from the history table (insert/delete pair).
9. You can combine the ledger view with a system table to get more auditing information. Execute the script  **viewemployeesledgerhistory.sql** to see an example. You can see that 'bob' inserted all the data along with a timestamp.
10. To verify the integrity of the ledger let's generate a digest by executing the script **generatedigest.sql**. **Save the output value (including the braces) to be used for verifying the ledger.**
11. You can now see blocks generated for the ledger table by executing the script **getledgerblocks.sql**
10. Try to update Jay Adam's salary to see if no one will notice by executing the script **updatejayssalary.sql**.
11. Execute the script **getallemployees.sql** to see that it doesn't look anyone updated the data.
12. Execute the script **viewemployeesledgerhistory.sql** to see the audit of the changes and who made them. Notice 3 rows for Jay Adam's. Two for the update (DELETE and INSERT) and 1 for the original INSERT.
1. Generate another digest by executing **generatedigest.sql**. Save the JSON output (including the {})
1. Let's verify the ledger just to verify the integrity of the data. Edit the script **verifyledger.sql** by substituting the JSON value from **step 15** from the **generatedigest.sql** script (include the brackets inside the quotes). Execute the script. The **last_verified_block_id** should match the block_id in the digest and in **sys.database_ledger_blocks**. I now know the ledger is verified as of the time the digest was captured. 

    By using this digest I know that:
    
    - The data is valid based on the time the digest was captured/
    - The internal blocks match the current data changes for the update to jay's salary. If someone had to fake out the data for the Employees table without doing a T-SQL UPDATE to make the system "think" Jay's current salary was 50,000 more than it really is, the system would have raised an error that hashes of the changes don't match the current data.

## Exercise 2: Using an append-only ledger

Now see you can use an append-only ledger to capture application information. To ensure we captured what person was responsible for changes even if an application uses an "application login" we can use an append-only ledger table. 

Let's assume we have required application developers to record any change made by the web application including the true "user" of the application and associated SQL statement. We will do this by requiring the developer to record these details into an append-only ledger table which cannot be updated by the DBA. So the ledger transaction history for the Employees table will show the "app" user made the change but the append-only ledger will show the "true user" that initiated the change from the web application.

1. Use the SQL login **bob** to create an append-only ledger table for auditing of the application by executing the script **createauditledger.sql**.
1. To simulate a user using the application to change someone else's salary **connect to SSMS as the app login** created with the **createdb.sql** script and execute the script **appchangemaryssalary.sql**
1. **Logging back in as bob login**, look at the ledger by executing the script **viewemployeesledgerhistory.sql**. All you can see is that the "app" changed Mary's salary.
1. Using the **bob** again, look at the audit ledger by executing the script **getauditledger.sql**. This ledger cannot be updated so the app must "log" all operations and the originating user from the app who initiated the operation. So I can see from the Employees ledger history that the **app** user changed Mary's salary but the "app ledger table" shows **troy** was the actual person who used the app to make the change.

## Exercise 3: Protecting Ledger tables from DDL changes

Let's see how admin trying to change ledger table properties or drop ledger tables. Use the SQL syadmin login **bob** to execute all scripts for this exercise.

1. You can also view which tables and columns have been created for SQL Server ledger by executing the script **getledgerobjects.sql**
1. Admins are restricted from altering certain aspects of a ledger table, removing the ledger history table, and there is a record kept of any dropped ledger table (which you cannot drop). See these aspects of ledger by executing the script **admindropledger.sql**
1. Execute **getledgerobjects.sql** again to see the original created and then dropped ledger table.
1. Execute **auditdroppedledgertable.sql** to see who created and dropped the ledger tables.

## Exercise 4: What does tampering look like?

Using Azure Data Studio open the T-SQL notebook **ledger.ipynb** and observe the results to see evidence of tampering in a database ledger. DO NOT RUN the cells in the notebook. Just review the pre-run results to see tampering in action.