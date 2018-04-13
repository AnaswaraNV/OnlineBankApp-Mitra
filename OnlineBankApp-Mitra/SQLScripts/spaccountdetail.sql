ALTER PROCEDURE[dbo].[uspAccountDetail]  
	@Username varchar(30),
	@AccountId varchar(9), 
	@AccountDesc varchar(50),   
	@Balance Decimal(10,2),  
	@AccountStatus Bit,     
	@CreateDate DATETIME ,     
	@Message VARCHAR(100) OUT 
AS  
IF NOT EXISTS(SELECT * FROM AccountDetails WHERE AccountId = @AccountId)
	BEGIN
		IF NOT EXISTS(SELECT * FROM AccountDetails WHERE Username = @Username
						AND AccountDesc=@AccountDesc) --  To Check user has already that kind of account 
		BEGIN  
			INSERT INTO AccountDetails(Username, 
										AccountId, 
										AccountDesc, 
										Balance,  
										AccountStatus, 
										CreateDate) 								
			VALUES(@Username, @AccountId, @AccountDesc, 
						@Balance, @AccountStatus,
						@CreateDate) 

			SET @Message = ' Registered Successfully with account id' + @AccountId  
		END
		ELSE
		BEGIN
			SET @Message = 'Alreay have a ' + @AccountDesc   
		END
	END
ELSE BEGIN
	SET @Message = 'Oops.Some error occured!Try again! '   
END