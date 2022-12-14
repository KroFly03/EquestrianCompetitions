USE [master]
GO
/****** Object:  Database [EquestrianCompetitions]    Script Date: 27.11.2022 19:13:19 ******/
CREATE DATABASE [EquestrianCompetitions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EquestrianCompetitions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EquestrianCompetitions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EquestrianCompetitions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EquestrianCompetitions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EquestrianCompetitions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EquestrianCompetitions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EquestrianCompetitions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET ARITHABORT OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EquestrianCompetitions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EquestrianCompetitions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EquestrianCompetitions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EquestrianCompetitions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EquestrianCompetitions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EquestrianCompetitions] SET  MULTI_USER 
GO
ALTER DATABASE [EquestrianCompetitions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EquestrianCompetitions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EquestrianCompetitions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EquestrianCompetitions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EquestrianCompetitions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EquestrianCompetitions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EquestrianCompetitions] SET QUERY_STORE = OFF
GO
USE [EquestrianCompetitions]
GO
/****** Object:  User [test10]    Script Date: 27.11.2022 19:13:20 ******/
CREATE USER [test10] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[CountHorsePerformance]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[CountHorsePerformance](@horse int)
returns int
as
begin
return (select count(id) from Members
where horse = @horse)
end
GO
/****** Object:  Table [dbo].[RaceMembers]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaceMembers](
	[race] [int] NOT NULL,
	[member] [int] NOT NULL,
	[score] [time](7) NOT NULL,
	[running_track] [int] NOT NULL,
	[uniform_color] [varchar](20) NOT NULL,
	[disqualification] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RaceView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[RaceView] as 
select race, count(race) as amount from RaceMembers
group by race
GO
/****** Object:  Table [dbo].[Jockeys]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jockeys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [varchar](100) NOT NULL,
	[birthday] [date] NOT NULL,
	[rank] [varchar](25) NOT NULL,
	[weight] [decimal](5, 2) NOT NULL,
	[login] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[UserView] as
select Users.[login], [password], [role], id, fio, birthday, [rank], [weight] from Users
join Jockeys on Jockeys.[login] = Users.[login]
GO
/****** Object:  Table [dbo].[Competitions]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competitions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[prize] [money] NOT NULL,
	[judge] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horses]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[age] [int] NOT NULL,
	[breed] [int] NOT NULL,
	[coach] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jockey] [int] NOT NULL,
	[horse] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Races]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Races](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[distance] [int] NOT NULL,
	[competition] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MemberInfoView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MemberInfoView] as 
select fio, [rank], [weight], [name], CAST([date] AS DATE) as [date], concat(distance,'м') as distance from Jockeys
join Members on Members.jockey = Jockeys.id
join Horses on Horses.id = Members.horse
join RaceMembers on RaceMembers.member = Members.id
join Races on Races.id = RaceMembers.race
join Competitions on Competitions.id = Races.competition
GO
/****** Object:  View [dbo].[JockeyInfoView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[JockeyInfoView] as 
select fio,birthday,[rank],[weight] from Jockeys
GO
/****** Object:  Table [dbo].[Breeds]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Breeds](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coaches]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HorseInfoView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[HorseInfoView] as
select Horses.id,Horses.[name] as horse, age, Breeds.[name] as breed, dbo.CountHorsePerformance(Horses.id) as performanceCount, fio as coach from Horses
join Breeds on Breeds.id = Horses.breed
join Coaches on Coaches.id = Horses.coach
GO
/****** Object:  Table [dbo].[Judges]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judges](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [varchar](100) NOT NULL,
	[category] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[login] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CompetitionInfoView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CompetitionInfoView] as 
select Competitions.id,[date], fio, prize from Competitions
join Judges on Judges.id = Competitions.judge
GO
/****** Object:  Table [dbo].[Disqualifications]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disqualifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [bit] NOT NULL,
	[reason] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RaceScoreInfoView]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[RaceScoreInfoView] as 
select competition,race,[date], member,concat(distance,'м') as distance, score, running_track, uniform_color, [disqualification],[status] from RaceMembers
join Races on Races.id = RaceMembers.race
join Competitions on Competitions.id = Races.competition
join Disqualifications on Disqualifications.id = RaceMembers.disqualification
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Breeds] ON 

INSERT [dbo].[Breeds] ([id], [name]) VALUES (1, N'Буденновская')
INSERT [dbo].[Breeds] ([id], [name]) VALUES (2, N'Якутская')
INSERT [dbo].[Breeds] ([id], [name]) VALUES (3, N'Донская')
INSERT [dbo].[Breeds] ([id], [name]) VALUES (4, N'Монгольская')
INSERT [dbo].[Breeds] ([id], [name]) VALUES (5, N'Фриз')
SET IDENTITY_INSERT [dbo].[Breeds] OFF
GO
SET IDENTITY_INSERT [dbo].[Coaches] ON 

INSERT [dbo].[Coaches] ([id], [fio]) VALUES (1, N'Рыбаков Ф.В.')
INSERT [dbo].[Coaches] ([id], [fio]) VALUES (2, N'Муравьев С.Ф.')
INSERT [dbo].[Coaches] ([id], [fio]) VALUES (3, N'Иванов Н.С.')
SET IDENTITY_INSERT [dbo].[Coaches] OFF
GO
SET IDENTITY_INSERT [dbo].[Competitions] ON 

INSERT [dbo].[Competitions] ([id], [date], [prize], [judge]) VALUES (1, CAST(N'2022-10-11T00:00:00.000' AS DateTime), 80500.0000, 2)
INSERT [dbo].[Competitions] ([id], [date], [prize], [judge]) VALUES (2, CAST(N'2022-10-12T00:00:00.000' AS DateTime), 62500.0000, 1)
INSERT [dbo].[Competitions] ([id], [date], [prize], [judge]) VALUES (3, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 76500.0000, 3)
SET IDENTITY_INSERT [dbo].[Competitions] OFF
GO
SET IDENTITY_INSERT [dbo].[Disqualifications] ON 

INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (1, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (2, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (3, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (4, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (5, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (6, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (7, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (8, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (9, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (10, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (11, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (12, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (13, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (14, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (15, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (16, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (17, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (18, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (19, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (20, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (21, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (22, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (23, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (24, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (25, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (26, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (27, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (28, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (29, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (30, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (31, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (32, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (33, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (34, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (35, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (36, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (37, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (38, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (39, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (40, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (41, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (42, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (43, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (44, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (45, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (46, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (47, 0, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (48, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (49, 1, NULL)
INSERT [dbo].[Disqualifications] ([id], [status], [reason]) VALUES (50, 0, NULL)
SET IDENTITY_INSERT [dbo].[Disqualifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Horses] ON 

INSERT [dbo].[Horses] ([id], [name], [age], [breed], [coach]) VALUES (1, N'Искорка', 6, 3, 1)
INSERT [dbo].[Horses] ([id], [name], [age], [breed], [coach]) VALUES (2, N'Бегун', 4, 5, 2)
INSERT [dbo].[Horses] ([id], [name], [age], [breed], [coach]) VALUES (3, N'Флеш', 5, 1, 3)
SET IDENTITY_INSERT [dbo].[Horses] OFF
GO
SET IDENTITY_INSERT [dbo].[Jockeys] ON 

INSERT [dbo].[Jockeys] ([id], [fio], [birthday], [rank], [weight], [login]) VALUES (1, N'Михайлов Н.А.', CAST(N'1999-04-28' AS Date), N'2 уровень', CAST(65.20 AS Decimal(5, 2)), N'jockey1')
INSERT [dbo].[Jockeys] ([id], [fio], [birthday], [rank], [weight], [login]) VALUES (2, N'Ефимов Н.Р.', CAST(N'1996-12-02' AS Date), N'2 уровень', CAST(62.80 AS Decimal(5, 2)), N'jockey2')
INSERT [dbo].[Jockeys] ([id], [fio], [birthday], [rank], [weight], [login]) VALUES (3, N'Мишин К.Л.', CAST(N'1993-05-25' AS Date), N'2 уровень', CAST(83.10 AS Decimal(5, 2)), N'jockey3')
SET IDENTITY_INSERT [dbo].[Jockeys] OFF
GO
SET IDENTITY_INSERT [dbo].[Judges] ON 

INSERT [dbo].[Judges] ([id], [fio], [category], [city], [login]) VALUES (1, N'Антропов А.В.', N'1 категория', N'Москва', N'judge1')
INSERT [dbo].[Judges] ([id], [fio], [category], [city], [login]) VALUES (2, N'Щербаков А.С.', N'3 категория', N'Пермь', N'judge2')
INSERT [dbo].[Judges] ([id], [fio], [category], [city], [login]) VALUES (3, N'Петров П.П.', N'2 категория', N'Сочи', N'judge3')
SET IDENTITY_INSERT [dbo].[Judges] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (1, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (2, 1, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (3, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (4, 1, 1)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (5, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (6, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (7, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (8, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (9, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (10, 1, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (11, 3, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (12, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (13, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (14, 3, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (15, 1, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (16, 1, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (17, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (18, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (19, 3, 1)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (20, 1, 1)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (21, 3, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (22, 2, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (23, 3, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (24, 3, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (25, 3, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (26, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (27, 2, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (28, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (29, 3, 1)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (30, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (31, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (32, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (33, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (34, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (35, 2, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (36, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (37, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (38, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (39, 2, 1)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (40, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (41, 1, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (42, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (43, 3, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (44, 2, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (45, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (46, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (47, 2, 3)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (48, 1, 1)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (49, 2, 2)
INSERT [dbo].[Members] ([id], [jockey], [horse]) VALUES (50, 2, 1)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (9, 1, CAST(N'00:08:20' AS Time), 5, N'purus', 1)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (1, 2, CAST(N'00:06:05' AS Time), 5, N'tellus', 2)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 3, CAST(N'00:09:06' AS Time), 4, N'eget', 3)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 4, CAST(N'00:07:18' AS Time), 2, N'penatibus', 4)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 5, CAST(N'00:06:44' AS Time), 1, N'ante', 5)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (2, 6, CAST(N'00:07:21' AS Time), 6, N'ante.', 6)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 7, CAST(N'00:05:14' AS Time), 6, N'quis,', 7)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 8, CAST(N'00:08:35' AS Time), 1, N'eu,', 8)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (9, 9, CAST(N'00:08:23' AS Time), 1, N'semper', 9)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (2, 10, CAST(N'00:08:16' AS Time), 4, N'adipiscing', 10)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 11, CAST(N'00:05:42' AS Time), 5, N'tortor', 11)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (7, 12, CAST(N'00:08:11' AS Time), 4, N'porta', 12)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (2, 13, CAST(N'00:08:04' AS Time), 4, N'fringilla', 13)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 14, CAST(N'00:09:42' AS Time), 6, N'eu,', 14)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (7, 15, CAST(N'00:06:51' AS Time), 2, N'non', 15)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 16, CAST(N'00:05:01' AS Time), 4, N'dui.', 16)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 17, CAST(N'00:08:12' AS Time), 1, N'purus.', 17)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 18, CAST(N'00:09:38' AS Time), 6, N'Morbi', 18)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (7, 19, CAST(N'00:06:52' AS Time), 4, N'ipsum', 19)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 20, CAST(N'00:05:43' AS Time), 6, N'rutrum', 20)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 21, CAST(N'00:07:15' AS Time), 5, N'dui,', 21)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 22, CAST(N'00:06:31' AS Time), 3, N'ante', 22)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (9, 23, CAST(N'00:08:03' AS Time), 4, N'pellentesque', 23)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 24, CAST(N'00:07:33' AS Time), 4, N'facilisis', 24)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (8, 25, CAST(N'00:09:00' AS Time), 2, N'fringilla', 25)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 26, CAST(N'00:09:22' AS Time), 3, N'scelerisque', 26)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 27, CAST(N'00:09:57' AS Time), 2, N'egestas', 27)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 28, CAST(N'00:06:43' AS Time), 6, N'facilisis', 28)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 29, CAST(N'00:09:47' AS Time), 2, N'Fusce', 29)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 30, CAST(N'00:06:19' AS Time), 3, N'ac,', 30)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 31, CAST(N'00:05:30' AS Time), 3, N'blandit', 31)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (6, 32, CAST(N'00:06:26' AS Time), 5, N'elementum', 32)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (6, 33, CAST(N'00:05:24' AS Time), 3, N'Suspendisse', 33)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 34, CAST(N'00:09:10' AS Time), 2, N'eu', 34)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (2, 35, CAST(N'00:05:14' AS Time), 3, N'vel', 35)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (2, 36, CAST(N'00:08:59' AS Time), 4, N'cursus', 36)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (8, 37, CAST(N'00:06:49' AS Time), 6, N'gravida', 37)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 38, CAST(N'00:09:47' AS Time), 3, N'vestibulum', 38)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 39, CAST(N'00:06:50' AS Time), 4, N'urna,', 39)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (6, 40, CAST(N'00:09:40' AS Time), 6, N'ut', 40)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (1, 41, CAST(N'00:08:49' AS Time), 2, N'feugiat', 41)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (1, 42, CAST(N'00:06:46' AS Time), 4, N'sit', 42)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 43, CAST(N'00:09:08' AS Time), 2, N'nec,', 43)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (4, 44, CAST(N'00:09:46' AS Time), 6, N'iaculis', 44)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 45, CAST(N'00:06:38' AS Time), 4, N'eros', 45)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (3, 46, CAST(N'00:09:51' AS Time), 4, N'neque', 46)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (5, 47, CAST(N'00:05:41' AS Time), 4, N'mattis', 47)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (7, 48, CAST(N'00:10:00' AS Time), 5, N'Donec', 48)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (7, 49, CAST(N'00:08:40' AS Time), 4, N'lectus', 49)
INSERT [dbo].[RaceMembers] ([race], [member], [score], [running_track], [uniform_color], [disqualification]) VALUES (8, 50, CAST(N'00:06:05' AS Time), 2, N'risus.', 50)
GO
SET IDENTITY_INSERT [dbo].[Races] ON 

INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (1, 400, 1)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (2, 800, 1)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (3, 1000, 1)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (4, 600, 2)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (5, 800, 2)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (6, 1000, 2)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (7, 1000, 3)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (8, 1200, 3)
INSERT [dbo].[Races] ([id], [distance], [competition]) VALUES (9, 1400, 3)
SET IDENTITY_INSERT [dbo].[Races] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name]) VALUES (1, N'Жокей')
INSERT [dbo].[Roles] ([id], [name]) VALUES (2, N'Судья')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Users] ([login], [password], [role]) VALUES (N'jockey1', N'jockey1', 1)
INSERT [dbo].[Users] ([login], [password], [role]) VALUES (N'judge1', N'judge1', 2)
INSERT [dbo].[Users] ([login], [password], [role]) VALUES (N'jockey2', N'jockey2', 1)
INSERT [dbo].[Users] ([login], [password], [role]) VALUES (N'judge2', N'judge2', 2)
INSERT [dbo].[Users] ([login], [password], [role]) VALUES (N'jockey3', N'jockey3', 1)
INSERT [dbo].[Users] ([login], [password], [role]) VALUES (N'judge3', N'judge3', 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Jockeys__7838F27260D9957D]    Script Date: 27.11.2022 19:13:20 ******/
ALTER TABLE [dbo].[Jockeys] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Judges__7838F272E1FF6110]    Script Date: 27.11.2022 19:13:20 ******/
ALTER TABLE [dbo].[Judges] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__7838F272E015155F]    Script Date: 27.11.2022 19:13:20 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD FOREIGN KEY([judge])
REFERENCES [dbo].[Judges] ([id])
GO
ALTER TABLE [dbo].[Horses]  WITH CHECK ADD FOREIGN KEY([breed])
REFERENCES [dbo].[Breeds] ([id])
GO
ALTER TABLE [dbo].[Horses]  WITH CHECK ADD FOREIGN KEY([coach])
REFERENCES [dbo].[Coaches] ([id])
GO
ALTER TABLE [dbo].[Jockeys]  WITH CHECK ADD FOREIGN KEY([login])
REFERENCES [dbo].[Users] ([login])
GO
ALTER TABLE [dbo].[Judges]  WITH CHECK ADD FOREIGN KEY([login])
REFERENCES [dbo].[Users] ([login])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([horse])
REFERENCES [dbo].[Horses] ([id])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([jockey])
REFERENCES [dbo].[Jockeys] ([id])
GO
ALTER TABLE [dbo].[RaceMembers]  WITH CHECK ADD FOREIGN KEY([disqualification])
REFERENCES [dbo].[Disqualifications] ([id])
GO
ALTER TABLE [dbo].[RaceMembers]  WITH CHECK ADD FOREIGN KEY([member])
REFERENCES [dbo].[Members] ([id])
GO
ALTER TABLE [dbo].[RaceMembers]  WITH CHECK ADD FOREIGN KEY([race])
REFERENCES [dbo].[Races] ([id])
GO
ALTER TABLE [dbo].[Races]  WITH CHECK ADD FOREIGN KEY([competition])
REFERENCES [dbo].[Competitions] ([id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([id])
GO
/****** Object:  StoredProcedure [dbo].[Authorizate]    Script Date: 27.11.2022 19:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Authorizate] @login varchar(50), @password varchar(50)
as
select [login], [password], [role] from Users
where [login]=@login and [password]=@password
GO
USE [master]
GO
ALTER DATABASE [EquestrianCompetitions] SET  READ_WRITE 
GO
