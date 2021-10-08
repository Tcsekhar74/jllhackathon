/****** Object:  Table [hackathon].[eloquadata]    Script Date: 10/8/2021 9:31:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hackathon].[eloquadata](
	[Email_Name] [varchar](255) NULL,
	[Email_Subject_Line] [varchar](255) NULL,
	[Email_Address] [varchar](255) NULL,
	[First_Name] [varchar](255) NULL,
	[Last_Name] [varchar](255) NULL,
	[Title] [varchar](255) NULL,
	[Company] [varchar](255) NULL,
	[Business_Phone] [varchar](255) NULL,
	[Contact_City] [varchar](255) NULL,
	[Contact_State_Province] [varchar](255) NULL,
	[Contact_Address_1] [varchar](255) NULL,
	[Contact_Address_2] [varchar](255) NULL,
	[Salesperson] [varchar](255) NULL,
	[Contact_Name] [varchar](255) NULL,
	[Email_Send_Date] [datetime] NULL,
	[Total_Sends] [int] NULL,
	[Total_Opens] [int] NULL,
	[Total_Clickthroughs] [int] NULL,
	[Account_Name] [varchar](255) NULL,
	[CRM_Campaign_ID] [varchar](18) NULL,
	[Eloqua_Campaign_ID] [varchar](255) NULL,
	[Campaign_Name] [varchar](255) NULL,
	[companyid] [int] NULL
) ON [PRIMARY]
GO


