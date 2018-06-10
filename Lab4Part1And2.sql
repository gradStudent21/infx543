CREATE DATABASE Augustamar_Pierre_Test;
GO

USE [Augustamar_Pierre_Test];
GO

---create tables for a classified ads system 

CREATE TABLE [dbo].[TypeAds](
	[TypeId] [int] NOT NULL,
	[TypeName] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[CategoryAds](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[LocationAds](
	[LocationID] [int] NOT NULL,
	[LocationName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[UserAds](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](40) NOT NULL,
	[AdsUserName] [varchar](20) NOT NULL,
	[AdsUserPassword] [varchar](10) NOT NULL,
	[ActiveUser] [tinyint] NULL,
	[UserEmail] [varchar](max) NOT NULL,
	[UserRegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[ClassifiedAds](
	[AdsID] [int] IDENTITY(1,1) NOT NULL,
	[AdsDate] [datetime] NULL DEFAULT (getdate()),
	[UserID] [int] NOT NULL
	         REFERENCES UserAds(UserID),
	[AdsTypeID] [int] NOT NULL,
	[AdsTitle] [varchar](280) NOT NULL,
	[AdsLocID] [int] NOT NULL,
	[AdsCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

-----Populate the tables

INSERT INTO [dbo].[UserAds]
           ([UserName]
           ,[AdsUserName]
           ,[AdsUserPassword]
           ,[ActiveUser]
           ,[UserEmail]
           ,[UserRegistrationDate])
     VALUES
           ('AutoAuction', 'BellinghamAuto', 'password', 1, 'BellinghamAuto@gmail.com', '2010-01-01'),
		   ('UWschool', 'UWJobs', 'GoHuskies1', 0, 'InformationJobs@uw.edu', '2014-01-01'),
		   ('BingAds', 'BingJobs', 'bingaway', 1, 'bingjobs@microsoft.com', '2012-12-02')
		   ;
GO

INSERT INTO [dbo].[TypeAds]
           ([TypeId]
           ,[TypeName])
     VALUES
        (1, 'Mobile Ads'),
GO

INSERT INTO [dbo].[LocationAds]
           ([LocationID]
           ,[LocationName])
     VALUES
		(1, 'United States'),
GO

INSERT INTO [dbo].[CategoryAds]
           ([CategoryID]
           ,[CategoryName])
     VALUES
	   (1, 'Vehicles'),
GO

INSERT INTO [dbo].[ClassifiedAds]
           ([UserID]
           ,[AdsTypeID]
           ,[AdsTitle]
           ,[AdsLocID]
           ,[AdsCategoryID])
     VALUES
 	  (1, 4, '2002 Honda Accord', 1, 1),
GO
  -----Generating up to 20 queries around the classified ads system
CREATE VIEW vwAdsCreatedByLocationInfo
WITH ENCRYPTION, SCHEMABINDING
AS
SELECT 
      ua.UserID, 
	  ua.UserName,
	  la.LocationName

FROM   [dbo].[ClassifiedAds] ca 
  JOIN [dbo].[LocationAds] la ON la.LocationID = ca.AdsLocID
  JOIN [dbo].[UserAds] ua ON ua.UserID = ca.UserID;

GO 

SELECT * FROM vwAdsCreatedByLocationInfo;

GO 

ALTER TABLE [dbo].[ClassifiedAds]  WITH CHECK ADD FOREIGN KEY([AdsLocID]) REFERENCES [dbo].[LocationAds] ([LocationID]);

GO

ALTER TABLE [dbo].[ClassifiedAds]  WITH CHECK ADD FOREIGN KEY([AdsTypeID]) REFERENCES [dbo].[TypeAds] ([TypeId]);

GO

SELECT * 

GO 

SELECT 

GO

SELECT 
GO

SELECT

GO

SELECT

GO

SELECT ca.UserID,

GO

ALTER TABLE [dbo].[ClassifiedAds] ALTER COLUMN AdsTitle VARCHAR(280) NOT NULL;

ALTER TABLE [dbo].[ClassifiedAds]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClassifiedAds_dbo.dbo.CategoryAds] FOREIGN KEY([AdsCategoryID])
REFERENCES  [dbo].[CategoryAds] ([CategoryID])

GO

ALTER TABLE [dbo].[ClassifiedAds] ADD adsWebsite VARCHAR(MAX) NULL, adsFacebookLink VARCHAR(MAX) NULL;

GO


UPDATE [dbo].[ClassifiedAds] 

GO 

UPDATE [dbo].[ClassifiedAds] 

GO 

DELETE FROM [dbo].[LocationAds]

GO
ALTER TABLE [dbo].[ClassifiedAds] DROP COLUMN adsFacebookLink;

GO

---drop foreign key
DROP CONSTRAINT [FK_dbo.ClassifiedAds_dbo.dbo.CategoryAds]; 
---drop table

GO

DECLARE @Type_Id int;
DECLARE @Type_name varchar(40);
DECLARE @Counter int;

SELECT  @Type_Id =  MAX(TypeId)  FROM [dbo].[TypeAds]
SET @Counter = 1;

WHILE @Counter < 3
BEGIN
  SET @Type_Id = @Type_Id + 1;
  SET @Counter = @Counter + 1;

  ;WITH cte_1 AS(
    SELECT ROW_NUMBER() OVER (ORDER BY NEWID() ASC) AS RN, t.name
    FROM sys.tables AS t
    CROSS JOIN sys.tables AS tt
   ),
 cte_2 AS(
    SELECT ROW_NUMBER() OVER (ORDER BY NEWID() ASC) AS RN, t.name
    FROM sys.columns AS t
    CROSS JOIN sys.columns AS tt
  )

  SELECT TOP 1
    cte_1.name + cte_2.name AS RandomString1
  INTO #temp2
  FROM cte_1
      INNER JOIN cte_2
  ON cte_1.RN = cte_2.RN

  SELECT @Type_Name =  RandomString1 FROM #temp2
  INSERT INTO [dbo].[TypeAds] VALUES (@Type_Id, @Type_name)

  DROP Table #temp2
END;

GO 

DECLARE @value int;
SELECT @value = COUNT(*) FROM [dbo].[TypeAds];
IF @value > 8
  PRINT 'new records inserted'
ELSE
  PRINT 'No records inserted'

GO 




