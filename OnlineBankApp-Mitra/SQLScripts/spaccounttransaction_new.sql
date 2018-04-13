CREATE PROCEDURE [dbo].[uspAccountTransaction](
	@Username varchar(30),
	@AccountId varchar(9), 
	@TransactionId varchar(9),   
	@Amount Decimal(10,2),
	@TransactionType char(1),
	@TransactionDesc varchar(50),     
	@TransactionDate DATETIME ,
	@Balance Decimal(10, 2),
	@ReturnValue INT OUT 				
) AS
SET XACT_ABORT ON
Declare @newValue Decimal(10,2)
Declare @balance1 Decimal(10,2)
Declare @rowCount int 
IF @Amount < 0 BEGIN
	SET @ReturnValue=2  --amount is negative
END

IF @TransactionType NOT IN ('W','D') BEGIN --you might want to make a foreign key table for this instead of hardcoding it
	SET @ReturnValue= 0  --invalid transaction type
END

IF NOT EXISTS(SELECT * FROM AccountDetails  WHERE [AccountId] = @AccountId) BEGIN	
	SET @ReturnValue= 1  --no account number exist
END

IF NOT EXISTS(SELECT * FROM AccountTransactions  WHERE TransactionId = @TransactionId) BEGIN	
BEGIN
		--if withdrawal
	IF @TransactionType = 'W' BEGIN
		SET @balance1 = (SELECT Balance FROM AccountDetails WHERE [AccountId] = @AccountId)
		SET @newValue = @balance1 - @Amount 
	
		--if min balance is retained
		IF @newValue > 200 BEGIN
			BEGIN TRANSACTION
			UPDATE AccountDetails SET Balance= @newValue
			WHERE AccountId=@AccountId 
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
			SET @rowCount = @@ROWCOUNT
			IF @rowCount = 0 BEGIN
				ROLLBACK TRANSACTION
				SET @ReturnValue= 3 --insufficient funds
			END
			ELSE BEGIN
				COMMIT TRANSACTION
				SET @ReturnValue= 4 --successful
			END
		END
		ELSE BEGIN
			SET @ReturnValue= 3 --insufficient funds
		END
	END 
	ELSE BEGIN --Transaction type must be D
		SET @balance1 = (SELECT Balance FROM AccountDetails WHERE [AccountId] = @AccountId)
		SET @newValue = @balance1 +  @Amount 
		BEGIN TRANSACTION
			UPDATE AccountDetails SET [Balance]=@newValue
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
		SET @ReturnValue= 4
	END
	END
END
ELSE BEGIN
	SET @ReturnValue= 5  --transaction id already there
END
