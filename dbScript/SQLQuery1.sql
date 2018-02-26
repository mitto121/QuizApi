USE [QuizMasterDB]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 2/26/2018 4:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[QuestionId] [int] NULL,
	[IsAnswer] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Options__3214EC070C7452F1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/26/2018 4:01:49 PM ******/
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
/****** Object:  Table [dbo].[Quizes]    Script Date: 2/26/2018 4:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__Quizes__3214EC07367F6981] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizResult]    Script Date: 2/26/2018 4:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[QuizId] [int] NULL,
	[QuestionId] [int] NULL,
	[SelectedOptionId] [int] NULL,
	[AttemptDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/26/2018 4:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](120) NULL,
	[LastName] [nvarchar](120) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](80) NULL,
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
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (1, N'1055', N'Exception', 2, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (2, N'1056', N'StackMemoryException', 2, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (3, N'1057', N'DivideByZeroException', 2, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (4, N'1058', N'InvalidOperationException', 2, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (5, N'1055', N'Compiler', 3, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (6, N'1056', N'CLR', 3, 1, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (7, N'1057', N'Linker', 3, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (8, N'1058', N'Operating system', 3, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (12, N'1055', N'Private Assemblies', 1, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (13, N'1056', N'Friend Assemblies', 1, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (15, N'1057', N'Public Assemblies', 1, 0, 1)
GO
INSERT [dbo].[Options] ([Id], [Code], [Name], [QuestionId], [IsAnswer], [IsActive]) VALUES (16, N'1058', N'Shared Assemblies', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (1, N'Which of the following assemblies can be stored in Global Assembly Cache?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (2, N'Which of the following is NOT a .NET Exception class?', 2, 1)
GO
INSERT [dbo].[Questions] ([Id], [Name], [QuizId], [IsActive]) VALUES (3, N'In C#.NET if we do not catch the exception thrown at runtime then which of the following will catch it?', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Quizes] ON 

GO
INSERT [dbo].[Quizes] ([Id], [Name], [Description], [IsActive], [CreatedDate]) VALUES (1, N'MVC', N'MVC Quiz (contains  mvc, web API,Entity Framework etc.)', 1, CAST(0x0000A89300000000 AS DateTime))
GO
INSERT [dbo].[Quizes] ([Id], [Name], [Description], [IsActive], [CreatedDate]) VALUES (2, N'C# and .Net Framework', N'C# and .Net Quiz (contains C#, .Net Framework, Linq, etc.)', 1, CAST(0x0000A89300000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Quizes] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F284568A817EDC]    Script Date: 2/26/2018 4:01:49 PM ******/
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
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__Quest__2F10007B] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK__QuizResul__Quest__2F10007B]
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__QuizI__2E1BDC42] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizes] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK__QuizResul__QuizI__2E1BDC42]
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__Selec__300424B4] FOREIGN KEY([SelectedOptionId])
REFERENCES [dbo].[Options] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK__QuizResul__Selec__300424B4]
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK__QuizResul__UserI__2D27B809] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK__QuizResul__UserI__2D27B809]
GO
