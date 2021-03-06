Create database db_bankapp
go

USE [db_bankapp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] NOT NULL,
	[AccountNumber] [varchar](16) NULL,
	[Balance] [money] NULL,
	[pin] [int] NULL,
	[DateOfOpening] [datetime] NULL,
	[DateOfClose] [datetime] NULL,
	[AccountStatusId] [int] NULL,
	[AccountTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountStatus](
	[AccountStatusId] [int] NOT NULL,
	[AccountStatusName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountTransaction]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTransaction](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [money] NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionTypeId] [int] NULL,
	[TransactionStatusId] [int] NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountTypeId] [int] NOT NULL,
	[AccountTypeName] [varchar](20) NULL,
	[MinBalance] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] NOT NULL,
	[DoorNumber] [varchar](10) NULL,
	[StreetName] [varchar](20) NULL,
	[City] [varchar](12) NULL,
	[AddressState] [varchar](20) NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](20) NULL,
	[MobileNumber] [varchar](12) NULL,
	[EmailId] [varchar](20) NULL,
 CONSTRAINT [PK__Customer__A4AE64D8E9409A87] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[AccountId] [int] NULL,
	[CustomerId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Privilege]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Privilege](
	[PrivilegeId] [int] NOT NULL,
	[PrivilegeName] [varchar](20) NULL,
	[DailyLimit] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionStatus]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionStatus](
	[TransactionStatusId] [int] NOT NULL,
	[TransactionStatusName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [int] NOT NULL,
	[TransactionTypeName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[AccountId] [int] NOT NULL,
	[CustomerName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccountBalance]    Script Date: 24/04/2020 15:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccountBalance](
	[AccountId] [int] NULL,
	[Balance] [float] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (100, N'1000', 4792.7412, 2340, CAST(N'2018-01-01 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (101, N'1001', 7161.6139, 2341, CAST(N'2018-02-01 00:00:00.000' AS DateTime), NULL, 1101, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (102, N'1002', 1245.8939, 2342, CAST(N'2018-03-01 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (103, N'1003', 1026.0000, 2343, CAST(N'2018-04-01 00:00:00.000' AS DateTime), NULL, 1101, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (104, N'1004', 1248.3249, 2344, CAST(N'2018-05-01 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (105, N'1005', 1028.0000, 2345, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL, 1101, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (106, N'1006', 1250.7559, 2346, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (107, N'1007', 1030.0000, 2347, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL, 1101, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (108, N'1008', 1253.1870, 2348, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (109, N'1009', 1032.0000, 2349, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL, 1101, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (110, N'1010', 121550.6250, 1234, CAST(N'2018-03-21 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (111, N'1011', 105000.0000, 1657, CAST(N'2016-06-21 00:00:00.000' AS DateTime), CAST(N'2018-07-01 00:00:00.000' AS DateTime), 1102, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (112, N'1013', 160446.8250, 3610, CAST(N'2013-05-11 00:00:00.000' AS DateTime), NULL, 1101, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (113, N'1014', 126399.5021, 7393, CAST(N'2017-03-21 00:00:00.000' AS DateTime), NULL, 1101, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (114, N'1015', 105676.0000, 6747, CAST(N'2018-03-21 00:00:00.000' AS DateTime), CAST(N'2018-07-01 00:00:00.000' AS DateTime), 1102, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (115, N'1016', 0.0000, 6575, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (116, N'1017', 0.0000, 8735, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (117, N'1018', 0.0000, 7453, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (118, N'1019', 0.0000, 4557, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (119, N'1020', 0.0000, 5689, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (120, N'1021', 0.0000, 8055, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (121, N'1022', 0.0000, 5455, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (122, N'1023', 0.0000, 5457, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (123, N'1024', 0.0000, 8888, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (124, N'1025', 0.0000, 4848, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (125, N'1026', 0.0000, 4564, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (126, N'1027', 0.0000, 6589, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (127, N'1028', 0.0000, 1254, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (128, N'1029', 0.0000, 8456, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (129, N'1030', 0.0000, 4586, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (130, N'1031', 0.0000, 7845, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (200, N'2000', 0.0000, 1221, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (201, N'2002', 0.0000, 5456, NULL, NULL, 1103, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (202, N'2003', 0.0000, 5676, NULL, NULL, 1103, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (203, N'2004', 0.0000, 8709, NULL, NULL, 1103, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (204, N'2005', 0.0000, 7843, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (205, N'2006', 0.0000, 1256, NULL, NULL, 1103, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (206, N'2008', 0.0000, 6786, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (207, N'2009', 0.0000, 8709, NULL, NULL, 1103, 102)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (208, N'2010', 0.0000, 6786, NULL, NULL, 1103, 101)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [pin], [DateOfOpening], [DateOfClose], [AccountStatusId], [AccountTypeID]) VALUES (209, N'2011', 0.0000, 4580, NULL, NULL, 1103, 102)
INSERT [dbo].[AccountStatus] ([AccountStatusId], [AccountStatusName]) VALUES (1101, N'Active')
INSERT [dbo].[AccountStatus] ([AccountStatusId], [AccountStatusName]) VALUES (1102, N'Inctive')
INSERT [dbo].[AccountStatus] ([AccountStatusId], [AccountStatusName]) VALUES (1103, N'New')
SET IDENTITY_INSERT [dbo].[AccountTransaction] ON 

INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (7, 2120.0000, CAST(N'2018-07-30 10:13:19.693' AS DateTime), 15001, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (8, 2120.0000, CAST(N'2018-07-30 10:28:48.737' AS DateTime), 15001, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (9, 2120.0000, CAST(N'2018-07-30 10:40:57.787' AS DateTime), 15001, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (10, 2120.0000, CAST(N'2018-07-30 11:30:19.567' AS DateTime), 15002, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (11, 2120.0000, CAST(N'2018-07-30 11:58:10.620' AS DateTime), 15002, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (12, 2120.0000, CAST(N'2018-07-30 12:00:22.903' AS DateTime), 15002, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (13, 2120.0000, CAST(N'2018-07-30 12:00:46.380' AS DateTime), 15002, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (14, 2120.0000, CAST(N'2018-07-30 12:02:42.607' AS DateTime), 15002, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (15, 2120.0000, CAST(N'2018-07-30 12:03:09.997' AS DateTime), 15002, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (16, 2120.0000, CAST(N'2018-07-30 12:03:19.617' AS DateTime), 15002, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (17, 2120.0000, CAST(N'2018-07-30 12:03:45.010' AS DateTime), 15002, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (18, 2120.0000, CAST(N'2018-07-30 12:04:03.887' AS DateTime), 15002, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (19, 2120.0000, CAST(N'2018-07-30 12:06:27.747' AS DateTime), 15002, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (20, 120.0000, CAST(N'2018-07-30 12:10:25.507' AS DateTime), 15002, 1001, 100)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (21, 1200.0000, CAST(N'2018-07-30 12:17:42.960' AS DateTime), 15002, 1001, 100)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (48, 217.3579, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (49, 491.1944, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (50, 56.5031, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (51, 0.0000, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (52, 56.6134, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (53, 0.0000, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (54, 56.7236, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (55, 0.0000, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (56, 56.8339, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (57, 0.0000, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (58, 5512.5000, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (59, 7276.5000, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (60, 8669.3760, CAST(N'2018-07-30 15:32:05.837' AS DateTime), 15001, 1001, NULL)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (61, 228.2258, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 100)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (62, 530.4899, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 101)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (63, 59.3283, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 102)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (64, 0.0000, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 103)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (65, 59.4440, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 104)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (66, 0.0000, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 105)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (67, 59.5598, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 106)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (68, 0.0000, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 107)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (69, 59.6756, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 108)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (70, 0.0000, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 109)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (71, 5788.1250, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 110)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (72, 7640.3250, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 112)
INSERT [dbo].[AccountTransaction] ([TransactionId], [Amount], [TransactionDate], [TransactionTypeId], [TransactionStatusId], [AccountId]) VALUES (73, 9362.9261, CAST(N'2018-07-30 15:33:32.840' AS DateTime), 15001, 1001, 113)
SET IDENTITY_INSERT [dbo].[AccountTransaction] OFF
INSERT [dbo].[AccountType] ([AccountTypeId], [AccountTypeName], [MinBalance]) VALUES (101, N'Savings', 1000.0000)
INSERT [dbo].[AccountType] ([AccountTypeId], [AccountTypeName], [MinBalance]) VALUES (102, N'Current', 5000.0000)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (101, N'20', N'Hebbal', N'Bangalore', N'Karnataka', 1)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (102, N'240', N'MG road', N'Chennai', N'TamilNadu', 2)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (103, N'94', N'ST road', N'Mysore', N'Karnataka', 3)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (104, N'49', N'Gandhiroad', N'Hyderabad', N'Telengana', 4)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (105, N'23', N'JS Nagar', N'Ahmedabad', N'Gujarat', 5)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (106, N'15', N'Anisabad', N'Patna', N'Bihar', 6)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (107, N'31', N'Yelahanka', N'Bangalore', N'Karnataka', 7)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (108, N'55', N'Whitefield', N'Bangalore', N'Karnataka', 8)
INSERT [dbo].[Address] ([AddressId], [DoorNumber], [StreetName], [City], [AddressState], [CustomerId]) VALUES (109, N'25', N'Whitefield', N'Bangalore', N'Karnataka', 9)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (1, N'Akash', N'9838838388', N'aksh@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (2, N'Kush', N'9076763524', N'Kush@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (3, N'Praveen', N'9620834490', N'praveen@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (4, N'Vijay', N'9819267184', N'vijay@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (5, N'Shashank', N'7256789654', N'shashank@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (6, N'Arjit', N'8765569654', N'arjit@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (7, N'Mohandas', N'9591150819', N'mkgandhi@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (8, N'Ravi', N'9987463215', N'ravi@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (9, N'Sanajay', N'987456321', N'sanjay@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (10, N'Shashi', N'8971472005', N'shashi@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (11, N'Akash', N'9838838388', N'aksh@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (12, N'Ravi', N'9900393939', N'ravi@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (13, N'Ravi', N'9900393939', N'ravi@gmail.com')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [MobileNumber], [EmailId]) VALUES (14, N'Shanu', N'89393939393', N'shanu@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (100, 1)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (101, 1)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (102, 2)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (103, 2)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (104, 3)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (105, 3)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (106, 4)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (107, 4)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (108, 5)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (109, 5)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (110, 6)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (111, 6)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (112, 7)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (113, 7)
INSERT [dbo].[CustomerAccount] ([AccountId], [CustomerId]) VALUES (114, 8)
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [DailyLimit]) VALUES (2001, N'REGULAR', 100000.0000)
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [DailyLimit]) VALUES (2002, N'GOLD', 200000.0000)
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [DailyLimit]) VALUES (2003, N'PREMIUM', 300000.0000)
INSERT [dbo].[TransactionStatus] ([TransactionStatusId], [TransactionStatusName]) VALUES (1001, N'Success')
INSERT [dbo].[TransactionStatus] ([TransactionStatusId], [TransactionStatusName]) VALUES (1002, N'Denied')
INSERT [dbo].[TransactionStatus] ([TransactionStatusId], [TransactionStatusName]) VALUES (1003, N'Cancelled')
INSERT [dbo].[TransactionStatus] ([TransactionStatusId], [TransactionStatusName]) VALUES (1004, N'Pending')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (15001, N'Deposit')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (15002, N'Withdraw')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (15003, N'Transfer')
INSERT [dbo].[UserAccount] ([AccountId], [CustomerName]) VALUES (1, N'Ravi')
INSERT [dbo].[UserAccount] ([AccountId], [CustomerName]) VALUES (2, N'Shashi')
INSERT [dbo].[UserAccountBalance] ([AccountId], [Balance]) VALUES (1, 0)
INSERT [dbo].[UserAccountBalance] ([AccountId], [Balance]) VALUES (2, 0)
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountStatusId])
REFERENCES [dbo].[AccountStatus] ([AccountStatusId])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountType] ([AccountTypeId])
GO
ALTER TABLE [dbo].[AccountTransaction]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[AccountTransaction]  WITH CHECK ADD FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[AccountTransaction]  WITH CHECK ADD FOREIGN KEY([TransactionStatusId])
REFERENCES [dbo].[TransactionStatus] ([TransactionStatusId])
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK__Address__Custome__286302EC] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK__Address__Custome__286302EC]
GO
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK__CustomerA__Custo__2A4B4B5E] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK__CustomerA__Custo__2A4B4B5E]
GO
