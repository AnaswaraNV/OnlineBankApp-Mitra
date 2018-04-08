PRINT 'CREATING CustomerDetails TABLE...'
CREATE TABLE CustomerDetails(
Username  VARCHAR(30) NOT NULL,
Firstname VARCHAR(50) NOT NULL,
Lastname  VARCHAR(50) NOT NULL,
[Password] NVARCHAR(50)  NOT NULL, 
isLockedOut BIT NOT NULL,
SecurityQuestion VARCHAR(50) NOT NULL,
SecurityAnswer VARCHAR(50) NOT NULL,  
FailedPasswordAttemptCount Integer, 
FailedPasswordAttemptWindowStart DateTime, 
FailedPasswordAnswerAttemptCount Integer, 
FailedPasswordAnswerAttemptWindowStart DateTime, 
Salt UNIQUEIDENTIFIER,
CONSTRAINT [PK_customerdetails_Username] PRIMARY KEY(Username));
GO