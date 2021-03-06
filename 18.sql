USE [AcademyHW]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 19.09.2021 2:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](5) NOT NULL,
	[IS_Active] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Updated_at] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 19.09.2021 2:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Created_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Account], [IS_Active], [Created_at], [Updated_at]) VALUES (2, N'2222', 1, CAST(N'2021-09-18T13:11:31.243' AS DateTime), NULL)
INSERT [dbo].[Accounts] ([Id], [Account], [IS_Active], [Created_at], [Updated_at]) VALUES (3, N'00003', 1, CAST(N'2021-09-18T15:48:38.373' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (156, 2, CAST(100.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:22:22.570' AS DateTime))
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (157, 2, CAST(-10.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:23:16.400' AS DateTime))
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (158, 3, CAST(10.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:23:16.407' AS DateTime))
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (159, 2, CAST(-50.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:25:27.393' AS DateTime))
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (160, 3, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:25:27.400' AS DateTime))
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (161, 2, CAST(-10.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:27:28.640' AS DateTime))
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At]) VALUES (162, 3, CAST(10.00 AS Decimal(18, 2)), CAST(N'2021-09-19T02:27:28.647' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [IS_Active]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT (getdate()) FOR [Created_at]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts]
GO
