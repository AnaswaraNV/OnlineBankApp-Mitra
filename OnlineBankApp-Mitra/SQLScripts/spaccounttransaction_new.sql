
CREATE PROCEDURE [dbo].[uspAccountTransaction](
	@Username varchar(30),
	@AccountId varchar(9), 
	@TransactionId varchar(9),   
	@Amount Decimal(10,2),
	@TransactionType char(1),
	@TransactionDesc varchar(50),     
	@TransactionDate DATETIME ,
	@Balance Decimal(10, 2)
	--@returnValue INT OUT 				
) AS
SET XACT_ABORT ON

IF @Amount < 0 BEGIN
	RETURN 2  --amount is negative
END

IF @TransactionType NOT IN ('W','D') BEGIN --you might want to make a foreign key table for this instead of hardcoding it
	RETURN 0  --invalid transaction type
END

IF EXISTS(SELECT * FROM AccountDetails  WHERE [AccountId] = @AccountId) BEGIN	
	RETURN 1  --no account number exist
END

--if withdrawal
IF @TransactionType = 'W' BEGIN
	BEGIN TRANSACTION
	UPDATE AccountDetails SET [Balance]=[Balance]-@Amount 
	WHERE [AccountId]=@AccountId AND [Balance]-@Amount < 500
	INSERT INTO dbo.[AccountTransactions] (TransactionId , 
											AccountId, 
											Amount,
											TransactionType,
											TransactionDesc, 
											TransactionDate) 
	VALUES (@TransactionId, 
			@AccountId,
			@Amount,
			@TransactionType,
			@TransactionDesc, 
			@TransactionDate)
	
	IF @@ROWCOUNT = 0 BEGIN
		ROLLBACK TRANSACTION
		RETURN 3 --insufficient funds
	END
	ELSE BEGIN
		COMMIT TRANSACTION
		RETURN 4 --successful
	END
END 
ELSE BEGIN --Transaction type must be D
	BEGIN TRANSACTION
		UPDATE AccountDetails SET [Balance]=[Balance]+@Amount 
		WHERE [AccountId]=@AccountId
			INSERT INTO dbo.[AccountTransactions] (TransactionId , 
												   AccountId, 
												   Amount,
												   TransactionType,
												   TransactionDesc, 
												   TransactionDate) 
		VALUES (@TransactionId, 
				@AccountId,
				@Amount,
				@TransactionType,
			    @TransactionDesc, 
				@TransactionDate)
	COMMIT TRANSACTION
	RETURN 4
END