/****** Object:  Table [hackathon].[Client]    Script Date: 10/8/2021 9:30:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hackathon].[Client](
	[companyid] [int] NOT NULL,
	[Company] [varchar](255) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[companyid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


