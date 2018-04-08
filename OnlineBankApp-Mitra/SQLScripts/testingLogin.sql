
DECLARE @Salt UNIQUEIDENTIFIER
DECLARE @Username VARCHAR(50)
DECLARE @Password NVARCHAR(50)
SET @Salt= '5c9d95d5-3b3e-47b1-a867-555e04dbb5ca'
SET @Username = 'aachy'
SET @Password = 'sister'
SELECT Username FROM [dbo].[CustomerDetails] 
								WHERE  Username=@USername
								AND [Password] = HASHBYTES('SHA2_512', @Password +CAST(@Salt AS VARCHAR(36)))
