CREATE PROCEDURE[dbo].[spaccounttransaction]  
	@Username varchar(30),
	@AccountId varchar(9), 
	@TransactionId varchar(9),   
	@Amount Decimal(10,2),  
	@TransactionDesc varchar(50),     
	@TransactionDate DATETIME ,
	@Balance Decimal(10, 2),
	@Message VARCHAR(100) OUT 
AS   
IF @Balance < 0
BEGIN  
	INSERT INTO AccountTransactions(Username, 
								AccountId, 
								TransactionId, 
								Amount,  
								TransxnType,
								TransactionDesc, 
								TransactionDate ) 								
	VALUES(@Username,
			@AccountId, 
			@TransactionId,   
			@Amount,  
			@TransactionDesc,    
			@TransactionDate)      

	SET @Message = ' Registered Successfully'  
END
ELSE
BEGIN
	SET @Message = 'Alreay have a ' + @AccountDesc   
END