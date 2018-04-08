ALTER PROCEDURE dbo.[spLogin]
	@Username VARCHAR(50),
	@Password VARCHAR(50),
	@ERROR VARCHAR(100) OUT, 
	@ROWCOUNT INT OUT
AS

BEGIN
	SET NOCOUNT OFF;   
	DECLARE @uname VARCHAR(50)
	DECLARE @passwordhash NVARCHAR(50)
	DECLARE @salt UNIQUEIDENTIFIER
	DECLARE @LockedOutStatus INT
	IF EXISTS (SELECT TOP 1 Username FROM [dbo].[CustomerDetails] WHERE Username=@Username)
		BEGIN
			SET @salt=(SELECT Salt FROM [dbo].[CustomerDetails] WHERE Username=@Username)
			SET @passwordhash = HASHBYTES('SHA2_512', @Password+CAST(@salt AS VARCHAR(36)))
		
			--check lock out status of user
			SET @LockedOutStatus=(SELECT isLockedOut FROM [dbo].[CustomerDetails] WHERE Username=@Username)
			---checking is lockedout status is false
			IF(@LockedOutStatus = 0)
				BEGIN
					SET @uname=(SELECT Username FROM [dbo].[CustomerDetails] 
								WHERE  Username=@Username 
								AND [Password] = @passwordhash)						
				
					IF(@uname IS NULL)
						BEGIN
							SET @ROWCOUNT = 0
							SET @ERROR='Incorrect password'
						END
					ELSE 
						BEGIN
							SET @ROWCOUNT = 1
							SET @ERROR='User successfully logged in'
			   END			END
		    ELSE
				BEGIN
					SET @ROWCOUNT = 0
					SET @ERROR='User is Locked Out!Contact Admin'
	END			END
	ELSE
		BEGIN
			SET @ROWCOUNT = 0
			SET @ERROR='Invalid login'
		END
END