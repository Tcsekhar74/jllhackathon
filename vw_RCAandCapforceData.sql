/****** Object:  View [hackathon].[vw_RCAandCapforceData]    Script Date: 10/8/2021 9:34:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE view [hackathon].[vw_RCAandCapforceData] as
	Select	 RCA.ID
			,RCA.Company
			,RCA.Price
			,RCA.Status
			,RCA.Type
			,RCA.Market
			,RCA.SubMarket
			,RCA.trnDate
			,RCA.Property_Name
			,RCA.City
			,RCA.State
			,RCA.Country
			,RCA.Units
			,RCA.sf
			,RCA.Occupancy
			,RCA.Sellers_Broker
			,Capforce.Asset_Type CapforceAssetType
			,Capforce.MarketedFlag
			,Capforce.OpportunityName
			,cast(cast((Capforce.Deal_Value / 1000000) as int) as varchar(10)) + 'M' [Marketed_For]
			,cast(round(0.00062137 * RCA.latlongeography.STDistance(Capforce.latlongeography), 0) as varchar(10)) + ' miles' [Bought_Within]
			,cast(abs(datediff(month,RCA.trnDate, Capforce.CloseDate)) as varchar(10)) + ' months' [Trn_Time_Frame]
		from			[hackathon].[rcadata]		RCA
		left outer join [hackathon].[AllCapforceData]	Capforce
		on				RCA.Price between Capforce.Deal_Value - (Capforce.Deal_Value * 0.5) and Capforce.Deal_Value + (Capforce.Deal_Value *0.5)
	-- 180 days (6 months before or after)
			and			RCA.trnDate between dateadd(day,(-180), Capforce.CloseDate) and dateadd(day,180, Capforce.CloseDate)
	-- within 250 miles radius
			and			RCA.latlongeography.STDistance(RCA.latlongeography) < (250 * 1609)
			and			Capforce.Transaction_Type = 'Sales'
			
GO


