-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	Creates the functions for the change lines of the FM journal
-- =============================================

-- you will want to change the database to wherever you want this to live
USE [cu]
GO

-- standard change line for creation of a new record
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateChangeLine](
	@DataType, 
	@FieldMnemonic as VARCHAR(255), 
	@NewValue as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	CASE 
		WHEN @DataType = 'Character' THEN ' SET ' + @FieldMnemonic + ' TO ' + replicate(' ',47 - LEN(' SET ' + @FieldMnemonic + ' TO ')) + @NewValue
		WHEN @DataType = 'Date' THEN ' SET ' + @FieldMnemonic + ' TO ' + pro.FMFormDate(@NewValue)
        WHEN @DataType = 'Money' THEN ' SET ' + @FieldMnemonic + ' TO ' + pro.FMFormMoney(@NewValue)
        WHEN @DataType = 'Rate' THEN ' SET ' + @FieldMnemonic + ' TO ' + pro.FMFormRate(@NewValue)
        ELSE ' SET ' + @FieldMnemonic + ' TO ' + @NewValue
	END
END;
GO

-- standard change line for revising a record
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseChangeLine](
	@DataType as VARCHAR(255), 
	@FieldMnemonic as VARCHAR(255), 
	@OldValue as VARCHAR(40),
	@NewValue as VARCHAR(40)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	CASE 
		WHEN @DataType = 'Character' THEN ' CHANGE ' + @FieldMnemonic + ' FROM' + 
			replicate(' ', 48 - LEN(' CHANGE ' + @FieldMnemonic + ' FROM')) + ISNULL(@OldValue,'') + 
			replicate(' ', 40 - LEN(ISNULL(@OldValue,''))) + ' TO ' + @NewValue
        WHEN @DataType = 'Date' THEN ' CHANGE ' + @FieldMnemonic + ' FROM ' + pro.FMFormDate(@OldValue) + ' TO ' + pro.FMFormDate(@NewValue)
        WHEN @DataType = 'Money' THEN ' CHANGE ' + @FieldMnemonic + ' FROM ' + pro.FMFormMoney(@OldValue) + ' TO ' + pro.FMFormMoney(@NewValue)
        WHEN @DataType = 'Rate' THEN ' CHANGE ' + @FieldMnemonic + ' FROM ' + pro.FMFormRate(@OldValue) + ' TO ' + pro.FMFormRate(@NewValue)
		ELSE ' CHANGE ' + @FieldMnemonic + ' FROM ' + @OldValue + ' TO ' + @NewValue
	END
END;
GO

-- change line for expiring a warning or creating a new warning with an expiration date
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [pro].[FMExpireWarningChangeLine](
	@WarningCode as VARCHAR(40),
	@DateValue as VARCHAR(40)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	' CHANGE SETWARNING ' + @WarningCode + ' ' + pro.FMFormDate(@DateValue)
END;
GO

-- change line for setting a warning without an expiration date
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [pro].[FMSetWarningChangeLine](
	@WarningCode as VARCHAR(40)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	' CHANGE SETWARNING ' + @WarningCode + ' --/--/-- '
END;
GO

