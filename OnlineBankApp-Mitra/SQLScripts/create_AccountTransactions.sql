CREATE TABLE [dbo].[AccountTransactions] (
	[TransactionId] VARCHAR (9)     NOT NULL,
	[AccountId]     VARCHAR (9)     NOT NULL,
	[Amount]        DECIMAL (10, 2) NOT NULL,
	[TransactionType]   CHAR(1)     NOT NULL,
	[TransactionDesc] VARCHAR(50) NOT NULL,
	[TransactionDate]   DATETIME, 
	CONSTRAINT [FK_accounttransaction_Aid] FOREIGN KEY(AccountId) 
				REFERENCES AccountDetails(AccountId),
	CONSTRAINT [PK_accounttrasnsaction_ATId] PRIMARY KEY(TransactionId), 
    CONSTRAINT [CK_TransactionType] CHECK ([TransactionType]='D' OR [TransactionType]='W'));