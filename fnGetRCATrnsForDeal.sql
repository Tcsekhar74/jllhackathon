/****** Object:  UserDefinedFunction [hackathon].[fnGetRCATrnsForDeal]    Script Date: 10/8/2021 9:36:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [hackathon].[fnGetRCATrnsForDeal](@ID int, @Miles int, @DaysToLook int) returns varchar(max) as
begin
return 
	(Select   RCA.Type Bought
			,cast(cast((RCA.Price / 1000000) as int) as varchar(10)) + 'M' [for]
			,cast(round(0.00062137 * Capforce.latlongeography.STDistance(RCA.latlongeography), 0) as varchar(10)) + ' miles' [within]
			,cast(abs(datediff(month,Capforce.CloseDate, RCA.trnDate)) as varchar(10)) + ' months' [in]
	from			[hackathon].[CapforceData]	Capforce
	left outer join [hackathon].[rcadata]		RCA
	on				RCA.CompanyID = Capforce.CompanyID
		and			Capforce.Price between RCA.Price - (RCA.Price * 0.5) and RCA.Price + (RCA.Price *0.5)
		and			Capforce.CloseDate between dateadd(day,(-1 * @DaysToLook), RCA.trnDate) and dateadd(day,@DaysToLook, RCA.trnDate)
		and			Capforce.latlongeography.STDistance(RCA.latlongeography) < (250 * @Miles)
	where			Capforce.ID = @ID
	for json path )
end
GO


