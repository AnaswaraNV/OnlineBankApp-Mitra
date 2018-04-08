ALTER PROCEDURE dbo.[spSecurity]
	@Username VARCHAR(50),
	@SecurityQuestion VARCHAR(50),
	@SecurityAnswer NVARCHAR(50),
	@Message VARCHAR(100) OUT,
	@ROWCOUNT INT OUT
AS

BEGIN
	SET NOCOUNT OFF;   
	DECLARE @uname VARCHAR(50)
	DECLARE @answerhash NVARCHAR(50)
	DECLARE @salt UNIQUEIDENTIFIER
	DECLARE @LockedOutStatus INT

	IF EXISTS (SELECT TOP 1 Username FROM [dbo].[CustomerDetails] WHERE Username=@Username)
		BEGIN	
			--check lock out status of user
			SET @LockedOutStatus=(SELECT isLockedOut FROM [dbo].[CustomerDetails] WHERE Username=@Username)
			---checking is lockedout status is false
			IF(@LockedOutStatus = 0 )
				BEGIN
					SET @salt=(SELECT Salt FROM [dbo].[CustomerDetails] WHERE Username=@Username)	
					SET @answerhash = HASHBYTES('SHA2_512', @SecurityAnswer+CAST(@salt AS VARCHAR(36)))

					SET @uname=(SELECT Username FROM [dbo].[CustomerDetails] 
								WHERE  Username=@Username 
								AND SecurityAnswer = @answerhash)						
				
					IF(@uname IS NULL)
						BEGIN
							SET @RowCount = 0
							SET @Message='Try Again!'
						END
					ELSE 
						BEGIN
							SET @RowCount = 1
							SET @Message='Great! Welcome to our System'
			   END			END
			ELSE
				BEGIN
					SET @RowCount = 0
					SET @Message='User is Locked Out! Contact Admin!'
	END			END
	ELSE
		BEGIN
			SET @RowCount = 0
			SET @Message='Try Again!'
		END
END