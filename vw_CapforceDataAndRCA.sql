/****** Object:  View [hackathon].[vw_CapforceDataAndRCA]    Script Date: 10/8/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE view [hackathon].[vw_CapforceDataAndRCA] as
	select		 Capforce.ID
				,Client.Company
				,Capforce.Noof_CMs
				,Capforce.Signed_Date
				,Capforce.Offer_Date
				,BidsReceived.Offer_Status  BidReceived
				,BidsDeclined.Offer_Status	BidDeclined
				,BidsAccepted.Offer_Status	BidAccepted
				,Capforce.OpportunityName
				,Capforce.Transaction_Type
				,Capforce.StageName
				,Capforce.CloseDate
				,Capforce.Price
				,Capforce.Division
				,Capforce.PropertyName
				,Capforce.Asset_Type
				,Capforce.City
				,Capforce.State
				,Capforce.Country
				,Capforce.Gross_Building_Area
				,Capforce.CampaignName
				,Capforce.CampaignType
				,Capforce.Number_Of_Campaign_Members
				,isnull(count(Eloqua.companyid),0) EloquaEmails
				,isnull(sum(Eloqua.Total_Sends),0) EloquaTotalSends
				,isnull(sum(Eloqua.Total_Opens),0) EloquaTotalOpens
				,isnull(sum(Eloqua.Total_Clickthroughs),0) EloquaTotalClickThroughs
				,RCA.Type [Bought_Asset_Type]
				,cast(cast((RCA.Price / 1000000) as int) as varchar(10)) + 'M' [Bought_For]
				,cast(round(0.00062137 * Capforce.latlongeography.STDistance(RCA.latlongeography), 0) as varchar(10)) + ' miles' [Bought_Within]
				,cast(abs(datediff(month,Capforce.CloseDate, RCA.trnDate)) as varchar(10)) + ' months' [Trn_Time_Frame]
	from				hackathon.capforcedata		Capforce
	inner join			hackathon.client			Client
		on				Client.companyid		=	Capforce.companyid
	left outer join		hackathon.bids				BidsReceived
		on				Capforce.OpportunityID	=	BidsReceived.OpportunityID
			and			Capforce.CompanyID		=	BidsReceived.CompanyID
			and			BidsReceived.Offer_Status		= 'Received'
	left outer join		hackathon.bids				BidsAccepted
		on				Capforce.OpportunityID	=	BidsAccepted.OpportunityID
			and			Capforce.CompanyID		=	BidsAccepted.CompanyID
			and			BidsAccepted.Offer_Status		= 'Accepted'
	left outer join		hackathon.bids				BidsDeclined
		on				Capforce.OpportunityID	=	BidsDeclined.OpportunityID
			and			Capforce.CompanyID		=	BidsDeclined.CompanyID
			and			BidsDeclined.Offer_Status		= 'Declined'
	left outer join		[hackathon].[eloquadata]	Eloqua
		on				Eloqua.companyid		=	Capforce.companyid
			and			Eloqua.CRM_Campaign_ID	=	Capforce.CampaignID
	left outer join		[hackathon].[rcadata]		RCA
	on					RCA.CompanyID			= Capforce.CompanyID
		and				Capforce.Price			between RCA.Price - (RCA.Price * 0.33) 
													and RCA.Price + (RCA.Price * 0.33)
-- 180 days (6 months before or after)
		and				Capforce.CloseDate		between dateadd(day,(-180), RCA.trnDate) 
													and dateadd(day,180, RCA.trnDate)
-- within 250 miles radius
		and				Capforce.latlongeography.STDistance(RCA.latlongeography) < (250 * 1609)
	group by	 Capforce.ID
				,Capforce.CompanyID
				,Client.Company
				,Capforce.Noof_CMs
				,Capforce.Signed_Date
				,Capforce.Offer_Date
				,BidsReceived.Offer_Status
				,BidsDeclined.Offer_Status
				,BidsAccepted.Offer_Status
				,Capforce.OpportunityName
				,Capforce.Transaction_Type
				,Capforce.StageName
				,Capforce.CloseDate
				,Capforce.Price
				,Capforce.Division
				,Capforce.PropertyName
				,Capforce.Asset_Type
				,Capforce.City
				,Capforce.State
				,Capforce.Country
				,Capforce.Gross_Building_Area
				,Capforce.CampaignName
				,Capforce.CampaignType
				,Capforce.Number_Of_Campaign_Members
				,RCA.Type 
				,cast(cast((RCA.Price / 1000000) as int) as varchar(10)) + 'M' 
				,cast(round(0.00062137 * Capforce.latlongeography.STDistance(RCA.latlongeography), 0) as varchar(10)) + ' miles' 
				,cast(abs(datediff(month,Capforce.CloseDate, RCA.trnDate)) as varchar(10)) + ' months' 
GO


