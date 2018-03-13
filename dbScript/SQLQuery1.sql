USE [QuizMasterDB]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 3/13/2018 11:54:24 AM ******/
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
/****** Object:  Table [dbo].[Participants]    Script Date: 3/13/2018 11:54:24 AM ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 3/13/2018 11:54:24 AM ******/
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
/****** Object:  Table [dbo].[QuizAttemptDetails]    Script Date: 3/13/2018 11:54:24 AM ******/
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
/****** Object:  Table [dbo].[Quizes]    Script Date: 3/13/2018 11:54:24 AM ******/
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
/****** Object:  Table [dbo].[QuizResults]    Script Date: 3/13/2018 11:54:24 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 3/13/2018 11:54:24 AM ******/
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
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Participants] ON 

GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (4, N'Jhon', CAST(0x31170B00 AS Date), N'jhon121@gmail.com', 1)
GO
INSERT [dbo].[Participants] ([Id], [Name], [DateOfBirth], [Email], [IsActive]) VALUES (5, N'Ajay kumar', CAST(0x57140B00 AS Date), N'ajay@gmail.com', 1)
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
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizAttemptDetails] ON 

GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (7, CAST(0x0000A8A200A7B411 AS DateTime), 5, 1)
GO
INSERT [dbo].[QuizAttemptDetails] ([Id], [AttemptDate], [ParticipantId], [QuizId]) VALUES (8, CAST(0x0000A8C100A81F32 AS DateTime), 5, 1)
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
SET IDENTITY_INSERT [dbo].[QuizResults] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [UserName], [Password], [IsActive], [CreatedDate]) VALUES (1, N'Mitto', N'Pal', N'mitto121@gmail.com', N'admin', N'YWRtaW4=', 1, CAST(0x0000A89801781600 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Particip__A9D105345CB54A89]    Script Date: 3/13/2018 11:54:24 AM ******/
ALTER TABLE [dbo].[Participants] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F284566C03842A]    Script Date: 3/13/2018 11:54:24 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F284568A817EDC]    Script Date: 3/13/2018 11:54:24 AM ******/
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
