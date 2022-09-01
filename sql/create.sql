-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	Creates the functions for creating new records
-- =============================================

-- you will want to change the database to wherever you want this to live
USE [cu]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [pro].[FMCreateAccountTrackingRecord](
	@AccountNumber as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE TRACKING LOC AFTERLAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateCardAccessRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE CARD ' + @CardLocator + ' ACCESS LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateCardNameRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE CARD ' + @CardLocator + ' NAME LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateCardNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE CARD ' + @CardLocator + ' NOTE LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateCardRecord](
	@AccountNumber as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE CARD ' + 'AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateCPWorkCardNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@WorkCardLoc as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE CPWORKCARD LOC ' + @WorkCardLoc + ' NOTE LOC BEFOREFIRST'
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateLoanHoldRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + pro.FMFormLoanID(@LoanID) + ' HOLD LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateLoanNameRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + pro.FMFormLoanID(@LoanID) + ' NAME LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateLoanNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + pro.FMFormLoanID(@LoanID) + ' NOTE LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateLoanPledgeRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + pro.FMFormLoanID(@LoanID) + ' PLEDGE LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateLoanRecord](
	@AccountNumber as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + 'AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [pro].[FMCreateLoanTrackingRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + pro.FMFormLoanID(@LoanID) + ' TRACKING LOC AFTERLAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateLoanTransferRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE LOAN ' + pro.FMFormLoanID(@LoanID) + ' TRANSFER LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateShareHoldRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE SHARE ' + pro.FMFormShareID(@ShareID) + ' HOLD LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateShareNameRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE SHARE ' + pro.FMFormShareID(@ShareID) + ' NAME LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateShareNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE SHARE ' + pro.FMFormShareID(@ShareID) + ' NOTE LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateShareRecord](
	@AccountNumber as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE SHARE ' + 'AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateShareTrackingRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE SHARE ' + pro.FMFormShareID(@ShareID) + ' TRACKING LOC AFTER LAST'
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMCreateShareTransferRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' CREATE SHARE ' + pro.FMFormShareID(@ShareID) + ' TRANSFER LOC AFTER LAST'
END;

GO