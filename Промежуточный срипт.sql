USE [master]
GO
/****** Object:  Database [TransmashDB]    Script Date: 12.05.2022 3:11:59 AM ******/
CREATE DATABASE [TransmashDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransmashDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TransmashDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransmashDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TransmashDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TransmashDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransmashDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransmashDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransmashDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransmashDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransmashDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransmashDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransmashDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TransmashDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransmashDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransmashDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransmashDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransmashDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransmashDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransmashDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransmashDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransmashDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TransmashDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransmashDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransmashDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransmashDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransmashDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransmashDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TransmashDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransmashDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TransmashDB] SET  MULTI_USER 
GO
ALTER DATABASE [TransmashDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransmashDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransmashDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransmashDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TransmashDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TransmashDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TransmashDB] SET QUERY_STORE = OFF
GO
USE [TransmashDB]
GO
/****** Object:  Table [dbo].[Initiator]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Initiator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Initiator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompTask]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompTask](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[PerformerId] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[expenses] [float] NOT NULL,
 CONSTRAINT [PK_CompTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impoprtance]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impoprtance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Impoprtance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InitiatoriId] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[note] [varchar](150) NOT NULL,
	[filing_date] [date] NOT NULL,
	[complete_date] [date] NULL,
	[ImportanceId] [int] NOT NULL,
	[isArchived] [bit] NOT NULL,
	[daysToComplete] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[sourceDoc] [int] NOT NULL,
 CONSTRAINT [PK_Complaint] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ComplaintView]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ComplaintView]
AS
SELECT        dbo.Complaint.id AS ComplaintId, dbo.Complaint.description, dbo.Complaint.note, dbo.Complaint.filing_date, dbo.Complaint.complete_date, dbo.Complaint.daysToComplete, dbo.Initiator.title, 
                         dbo.Impoprtance.title AS ImportanceTitle, dbo.Status.title AS StatusTitle, dbo.Complaint.InitiatoriId, dbo.Complaint.ImportanceId, dbo.Complaint.StatusId, dbo.Complaint.isArchived, ISNULL(SUM(dbo.CompTask.expenses), 0) 
                         AS expenses, dbo.Complaint.sourceDoc
FROM            dbo.Complaint INNER JOIN
                         dbo.Impoprtance ON dbo.Complaint.ImportanceId = dbo.Impoprtance.id INNER JOIN
                         dbo.Initiator ON dbo.Complaint.InitiatoriId = dbo.Initiator.id INNER JOIN
                         dbo.Status ON dbo.Complaint.StatusId = dbo.Status.id LEFT OUTER JOIN
                         dbo.CompTask ON dbo.Complaint.id = dbo.CompTask.ComplaintId
GROUP BY dbo.Complaint.description, dbo.Complaint.note, dbo.Complaint.filing_date, dbo.Complaint.complete_date, dbo.Complaint.daysToComplete, dbo.Initiator.title, dbo.Impoprtance.title, dbo.Status.title, dbo.Complaint.InitiatoriId, 
                         dbo.Complaint.ImportanceId, dbo.Complaint.StatusId, dbo.Complaint.isArchived, dbo.Complaint.id, dbo.Complaint.sourceDoc
GO
/****** Object:  Table [dbo].[Performer]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Performer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TaskView]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TaskView]
AS
SELECT        dbo.CompTask.id, dbo.CompTask.ComplaintId, dbo.CompTask.TaskId, dbo.CompTask.PerformerId, dbo.Task.title, dbo.Performer.fio, dbo.CompTask.start_date, dbo.CompTask.end_date, dbo.CompTask.expenses
FROM            dbo.Complaint INNER JOIN
                         dbo.CompTask ON dbo.Complaint.id = dbo.CompTask.ComplaintId INNER JOIN
                         dbo.Task ON dbo.CompTask.TaskId = dbo.Task.id INNER JOIN
                         dbo.Performer ON dbo.CompTask.PerformerId = dbo.Performer.id
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.05.2022 3:11:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fio] [varchar](70) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([id], [InitiatoriId], [description], [note], [filing_date], [complete_date], [ImportanceId], [isArchived], [daysToComplete], [StatusId], [sourceDoc]) VALUES (1, 1, N'Общие задачи', N'', CAST(N'2000-01-01' AS Date), CAST(N'2000-01-01' AS Date), 1, 0, 0, 3, 0)
INSERT [dbo].[Complaint] ([id], [InitiatoriId], [description], [note], [filing_date], [complete_date], [ImportanceId], [isArchived], [daysToComplete], [StatusId], [sourceDoc]) VALUES (2, 1, N'Отсутствие подачи кислорода после открытия вентиля', N'', CAST(N'2022-05-12' AS Date), NULL, 3, 0, 5, 2, 1)
INSERT [dbo].[Complaint] ([id], [InitiatoriId], [description], [note], [filing_date], [complete_date], [ImportanceId], [isArchived], [daysToComplete], [StatusId], [sourceDoc]) VALUES (3, 6, N'Неполадки в кислородной системе', N'', CAST(N'2022-05-12' AS Date), NULL, 3, 0, 10, 2, 2)
INSERT [dbo].[Complaint] ([id], [InitiatoriId], [description], [note], [filing_date], [complete_date], [ImportanceId], [isArchived], [daysToComplete], [StatusId], [sourceDoc]) VALUES (4, 7, N'Повышенное сопротивление на выдохе респиратора', N'', CAST(N'2022-05-12' AS Date), NULL, 2, 0, 10, 2, 3)
INSERT [dbo].[Complaint] ([id], [InitiatoriId], [description], [note], [filing_date], [complete_date], [ImportanceId], [isArchived], [daysToComplete], [StatusId], [sourceDoc]) VALUES (5, 7, N'Неисправность вентиля', N'', CAST(N'2022-05-12' AS Date), NULL, 2, 0, 10, 2, 4)
INSERT [dbo].[Complaint] ([id], [InitiatoriId], [description], [note], [filing_date], [complete_date], [ImportanceId], [isArchived], [daysToComplete], [StatusId], [sourceDoc]) VALUES (6, 7, N'Давление газа на выходе не соответствует номиналу', N'', CAST(N'2022-05-12' AS Date), NULL, 1, 0, 10, 2, 6)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
GO
SET IDENTITY_INSERT [dbo].[Impoprtance] ON 

INSERT [dbo].[Impoprtance] ([id], [title]) VALUES (1, N'Обычная')
INSERT [dbo].[Impoprtance] ([id], [title]) VALUES (2, N'Низкая')
INSERT [dbo].[Impoprtance] ([id], [title]) VALUES (3, N'Высокая')
SET IDENTITY_INSERT [dbo].[Impoprtance] OFF
GO
SET IDENTITY_INSERT [dbo].[Initiator] ON 

INSERT [dbo].[Initiator] ([id], [title]) VALUES (1, N'Директор Орехово-Зуевской поликлиники №1 Иванов Иван Викторович')
INSERT [dbo].[Initiator] ([id], [title]) VALUES (6, N'Директор Авиационного завода "Авиастрой" Песков Виктор Сергеевич')
INSERT [dbo].[Initiator] ([id], [title]) VALUES (7, N'Владелец магазина "Дыши чисто" Лихачёв Бенедикт Рудольфович')
SET IDENTITY_INSERT [dbo].[Initiator] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [title]) VALUES (1, N'Просрочена')
INSERT [dbo].[Status] ([id], [title]) VALUES (2, N'Выполняется')
INSERT [dbo].[Status] ([id], [title]) VALUES (3, N'Закрыта')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [login], [password], [fio]) VALUES (1, N'1', N'1', NULL)
INSERT [dbo].[User] ([id], [login], [password], [fio]) VALUES (2, N'ilya', N'999999', N'Маркин Илья Алексеевич')
INSERT [dbo].[User] ([id], [login], [password], [fio]) VALUES (3, N'ilya1111', N'ilya1111', NULL)
INSERT [dbo].[User] ([id], [login], [password], [fio]) VALUES (4, N'markia', N'111111', N'Маркин Илья Алексеевич')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Complaint] ADD  CONSTRAINT [DF_Complaint_isArchived]  DEFAULT ((0)) FOR [isArchived]
GO
ALTER TABLE [dbo].[Complaint] ADD  CONSTRAINT [DF_Complaint_daysToComplete]  DEFAULT ((7)) FOR [daysToComplete]
GO
ALTER TABLE [dbo].[Complaint] ADD  CONSTRAINT [DF_Complaint_StatusId]  DEFAULT ((2)) FOR [StatusId]
GO
ALTER TABLE [dbo].[CompTask] ADD  CONSTRAINT [DF_CompTask_expenses]  DEFAULT ((0)) FOR [expenses]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_Impoprtance] FOREIGN KEY([ImportanceId])
REFERENCES [dbo].[Impoprtance] ([id])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_Impoprtance]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_Initiator] FOREIGN KEY([InitiatoriId])
REFERENCES [dbo].[Initiator] ([id])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_Initiator]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_Status]
GO
ALTER TABLE [dbo].[CompTask]  WITH CHECK ADD  CONSTRAINT [FK_CompTask_Complaint] FOREIGN KEY([ComplaintId])
REFERENCES [dbo].[Complaint] ([id])
GO
ALTER TABLE [dbo].[CompTask] CHECK CONSTRAINT [FK_CompTask_Complaint]
GO
ALTER TABLE [dbo].[CompTask]  WITH CHECK ADD  CONSTRAINT [FK_CompTask_Performer] FOREIGN KEY([PerformerId])
REFERENCES [dbo].[Performer] ([id])
GO
ALTER TABLE [dbo].[CompTask] CHECK CONSTRAINT [FK_CompTask_Performer]
GO
ALTER TABLE [dbo].[CompTask]  WITH CHECK ADD  CONSTRAINT [FK_CompTask_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([id])
GO
ALTER TABLE [dbo].[CompTask] CHECK CONSTRAINT [FK_CompTask_Task]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complaint"
            Begin Extent = 
               Top = 22
               Left = 255
               Bottom = 312
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Impoprtance"
            Begin Extent = 
               Top = 165
               Left = 491
               Bottom = 261
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Initiator"
            Begin Extent = 
               Top = 35
               Left = 493
               Bottom = 129
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 231
               Left = 46
               Bottom = 327
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompTask"
            Begin Extent = 
               Top = 28
               Left = 41
               Bottom = 212
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1185
         Width = 1725
         Width = 555
         Width = 1020
         Width = 1365
         Width = 1515
         Width = 1500
         Width = 1440
         Width = 1215
         Width = 1005
         Width = 1260
         Width = 825
         Width = 1020
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ComplaintView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 915
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ComplaintView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ComplaintView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complaint"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompTask"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 136
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Task"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 102
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Performer"
            Begin Extent = 
               Top = 6
               Left = 678
               Bottom = 102
               Right = 852
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TaskView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TaskView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TaskView'
GO
USE [master]
GO
ALTER DATABASE [TransmashDB] SET  READ_WRITE 
GO
