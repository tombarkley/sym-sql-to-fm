-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	This is a sample script that will close a branch and move all of the accounts to another branch
-- =============================================

-- this is written as if it were from the main ARCU db so you will want to change the USE statement to the actual main ARCU db
USE [cu]
GO

-- Declare the most recent process date for the query
DECLARE @ProcessDate INT = (SELECT MAX(ProcessDate) FROM dbo.ACCOUNT);
-- Declare the branch that we are closing
DECLARE @TargetFromBranch INT = 1;
-- Declare the branch that we are moving the accounts to
DECLARE @TargetToBranch INT = 2;
-- Declare the table that will hold the FM journal
DECLARE @InputFMTable cu.pro.FMTableType;



-- Create the Account level changes
INSERT INTO @InputFMTable
SELECT
    pro.FMReviseAccountRecord(
        ac.NUMBER
    ),
    pro.FMReviseChangeLine(
        'Code',
        'BRANCH',
        ac.BRANCH,
        @TargetToBranch
    )
FROM dbo.ACCOUNT as ac
WHERE 
    ac.BRANCH = @TargetFromBranch
    AND ac.ProcessDate = @ProcessDate;

-- Create the Share level changes
INSERT INTO @InputFMTable
SELECT
    pro.FMReviseShareRecord(
        sh.PARENTACCOUNT,
        sh.ID
    ),
    pro.FMReviseChangeLine(
        'Code',
        'BRANCH',
        sh.BRANCH,
        @TargetToBranch
    )
FROM dbo.SAVINGS as sh
WHERE 
    sh.BRANCH = @TargetFromBranch
    AND sh.ProcessDate = @ProcessDate;

-- Create the Loan level changes
INSERT INTO @InputFMTable
SELECT
    pro.FMReviseLoanRecord(
        ln.PARENTACCOUNT,
        ln.ID
    ),
    pro.FMReviseChangeLine(
        'Code',
        'BRANCH',
        ln.BRANCH,
        @TargetToBranch
    )
FROM dbo.LOAN as ln
WHERE 
    ln.BRANCH = @TargetFromBranch
    AND ln.ProcessDate = @ProcessDate;

-- call the stored procedure to output the FM journal
EXEC pro.FMOutput @FMTable = @InputFMTable;