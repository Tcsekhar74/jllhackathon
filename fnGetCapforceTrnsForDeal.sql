/****** Object:  UserDefinedFunction [hackathon].[fnGetCapforceTrnsForDeal]    Script Date: 10/8/2021 9:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER function [hackathon].[fnGetCapforceTrnsForDeal](@ID int, @Miles int, @DaysToLook int) returns varchar(max) as
begin
return 
	(Select   RCA.Type Bought
			,cast(cast((RCA.Price / 1000000) as int) as varchar(10)) + 'M' [for]
			,cast(round(0.00062137 * Capforce.latlongeography.STDistance(RCA.latlongeography), 0) as varchar(10)) + ' miles' [within]
			,cast(abs(datediff(month,Capforce.CloseDate, RCA.trnDate)) as varchar(10)) + ' months' [in]
	from			[hackathon].[rcadata]		RCA
	left outer join [hackathon].[CapforceData]	Capforce
	on				RCA.CompanyID = Capforce.CompanyID
		and			RCA.Price between Capforce.Price - (Capforce.Price * 0.5) and Capforce.Price + (Capforce.Price *0.5)
		and			RCA.trnDate between dateadd(day,(-1 * @DaysToLook), Capforce.CloseDate) and dateadd(day,@DaysToLook, Capforce.CloseDate)
		and			RCA.latlongeography.STDistance(RCA.latlongeography) < (250 * @Miles)
	where			RCA.ID = @ID
	for json path )
end

GO


