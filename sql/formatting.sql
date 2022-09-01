-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	Creates functions that format the data into the proper format for the fm journal
-- =============================================

-- you will want to change the database to wherever you want this to live
USE [cu]
GO

-- set account number to the proper 10 digit format with leading zeros
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMFormAccountNumber](@AccountNumber as VARCHAR(255))
RETURNS VARCHAR(10)
AS
BEGIN
	RETURN
		LEFT('000000000', 10 - LEN(REPLACE(@AccountNumber, ' ', ''))) + REPLACE(@AccountNumber, ' ', '')
END
GO

-- sets the LoanID to be a 4 digit number with leading zeros (sometimes ARCU stores the ID in a longer format)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMFormLoanID](@LoanID as VARCHAR(255))
RETURNS VARCHAR(10)
AS
BEGIN
	RETURN
		LEFT('0000', 4 - LEN(REPLACE(@LoanID, ' ', ''))) + REPLACE(@LoanID, ' ', '')
END
GO

-- sets the ShareID to be a 4 digit number with leading zeros (sometimes ARCU stores the ID in a longer format)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMFormShareID](@ShareID as VARCHAR(255))
RETURNS VARCHAR(10)
AS
BEGIN
	RETURN
		LEFT('0000', 4 - LEN(REPLACE(@ShareID, ' ', ''))) + REPLACE(@ShareID, ' ', '')
END
GO

-- sets the Money decimal or integer to a varchar
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMFormMoney](@Money as money)
RETURNS VARCHAR(255)
AS
BEGIN
	RETURN
		CAST(@Money as VARCHAR(255))
END
GO

-- sets the Rate to a varchar with a % sign
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMFormRate](@Rate as decimal(5,3))
RETURNS VARCHAR(255)
AS
BEGIN
	RETURN
		CAST(@Rate as VARCHAR(255)) + '%'
END
GO

-- sets the data to the proper date format for the FM journal
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMFormDate](@Date as DATETIME)
RETURNS VARCHAR(255)
AS
BEGIN
RETURN 
	CASE 
		WHEN @Date IS NULL THEN '--/--/--'
		WHEN YEAR(@Date) >= 1951 AND YEAR(@Date) <= 2050 THEN FORMAT(MONTH(@Date), '00') + '/' + FORMAT(DAY(@Date), '00') + '/' + RIGHT(FORMAT(YEAR(@Date), '0000'), 2)
		ELSE FORMAT(MONTH(@Date), '00') + FORMAT(DAY(@Date), '00') + FORMAT(YEAR(@Date), '0000')
	END
END
GO