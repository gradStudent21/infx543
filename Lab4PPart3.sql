
if not exists(select * from sys.databases where name = 'Augustamar_Pierre_Test')
    create database Augustamar_Pierre_Test
GO

USE [Augustamar_Pierre_Test]

GO

/****** Object:  Table [dbo].[TargetCustomers]    Script Date: 2/21/2016 3:44:14 PM ******/
GO

CREATE TABLE [dbo].[TargetCustomers](
	[TargetID] [int]  NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[city] [varchar](40) NOT NULL,
	[State] [Varchar](2) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL
	
PRIMARY KEY CLUSTERED 
(
	[TargetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


CREATE TABLE [dbo].[MailingLists](
	[MailingListID] [int] NOT NULL,
	[MailingList] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MailingListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[TargetMailingLists](
	[TargetID] [int] NOT NULL,
	[MailingListID] [int] NOT NULL,
	
PRIMARY KEY CLUSTERED 
(
	[TargetID] ASC,
	[MailingListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TargetMailingLists]  WITH CHECK ADD FOREIGN KEY([TargetID])
REFERENCES [dbo].[TargetCustomers] ([TargetID])
GO

ALTER TABLE [dbo].[TargetMailingLists]  WITH CHECK ADD FOREIGN KEY([MailingListID])
REFERENCES [dbo].[MailingLists] ([MailingListID])
GO

