/****** Object:  Table [hackathon].[allcapforcedata]    Script Date: 10/8/2021 9:28:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hackathon].[allcapforcedata](
	[ID] [varchar](18) NOT NULL,
	[OpportunityName] [varchar](255) NULL,
	[TRANSACTION_TYPE] [varchar](255) NULL,
	[Stagename] [varchar](255) NULL,
	[CLOSEDATE] [varchar](255) NULL,
	[DEAL_VALUE] [decimal](18, 2) NULL,
	[User] [varchar](255) NULL,
	[OFFICE] [varchar](255) NULL,
	[DIVISION] [varchar](255) NULL,
	[SUB_DIVISION] [varchar](255) NULL,
	[ASSET_TYPE] [varchar](255) NULL,
	[CITY] [varchar](255) NULL,
	[STATE] [varchar](255) NULL,
	[ZIP_CODE] [varchar](255) NULL,
	[LONGITUDE] [varchar](255) NULL,
	[LATITUDE] [varchar](255) NULL,
	[COUNTRY] [varchar](255) NULL,
	[CampaignID] [varchar](18) NULL,
	[CampaignName] [varchar](255) NULL,
	[CampaignType] [varchar](255) NULL,
	[NUMBER_OF_CAMPAIGN_MEMBERS] [int] NULL,
	[ELOQUA_CAMPAIGN_ID] [varchar](255) NULL,
	[MarketedFlag] [bit] NULL,
	[latlongeometry] [geometry] NULL,
	[latlongeography] [geography] NULL,
 CONSTRAINT [PK_allcapforcedata] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


