/****** Object:  View [hackathon].[vw_RelatedRCADealCount]    Script Date: 10/8/2021 9:35:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [hackathon].[vw_RelatedRCADealCount] as
	Select   Capforce.id
			,count(RCA.ID) RelatedClosedRCADealFound
	from			[hackathon].[CapforceData]	Capforce
	left outer join [hackathon].[rcadata]		RCA
	on				RCA.CompanyID = Capforce.CompanyID
		and			Capforce.Price between RCA.Price - (RCA.Price * 0.5) and RCA.Price + (RCA.Price *0.5)
		and			Capforce.CloseDate between dateadd(day,-180, RCA.trnDate) and dateadd(day,180, RCA.trnDate)
		and			Capforce.latlongeography.STDistance(RCA.latlongeography) < 100000
	group by Capforce.ID
	
GO


