/****** Object:  ExternalDataSource [AzureUDPBlobStore]    Script Date: 10/8/2021 9:39:45 AM ******/
CREATE EXTERNAL DATA SOURCE [AzureUDPBlobStore] WITH (TYPE = BLOB_STORAGE, LOCATION = N'https://jllcusudpcscrmlanddev.blob.core.windows.net/utilizationdata', CREDENTIAL = [AzureUDPBlobStoreCred])
GO


