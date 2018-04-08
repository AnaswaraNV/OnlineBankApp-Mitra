CREATE PROCEDURE[dbo].[spaccountdetail]  
	@Username varchar(30),
	@AccountId varchar(9), 
	@AccountDesc varchar(50),   
	@Balance Decimal(10,2),  
	@AccountStatus Bit,     
	@CreateDate DATETIME ,     
	@Message VARCHAR(100) OUT 
AS  
IF NOT EXISTS(SELECT * FROM AccountDetails WHERE Username = @Username
				AND AccountDesc=@AccountDesc) --  To Check UserName is exits or not  
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

	SET @Message = ' Registered Successfully'  
END
ELSE
BEGIN
	SET @Message = 'Alreay have a ' + @AccountDesc   
END