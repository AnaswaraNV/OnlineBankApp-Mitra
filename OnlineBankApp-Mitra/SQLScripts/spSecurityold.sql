CREATE PROCEDURE dbo.[spSecurity]
	@Username VARCHAR(50),
	@SecurityQuestion VARCHAR(50),
	@SecurityAnswer NVARCHAR(50),
	@Message VARCHAR(100) OUT 
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @uname VARCHAR(50)
	DECLARE @answerhash NVARCHAR(50)
	DECLARE @salt UNIQUEIDENTIFIER

	IF EXISTS (SELECT TOP 1 Username FROM [dbo].[CustomerDetails] WHERE Username=@Username)
	BEGIN
		SET @salt=(SELECT Salt FROM [dbo].[CustomerDetails] WHERE Username=@Username)
		SET @answerhash = HASHBYTES('SHA2_512', @SecurityAnswer+CAST(@salt AS VARCHAR(36)))

		SET @uname=(SELECT Username FROM [dbo].[CustomerDetails] WHERE Username=@Username AND 
									SecurityQuestion = @SecurityQuestion AND
									SecurityAnswer = @answerhash )

	   IF(@username IS NULL)
		   SET @Message='Incorrect Answer'
	   ELSE 
		   SET @Message='Answer is correct'
	END
	ELSE
	   SET @Message='Invalid answer'

END