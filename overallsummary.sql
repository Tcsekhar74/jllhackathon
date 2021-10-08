select Company, Purchased, (select 
							count(id) 
					from	[hackathon].[allcapforcedata] Capforce
					where	state in (select	distinct State 
										from	[hackathon].[rcadata] RD
										where	RD.companyid = R.Companyid)
						and Transaction_Type = 'Sales'
						and Asset_Type in ('Multi-housing', 'Residential')
						and Price >= R.Price	) CapforceHad
		, (select 
							count(id) 
					from	[hackathon].[capforcedata] Capforce
					where	state in (select	distinct State 
										from	[hackathon].[rcadata] RD
										where	RD.companyid = R.Companyid)
						and Transaction_Type = 'Sales'
						and Asset_Type in ('Multi-housing', 'Residential')
						and Price >= R.Price	) Marketed
		, (select 
							count(id) 
					from	[hackathon].[capforcedata] Capforce
					where	Transaction_Type = 'Sales'
						and Capforce.companyid = R.companyid
						and (state not in (select	distinct State 
										from	[hackathon].[rcadata] RD
										where	RD.companyid = R.Companyid)
						or Asset_Type not in ('Multi-housing', 'Residential')
						or Price < R.Price	)) WronglyMarketed
		, (select 
							count(id) 
					from	[hackathon].[capforcedata] Capforce
					where	state in (select	distinct State 
										from	[hackathon].[rcadata] RD
										where	RD.companyid = R.Companyid)
						and Transaction_Type = 'Sales'
						and Asset_Type in ('Multi-housing', 'Residential')
						and Price >= R.Price	
						and Signed_Date is not null) SignedNDA
		, (select 
							count(id) 
					from	[hackathon].[capforcedata] Capforce
					where	state in (select	distinct State 
										from	[hackathon].[rcadata] RD
										where	RD.companyid = R.Companyid)
						and Transaction_Type = 'Sales'
						and Asset_Type in ('Multi-housing', 'Residential')
						and Price >= R.Price	
						and Offer_date is not null) Bidded
		, isnull((select 
							sum(case when BidsAccepted.Offer_Status is not null then 1 else 0 end) 
					from	[hackathon].[capforcedata] Capforce
					left outer join		hackathon.bids					BidsAccepted
							on				Capforce.OpportunityID	=	BidsAccepted.OpportunityID
								and			Capforce.CompanyID		=	BidsAccepted.CompanyID
								and			BidsAccepted.Offer_Status= 'Accepted'
					where	state in (select	distinct State 
										from	[hackathon].[rcadata] RD
										where	RD.companyid = R.Companyid)
						and Transaction_Type = 'Sales'
						and Asset_Type in ('Multi-housing', 'Residential')
						and Price >= R.Price	
						and Offer_date is not null),0) BidWon
from (select	Company	
				,Type
				,min(RCA.Price) Price
				,RCA.companyid	
				,count(id) Purchased
		from	[hackathon].[rcadata] RCA
		group by 
				Type
				,Company
				,RCA.Companyid ) R


) T
