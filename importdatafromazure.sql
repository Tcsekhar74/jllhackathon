	Bulk INSERT hackathon.allcapforcedeals FROM 'client_files/AonCenter/allcapforcedeals.csv'
							WITH ( FIRSTROW =2
									, FORMAT = 'CSV'
								, ROWTERMINATOR = '\n' 
								, DATA_SOURCE = 'AzureUDPBlobStore');
