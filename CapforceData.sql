/****** Object:  Table [hackathon].[CapforceData]    Script Date: 10/8/2021 9:30:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hackathon].[CapforceData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OPPORTUNITY] [varchar](255) NULL,
	[COMPANY_NAME] [varchar](255) NULL,
	[Noof_CMs] [varchar](255) NULL,
	[Signed_Date] [datetime] NULL,
	[Offer_Date] [datetime] NULL,
	[OfferAccepted] [bit] NULL,
	[OpportunityID] [varchar](255) NULL,
	[OpportunityName] [varchar](255) NULL,
	[TRANSACTION_TYPE] [varchar](255) NULL,
	[TRANSACTION_SUB_TYPE] [varchar](255) NULL,
	[Stagename] [varchar](255) NULL,
	[CLOSEDATE] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
	[UserName] [varchar](255) NULL,
	[OFFICE] [varchar](255) NULL,
	[DIVISION] [varchar](255) NULL,
	[SUB_DIVISION] [varchar](255) NULL,
	[PropertyID] [varchar](255) NULL,
	[PropertyName] [varchar](255) NULL,
	[ASSET_TYPE] [varchar](255) NULL,
	[ASSET_SUB_TYPE] [varchar](255) NULL,
	[ASSET_SUB_SUB_TYPE] [varchar](255) NULL,
	[STREET] [varchar](255) NULL,
	[CITY] [varchar](255) NULL,
	[STATE] [varchar](255) NULL,
	[ZIP_CODE] [varchar](255) NULL,
	[LONGITUDE] [varchar](255) NULL,
	[LATITUDE] [varchar](255) NULL,
	[COUNTRY] [varchar](255) NULL,
	[Size_Units] [varchar](255) NULL,
	[Gross_Building_Area] [varchar](255) NULL,
	[Unit_of_Measurement] [varchar](255) NULL,
	[Gross_Net_Building_Area] [varchar](255) NULL,
	[Acres] [varchar](255) NULL,
	[Land_Area_Unit_of_Measurement] [varchar](255) NULL,
	[Gross_Net_Land_Area] [varchar](255) NULL,
	[CampaignID] [varchar](18) NULL,
	[CampaignName] [varchar](255) NULL,
	[CampaignType] [varchar](255) NULL,
	[NUMBER_OF_CAMPAIGN_MEMBERS] [varchar](255) NULL,
	[ELOQUA_CAMPAIGN_ID] [varchar](255) NULL,
	[latlongeometry] [geometry] NULL,
	[latlongeography] [geography] NULL,
	[companyid] [int] NULL,
 CONSTRAINT [PK_CapforceData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


