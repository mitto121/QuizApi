USE [QuizMasterDB]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[QuestionId] [int] NULL,
	[IsAnswer] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Options__3214EC070C7452F1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Participants]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[QuizId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Question__3214EC0729DC7158] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizAttemptDetails]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAttemptDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttemptDate] [datetime] NOT NULL,
	[ParticipantId] [int] NULL,
	[QuizId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quizes]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Duration] [int] NOT NULL,
	[PassingPercentage] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__Quizes__3214EC07367F6981] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizResults]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizResults](
	[SNo] [int] IDENTITY(1,1) NOT NULL,
	[AttemptId] [int] NULL,
	[QuestionId] [int] NULL,
	[SelectedAnswer] [int] NULL,
	[ActualAnswer] [int] NULL,
 CONSTRAINT [PK__QuizResu__CA1EE04CEED7A077] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/16/2018 4:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](120) NULL,
	[LastName] [nvarchar](120) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](80) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__Users__3214EC079FC3E23B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Options] ON 

GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (53, N'1055', N'It is an abstract Class', 30, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (54, N'1056', N'It is a Concrete Class', 30, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (55, N'1057', N'Both A and B', 30, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (56, N'1058', N'None', 30, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (57, N'1055', N'It is an abstract Class', 31, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (58, N'1056', N'It is a Concrete Class', 31, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (59, N'1057', N'Both A and B', 31, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (60, N'1058', N'None', 31, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (61, N'1055', N'Views', 32, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (62, N'1056', N'Account', 32, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (63, N'1057', N'Shared', 32, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (64, N'1058', N'Home', 32, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (65, N'1055', N'_ViewStart.cshtml', 33, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (66, N'1056', N'_Layout.cshtml', 33, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (67, N'1057', N'_Login.cshtml', 33, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (68, N'1058', N'None', 33, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (69, N'1055', N'@Html.Partial("_PartialHeader")', 34, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (70, N'1056', N'@Html.PartialView("_PartialHeader")', 34, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (71, N'1057', N'@Html.PartialHtml("_PartialHeader") ', 34, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (72, N'1058', N'B and C', 34, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (73, N'1059', N'None', 34, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (74, N'1055', N'Both (TempData/ViewData) requires type casting to avoid null exception.', 35, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (75, N'1056', N'No, these (TempData/ViewData) does not require type casting.', 35, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (76, N'1057', N'Both A) & B)', 35, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (77, N'1058', N'None', 35, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (78, N'1055', N'Yes', 36, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (79, N'1056', N'No', 36, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (80, N'1055', N'Unmanaged', 37, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (81, N'1056', N'Distributed', 37, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (82, N'1057', N'Legacy', 37, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (83, N'1058', N'Managed Code', 37, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (84, N'1059', N'Native Code', 37, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (85, N'1055', N'System.Object', 38, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (86, N'1056', N'System.Type', 38, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (87, N'1057', N'System.Base', 38, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (88, N'1058', N'System.Parent', 38, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (89, N'1059', N'System.Root', 38, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (90, N'1055', N'ToDecimal', 39, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (91, N'1056', N'ToDouble', 39, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (92, N'1057', N'ToInt16', 39, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (93, N'1058', N'ToInt32', 39, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (94, N'1055', N'ToType', 40, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (95, N'1056', N'ToUInt16', 40, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (96, N'1057', N'ToUInt32', 40, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (97, N'1058', N'ToUInt64', 40, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (98, N'1055', N'Value parameters', 41, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (99, N'1056', N'Reference parameters', 41, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (100, N'1057', N'Output parameters', 41, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (101, N'1058', N'None of the above.', 41, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (102, N'1055', N'True', 42, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (103, N'1056', N'False', 42, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (104, N'1055', N'A try block identifies a block of code for which particular exceptions is activated.', 43, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (105, N'1056', N'It is followed by one or more catch blocks.', 43, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (106, N'1057', N'Both of the above.', 43, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (107, N'1058', N'None of the above.', 43, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (108, N'1055', N'< script=’java’>', 44, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (109, N'1056', N'< javascript>	', 44, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (110, N'1057', N'< script>', 44, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (111, N'1058', N'< js>	', 44, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (112, N'1055', N'2', 45, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (113, N'1056', N'5', 45, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (114, N'1055', N'Unmanaged', 46, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (115, N'1056', N'Distributed', 46, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (116, N'1057', N'Legacy', 46, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (117, N'1058', N'Managed Code', 46, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (118, N'1059', N'Native Code', 46, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (119, N'1055', N'2', 47, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (120, N'1056', N'3', 47, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (121, N'1057', N'7', 47, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (122, N'1055', N'It is an abstract Class', 48, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (123, N'1056', N'It is a Concrete Class', 48, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (124, N'1057', N'Both A and B', 48, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (125, N'1058', N'None', 48, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (126, N'1055', N'It is an abstract Class', 49, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (127, N'1056', N'It is a Concrete Class', 49, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (128, N'1057', N'Both A and B', 49, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (129, N'1058', N'None', 49, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (130, N'1055', N'Views', 50, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (131, N'1056', N'Account', 50, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (132, N'1057', N'Shared', 50, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (133, N'1058', N'Home', 50, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (134, N'1055', N'_ViewStart.cshtml', 51, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (135, N'1056', N'_Layout.cshtml', 51, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (136, N'1057', N'_Login.cshtml', 51, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (137, N'1058', N'None', 51, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (138, N'1055', N'@Html.Partial("_PartialHeader")', 52, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (139, N'1056', N'@Html.PartialView("_PartialHeader")', 52, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (140, N'1057', N'@Html.PartialHtml("_PartialHeader") ', 52, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (141, N'1058', N'B and C', 52, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (142, N'1059', N'None', 52, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (143, N'1055', N'Both (TempData/ViewData) requires type casting to avoid null exception.', 53, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (144, N'1056', N'No, these (TempData/ViewData) does not require type casting.', 53, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (145, N'1057', N'Both A) & B)', 53, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (146, N'1058', N'None', 53, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (147, N'1055', N'Yes', 54, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (148, N'1056', N'No', 54, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (149, N'1055', N'Unmanaged', 55, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (150, N'1056', N'Distributed', 55, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (151, N'1057', N'Legacy', 55, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (152, N'1058', N'Managed Code', 55, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (153, N'1059', N'Native Code', 55, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (154, N'1055', N'System.Object', 56, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (155, N'1056', N'System.Type', 56, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (156, N'1057', N'System.Base', 56, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (157, N'1058', N'System.Parent', 56, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (158, N'1059', N'System.Root', 56, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (159, N'1055', N'ToDecimal', 57, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (160, N'1056', N'ToDouble', 57, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (161, N'1057', N'ToInt16', 57, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (162, N'1058', N'ToInt32', 57, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (163, N'1055', N'ToType', 58, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (164, N'1056', N'ToUInt16', 58, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (165, N'1057', N'ToUInt32', 58, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (166, N'1058', N'ToUInt64', 58, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (167, N'1055', N'Value parameters', 59, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (168, N'1056', N'Reference parameters', 59, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (169, N'1057', N'Output parameters', 59, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (170, N'1058', N'None of the above.', 59, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (171, N'1055', N'True', 60, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (172, N'1056', N'False', 60, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (173, N'1055', N'A try block identifies a block of code for which particular exceptions is activated.', 61, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (174, N'1056', N'It is followed by one or more catch blocks.', 61, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (175, N'1057', N'Both of the above.', 61, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (176, N'1058', N'None of the above.', 61, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Participants] ON 

GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (4, N'Jhon', CAST(0x31170B00 AS Date), N'jhon121@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (5, N'Ajay kumar', CAST(0x57140B00 AS Date), N'ajay@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (6, N'Rahul', CAST(0x56140B00 AS Date), N'rahaul@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (7, N'Kamal Sharma', CAST(0x31170B00 AS Date), N'kamal.sharma@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (8, N'Ricky', CAST(0x53170B00 AS Date), N'ricky@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (9, N'Sumit', CAST(0xC7150B00 AS Date), N'sumit@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (10, N'Den', CAST(0xA50E0B00 AS Date), N'den@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (11, N'Jack', CAST(0xC4150B00 AS Date), N'jack@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (12, N'Lisa', CAST(0x6A1A0B00 AS Date), N'lisa.list@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (13, N'Vijay', CAST(0x5A140B00 AS Date), N'vijay@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (14, N'Vikas', CAST(0xEC120B00 AS Date), N'vikas.v@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (15, N'Manoj Singh', CAST(0x7F110B00 AS Date), N'manoj@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Participants] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (30, N'What is ActionResult()', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (31, N'What is ViewResult() ?', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (32, N'Viewstart comes under which folder name ?', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (33, N'What is the name of default Viewstart Page in MVC ?', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (34, N'Which is the way to render Partial View using  MVC Razor Engine?', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (35, N' Are both TempData and ViewData require typecasting in MVC?', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (36, N'Is ViewBag slower than ViewData in MVC?', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (37, N'Code that targets the Common Language Runtime is known as', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (38, N'Which of the following is the root of the .NET type hierarchy?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (39, N'Which of the following converts a floating point or integer type to a decimal type in C#?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (40, N'Which of the following converts a type to an unsigned big type in C#?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (41, N'Which of the following method helps in returning more than one value?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (42, N'Operator overloading is a kind of dynamic polymorphism.', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (43, N'Which of the following is true about try block in C#?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (44, N'To insert a JavaScript into an HTML page, which tag is used?', 3, 0)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (45, N'{
c=a+b
}
', 1, 0)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (46, N'Code that targets the Common Language Runtime is known as', 1, 0)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (47, N'1+2=?', 1, 0)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (48, N'What is ActionResult()', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (49, N'What is ViewResult() ?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (50, N'Viewstart comes under which folder name ?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (51, N'What is the name of default Viewstart Page in MVC ?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (52, N'Which is the way to render Partial View using  MVC Razor Engine?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (53, N' Are both TempData and ViewData require typecasting in MVC?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (54, N'Is ViewBag slower than ViewData in MVC?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (55, N'Code that targets the Common Language Runtime is known as', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (56, N'Which of the following is the root of the .NET type hierarchy?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (57, N'Which of the following converts a floating point or integer type to a decimal type in C#?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (58, N'Which of the following converts a type to an unsigned big type in C#?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (59, N'Which of the following method helps in returning more than one value?', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (60, N'Operator overloading is a kind of dynamic polymorphism.', 4, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (61, N'Which of the following is true about try block in C#?', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizAttemptDetails] ON 

GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (7, CAST(0x0000A8A200A7B411 AS DateTime), 5, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (8, CAST(0x0000A8C100A81F32 AS DateTime), 5, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (9, CAST(0x0000A8A20138D6D3 AS DateTime), 5, 2)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (10, CAST(0x0000A8A301050CF0 AS DateTime), 7, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (11, CAST(0x0000A8A30105A674 AS DateTime), 8, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (12, CAST(0x0000A8A400ADF112 AS DateTime), 9, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (13, CAST(0x0000A8A400BC036D AS DateTime), 10, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (14, CAST(0x0000A8A400BC68D0 AS DateTime), 11, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (15, CAST(0x0000A8A500A0EBC8 AS DateTime), 12, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (16, CAST(0x0000A8A500A96ADE AS DateTime), 13, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (17, CAST(0x0000A8A500A96EBC AS DateTime), 13, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (18, CAST(0x0000A8A500AE8613 AS DateTime), 7, 2)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (19, CAST(0x0000A8A500B1CFE5 AS DateTime), 14, 2)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (20, CAST(0x0000A8A500B2A111 AS DateTime), 15, 2)
GO
SET IDENTITY_INSERT [dbo].[QuizAttemptDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Quizes] ON 

GO
INSERT [dbo].[Quizes] ([Id], [Name], [Description], [Duration], [PassingPercentage], [IsActive], [CreatedDate]) VALUES (1, N'MVC', N'MVC Quiz (contains  mvc, web API,Entity Framework etc.)', 30, 40, 1, CAST(0x0000A89300000000 AS DateTime))
GO
INSERT [dbo].[Quizes] ([Id], [Name], [Description], [Duration], [PassingPercentage], [IsActive], [CreatedDate]) VALUES (2, N'C# and .Net Framework', N'C# and .Net Quiz (contains C#, .Net Framework, Linq, etc.)', 45, 60, 1, CAST(0x0000A89300000000 AS DateTime))
GO
INSERT [dbo].[Quizes] ([Id], [Name], [Description], [Duration], [PassingPercentage], [IsActive], [CreatedDate]) VALUES (3, N'Javascript', N'Introduction to Javascript and ECMA Script -6', 60, 55, 1, CAST(0x0000A8A200AF4CF5 AS DateTime))
GO
INSERT [dbo].[Quizes] ([Id], [Name], [Description], [Duration], [PassingPercentage], [IsActive], [CreatedDate]) VALUES (4, N'MVC and C#', N'Mvc with C# and Linq', 90, 50, 1, CAST(0x0000A8A50104C270 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Quizes] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizResults] ON 

GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (22, 7, 30, 53, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (23, 7, 31, 58, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (24, 7, 32, 61, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (25, 7, 33, 65, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (26, 7, 34, 69, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (27, 7, 35, 74, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (28, 7, 36, 78, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (29, 8, 30, 54, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (30, 8, 31, 57, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (31, 8, 32, 61, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (32, 8, 33, 66, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (33, 8, 34, 71, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (34, 8, 35, 75, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (35, 8, 36, 78, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (36, 9, 37, NULL, 83)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (37, 9, 38, NULL, 85)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (38, 9, 39, NULL, 90)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (39, 9, 40, NULL, 97)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (40, 9, 41, NULL, 100)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (41, 9, 42, NULL, 103)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (42, 9, 43, NULL, 106)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (43, 10, 30, 53, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (44, 10, 31, 59, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (45, 10, 32, 61, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (46, 10, 33, 66, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (47, 10, 34, 70, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (48, 10, 35, 74, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (49, 10, 36, 78, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (50, 11, 30, 53, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (51, 11, 31, 57, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (52, 11, 32, 61, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (53, 11, 33, 66, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (54, 11, 34, 69, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (55, 11, 35, 74, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (56, 11, 36, 79, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (57, 12, 30, NULL, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (58, 12, 31, NULL, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (59, 12, 32, NULL, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (60, 12, 33, NULL, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (61, 12, 34, NULL, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (62, 12, 35, NULL, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (63, 12, 36, NULL, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (64, 13, 30, 53, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (65, 13, 31, 57, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (66, 13, 32, 61, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (67, 13, 33, NULL, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (68, 13, 34, NULL, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (69, 13, 35, NULL, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (70, 13, 36, NULL, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (71, 14, 30, 53, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (72, 14, 31, 58, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (73, 14, 32, 63, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (74, 14, 33, 65, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (75, 14, 34, 69, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (76, 14, 35, 75, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (77, 14, 36, 78, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (78, 15, 30, NULL, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (79, 15, 31, NULL, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (80, 15, 32, NULL, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (81, 15, 33, NULL, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (82, 15, 34, NULL, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (83, 15, 35, NULL, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (84, 15, 36, NULL, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (85, 15, 46, NULL, 117)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (86, 15, 47, NULL, 120)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (87, 16, 30, 53, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (88, 16, 31, 58, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (89, 16, 32, 61, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (90, 16, 33, 65, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (91, 16, 34, 71, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (92, 16, 35, 74, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (93, 16, 36, 78, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (94, 16, 46, 116, 117)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (95, 16, 47, 120, 120)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (96, 17, 30, NULL, 53)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (97, 17, 31, NULL, 58)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (98, 17, 32, NULL, 61)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (99, 17, 33, NULL, 65)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (100, 17, 34, NULL, 69)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (101, 17, 35, NULL, 74)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (102, 17, 36, NULL, 78)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (103, 17, 46, NULL, 117)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (104, 17, 47, NULL, 120)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (105, 18, 37, 80, 83)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (106, 18, 38, 87, 85)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (107, 18, 39, 90, 90)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (108, 18, 40, 96, 97)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (109, 18, 41, 98, 100)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (110, 18, 42, 103, 103)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (111, 18, 43, 106, 106)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (112, 19, 37, NULL, 83)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (113, 19, 38, NULL, 85)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (114, 19, 39, NULL, 90)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (115, 19, 40, NULL, 97)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (116, 19, 41, NULL, 100)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (117, 19, 42, NULL, 103)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (118, 19, 43, NULL, 106)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (119, 20, 37, 83, 83)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (120, 20, 38, 85, 85)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (121, 20, 39, 90, 90)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (122, 20, 40, 96, 97)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (123, 20, 41, 100, 100)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (124, 20, 42, 103, 103)
GO
INSERT [dbo].[QuizResults] ([SNo], [AttemptId], [QuestionId], [SelectedAnswer], [ActualAnswer]) VALUES (125, 20, 43, 106, 106)
GO
SET IDENTITY_INSERT [dbo].[QuizResults] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [UserName], [Password], [IsActive], [CreatedDate], [IsAdmin]) VALUES (1, N'Mitto', N'Pal', N'mitto121@gmail.com', N'admin', N'YWRtaW4=', 1, CAST(0x0000A89801781600 AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [UserName], [Password], [IsActive], [CreatedDate], [IsAdmin]) VALUES (2, N'Raj', N'Kumar Sharma', N'raj.k.sharma@gmail.com', N'raj', N'cmFqMTIz', 1, CAST(0x0000A8A500C9F5F1 AS DateTime), 0)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [UserName], [Password], [IsActive], [CreatedDate], [IsAdmin]) VALUES (3, N'Abhimanyu', N'Kumar', N'abhimanyu.kumar@gmail.com', N'abhimanyu', N'YWRiaTEyMQ==', 1, CAST(0x0000A8A500D21534 AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Particip__A9D105345CB54A89]    Script Date: 3/16/2018 4:09:33 PM ******/
ALTER TABLE [dbo].[Participants] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F284566C03842A]    Script Date: 3/16/2018 4:09:33 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F284568A817EDC]    Script Date: 3/16/2018 4:09:33 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__C9F284568A817EDC] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Options] ADD  CONSTRAINT [DF__Options__IsAnswe__276EDEB3]  DEFAULT ((0)) FOR [IsAnswer]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF__Questions__IsAct__239E4DCF]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Quizes] ADD  CONSTRAINT [DF__Quizes__IsActive__1FCDBCEB]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__IsActive__1367E606]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD  CONSTRAINT [FK__Options__Questio__267ABA7A] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Options] CHECK CONSTRAINT [FK__Options__Questio__267ABA7A]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__QuizI__22AA2996] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizes] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__QuizI__22AA2996]
GO
ALTER TABLE [dbo].[QuizAttemptDetails]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizes] ([Id])
GO
ALTER TABLE [dbo].[QuizAttemptDetails]  WITH CHECK ADD  CONSTRAINT [FK_QuizAttemptDetails_Participants] FOREIGN KEY([ParticipantId])
REFERENCES [dbo].[Participants] ([Id])
GO
ALTER TABLE [dbo].[QuizAttemptDetails] CHECK CONSTRAINT [FK_QuizAttemptDetails_Participants]
GO
ALTER TABLE [dbo].[QuizResults]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__Attem__267ABA7A] FOREIGN KEY([AttemptId])
REFERENCES [dbo].[QuizAttemptDetails] ([Id])
GO
ALTER TABLE [dbo].[QuizResults] CHECK CONSTRAINT [FK__QuizResul__Attem__267ABA7A]
GO
ALTER TABLE [dbo].[QuizResults]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__Quest__276EDEB3] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[QuizResults] CHECK CONSTRAINT [FK__QuizResul__Quest__276EDEB3]
GO
ALTER TABLE [dbo].[QuizResults]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__Selec__286302EC] FOREIGN KEY([SelectedAnswer])
REFERENCES [dbo].[Options] ([Id])
GO
ALTER TABLE [dbo].[QuizResults] CHECK CONSTRAINT [FK__QuizResul__Selec__286302EC]
GO
