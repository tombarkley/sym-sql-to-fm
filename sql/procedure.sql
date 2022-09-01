-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	Procedure to spit out line separated FM from SQL input
-- =============================================

-- you will want to change the database to wherever you want this to live
USE [cu]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [pro].[FMOutput]
	@FMTable FMTableType READONLY
AS
BEGIN
	SET NOCOUNT ON;

	CREATE TABLE #tmp_proc_id_fm (
		RowID INT,
		RecordRow VARCHAR(256)
	)
	INSERT INTO #tmp_proc_id_fm
	SELECT DISTINCT
		ROW_NUMBER() OVER(ORDER BY RecordRow),
		RecordRow
	FROM @FMTable

	CREATE TABLE #tmp_proc_fm (
		RowID INT,
		RecordRow VARCHAR(256),
		ChangeRow VARCHAR(256)
	)
	INSERT INTO #tmp_proc_fm
	SELECT
		tpif.RowID,
		fmt.RecordRow,
		fmt.ChangeRow
	FROM @FMTable as fmt
	JOIN #tmp_proc_id_fm as tpif
		ON tpif.RecordRow = fmt.RecordRow

	SELECT DISTINCT
		REPLACE(
			fmt1.RecordRow + '|' +
			STUFF((
				SELECT
					'|' + fmt2.ChangeRow
				FROM #tmp_proc_fm as fmt2
				WHERE fmt2.RowID = fmt1.RowID
				FOR XML PATH('')), 1, 1, ''),
			'|',
			CHAR(13) + CHAR(10)
		)
	FROM #tmp_proc_fm as fmt1
	RETURN
END
GO