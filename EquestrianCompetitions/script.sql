USE [master]
GO
/****** Object:  Database [equestrian_competitions]    Script Date: 06.09.2022 20:06:23 ******/
CREATE DATABASE [equestrian_competitions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'equestrian_competitions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\equestrian_competitions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'equestrian_competitions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\equestrian_competitions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [equestrian_competitions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [equestrian_competitions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [equestrian_competitions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [equestrian_competitions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [equestrian_competitions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [equestrian_competitions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [equestrian_competitions] SET ARITHABORT OFF 
GO
ALTER DATABASE [equestrian_competitions] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [equestrian_competitions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [equestrian_competitions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [equestrian_competitions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [equestrian_competitions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [equestrian_competitions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [equestrian_competitions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [equestrian_competitions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [equestrian_competitions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [equestrian_competitions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [equestrian_competitions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [equestrian_competitions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [equestrian_competitions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [equestrian_competitions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [equestrian_competitions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [equestrian_competitions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [equestrian_competitions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [equestrian_competitions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [equestrian_competitions] SET  MULTI_USER 
GO
ALTER DATABASE [equestrian_competitions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [equestrian_competitions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [equestrian_competitions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [equestrian_competitions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [equestrian_competitions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [equestrian_competitions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [equestrian_competitions] SET QUERY_STORE = OFF
GO
USE [equestrian_competitions]
GO
/****** Object:  Table [dbo].[coaches]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coaches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[competitions]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[competitions](
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
/****** Object:  Table [dbo].[horses]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[age] [int] NOT NULL,
	[breed] [varchar](50) NOT NULL,
	[performance_number] [int] NOT NULL,
	[coach] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jockeys]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jockeys](
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
/****** Object:  Table [dbo].[judges]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[judges](
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
/****** Object:  Table [dbo].[members]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[members](
	[race] [int] NOT NULL,
	[jockey] [int] NOT NULL,
	[horse] [int] NOT NULL,
	[running_track] [int] NOT NULL,
	[uniform_color] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[races]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[races](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[distance] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[racing_history]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[racing_history](
	[competition] [int] NOT NULL,
	[race] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 06.09.2022 20:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[competitions]  WITH CHECK ADD FOREIGN KEY([judge])
REFERENCES [dbo].[judges] ([id])
GO
ALTER TABLE [dbo].[horses]  WITH CHECK ADD FOREIGN KEY([coach])
REFERENCES [dbo].[coaches] ([id])
GO
ALTER TABLE [dbo].[jockeys]  WITH CHECK ADD FOREIGN KEY([login])
REFERENCES [dbo].[users] ([login])
GO
ALTER TABLE [dbo].[judges]  WITH CHECK ADD FOREIGN KEY([login])
REFERENCES [dbo].[users] ([login])
GO
ALTER TABLE [dbo].[members]  WITH CHECK ADD FOREIGN KEY([horse])
REFERENCES [dbo].[horses] ([id])
GO
ALTER TABLE [dbo].[members]  WITH CHECK ADD FOREIGN KEY([jockey])
REFERENCES [dbo].[jockeys] ([id])
GO
ALTER TABLE [dbo].[members]  WITH CHECK ADD FOREIGN KEY([race])
REFERENCES [dbo].[races] ([id])
GO
ALTER TABLE [dbo].[racing_history]  WITH CHECK ADD FOREIGN KEY([competition])
REFERENCES [dbo].[competitions] ([id])
GO
ALTER TABLE [dbo].[racing_history]  WITH CHECK ADD FOREIGN KEY([race])
REFERENCES [dbo].[races] ([id])
GO
USE [master]
GO
ALTER DATABASE [equestrian_competitions] SET  READ_WRITE 
GO
