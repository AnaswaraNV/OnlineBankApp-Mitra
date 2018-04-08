CREATE TABLE [dbo].[AccountDetails] (
	[Username]                               VARCHAR (30)     NOT NULL,
	[AccountId]                              VARCHAR (9)      NOT NULL,
	[AccountDesc]                            VARCHAR (20)     NOT NULL,
	[Balance]                                DECIMAL(10,2)    NOT NULL,
	[AccountStatus]                            BIT            NOT NULL,
	[CreateDate]							DATETIME	  NULL,
	CONSTRAINT [FK_accountdetails_Username] FOREIGN KEY(Username) 
				REFERENCES CustomerDetails,
	CONSTRAINT [PK_accountdetails] PRIMARY KEY(AccountId));
