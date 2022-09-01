-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	Creates a table to store the formatted data in that can then be grabbed by the stored procedure
-- =============================================

-- you will want to change the database to wherever you want this to live
USE [cu]
GO

CREATE TYPE [dbo].[FMTableType] AS TABLE(
	[RecordRow] [varchar](max) NULL,
	[ChangeRow] [varchar](max) NULL
)
GO