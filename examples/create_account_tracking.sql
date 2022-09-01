-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	This is a sample script that will create a new account tracking record and fill in a few fields
-- =============================================

-- this is written as if it were from the main ARCU db so you will want to change the USE statement to the actual main ARCU db
USE [cu]
GO

-- Declare the most recent process date for the query
DECLARE @ProcessDate INT = (SELECT MAX(ProcessDate) FROM dbo.ACCOUNT);
-- Declare the table that will hold the FM journal
DECLARE @InputFMTable cu.pro.FMTableType;

-- target the accounts based on arbitrary criteria
SELECT
    nm.PARENTACCOUNT as AccountNumber
INTO #tmp_example_accounts
FROM dbo.NAME as nm
WHERE 
    nm.ProcessDate = @ProcessDate
    AND nm.TYPE = 0
    AND nm.FIRST = 'Tom'

-- insert the changes into the FMTable
INSERT INTO @InputFMTable
-- insert the tracking type
SELECT
    pro.FMCreateAccountTrackingRecord(
        ac.AccountNumber
    ),
    pro.FMCreateChangeLine(
        'Code',
        'TYPE',
        125
    )
FROM #tmp_example_accounts as ac;
-- insert a random date
UNION ALL
SELECT
    pro.FMCreateAccountTrackingRecord(
        ac.AccountNumber
    ),
    pro.FMCreateChangeLine(
        'Date',
        'USERDATE1',
        GETDATE()
    )
FROM #tmp_example_accounts as ac;
-- insert a character
UNION ALL
SELECT
    pro.FMCreateAccountTrackingRecord(
        ac.AccountNumber
    ),
    pro.FMCreateChangeLine(
        'Character',
        'USERCHAR1',
        'Tom was here'
    )
FROM #tmp_example_accounts as ac;
-- insert a money value
UNION ALL
SELECT
    pro.FMCreateAccountTrackingRecord(
        ac.AccountNumber
    ),
    pro.FMCreateChangeLine(
        'Money',
        'USERAMOUNT1',
        100.00
    )
FROM #tmp_example_accounts as ac;

-- call the stored procedure to output the FM journal
EXEC pro.FMOutput @FMTable = @InputFMTable;

-- retrieve the records from the temp table for export to a CSV
SELECT * FROM #tmp_example_accounts;

-- clean up the temp table
DROP TABLE #tmp_example_accounts;
