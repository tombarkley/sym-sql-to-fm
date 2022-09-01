-- =============================================
-- Author:		Tom Barkley
-- Create date: 8/31/2022
-- Description:	Creates the functions for revising
-- =============================================

-- you will want to change the database to wherever you want this to live
USE [cu]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [pro].[FMReviseAccountRecord](
	@AccountNumber as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE'
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [pro].[FMReviseAccountTrackingRecord](
	@AccountNumber as VARCHAR(255), 
	@TrackingLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE TRACKING LOC ' + @TrackingLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseCardAccessRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255), 
	@AccessLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE CARD ' + @CardLocator + ' ACCESS LOC ' + @AccessLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseCardNameRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255), 
	@NameLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE CARD ' + @CardLocator + ' NAME LOC ' + @NameLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseCardNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255), 
	@NoteLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE CARD ' + @CardLocator + ' NOTE LOC ' + @NoteLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseCardRecord](
	@AccountNumber as VARCHAR(255), 
	@CardLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE CARD LOC ' + @CardLocator
END;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanHoldRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255), 
	@HoldLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID) + ' HOLD LOC ' + @HoldLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanNameRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255), 
	@NameLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID) + ' NAME LOC ' + @NameLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255), 
	@NoteLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID) + ' NOTE LOC ' + @NoteLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanPledgeRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255), 
	@PledgeLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID) + ' PLEDGE LOC ' + @PledgeLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID)
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanTrackingRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255), 
	@TrackingLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID) + ' TRACKING LOC ' + @TrackingLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseLoanTransferRecord](
	@AccountNumber as VARCHAR(255), 
	@LoanID as VARCHAR(255), 
	@TransferLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE LOAN ' + pro.FMFormLoanID(@LoanID) + ' TRANSFER LOC ' + @TransferLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseShareHoldRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255), 
	@HoldLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE SHARE ' + pro.FMFormShareID(@ShareID) + ' HOLD LOC ' + @HoldLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseShareNameRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255), 
	@NameLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE SHARE ' + pro.FMFormShareID(@ShareID) + ' NAME LOC ' + @NameLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseShareNoteRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255), 
	@NoteLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE SHARE ' + pro.FMFormShareID(@ShareID) + ' NOTE LOC ' + @NoteLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseShareRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE SHARE ' + pro.FMFormShareID(@ShareID)
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseShareTrackingRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255), 
	@TrackingLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE SHARE ' + pro.FMFormShareID(@ShareID) + ' TRACKING LOC ' + @TrackingLocator
END;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [pro].[FMReviseShareTransferRecord](
	@AccountNumber as VARCHAR(255), 
	@ShareID as VARCHAR(255), 
	@TransferLocator as VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
	'ACCOUNT ' + pro.FMFormAccountNumber(@AccountNumber) + ' REVISE SHARE ' + pro.FMFormShareID(@ShareID) + ' TRANSFER LOC ' + @TransferLocator
END;

GO
