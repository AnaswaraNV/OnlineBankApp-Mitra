ALTER PROCEDURE[dbo].[spcustomerdetail]  
	@Username varchar(30),
	@Firstname varchar(50), 
	@Lastname varchar(50),   
	@Password nvarchar(50),  
	@isLockedOut Bit,
	@SecurityQuestion varchar(50), 
	@SecurityAnswer nvarchar(50),  
	@FailedPasswordAttemptCount             INT,
	@FailedPasswordAttemptWindowStart      DATETIME,      
	@FailedPasswordAnswerAttemptCount      INT      ,     
	@FailedPasswordAnswerAttemptWindowStart DATETIME ,     
	@ERROR VARCHAR(100) OUT 
AS  
BEGIN  

--defining salt
DECLARE @salt UNIQUEIDENTIFIER
SET @salt=NEWID()

IF NOT EXISTS(SELECT * FROM CustomerDetails WHERE Username = @Username) --  To Check UserName is exits or not  
BEGIN  
	INSERT INTO CustomerDetails(Username, 
								Firstname, 
								Lastname, 
								[Password],  
								isLockedOut, 
								SecurityQuestion, 
								SecurityAnswer, 
								FailedPasswordAttemptCount  ,
								FailedPasswordAttemptWindowStart,
							    FailedPasswordAnswerAttemptCount, 
								FailedPasswordAnswerAttemptWindowStart, 
								Salt)  								
	VALUES(@Username, @Firstname, @Lastname, 
				HASHBYTES('SHA2_512', @Password+CAST(@salt AS VARCHAR(36))), --hashing password
				@isLockedOut, @SecurityQuestion,
				HASHBYTES('SHA2_512', @SecurityAnswer+CAST(@salt AS VARCHAR(36))), --hashing answer
				@FailedPasswordAttemptCount,
				@FailedPasswordAttemptWindowStart,      
				@FailedPasswordAnswerAttemptCount,     
				@FailedPasswordAnswerAttemptWindowStart, 
				@salt)  

	SET @ERROR = 'User Registered Successfully'  
END  
ELSE  
	BEGIN  
	SET @ERROR = 'Username Already Exists.Try Again!'  
	END  
END