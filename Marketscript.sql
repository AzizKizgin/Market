USE [master]
GO
/****** Object:  Database [MarketDB]    Script Date: 4.02.2022 15:47:10 ******/
CREATE DATABASE [MarketDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarketDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarketDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarketDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarketDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MarketDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarketDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarketDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarketDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarketDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MarketDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarketDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarketDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarketDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MarketDB] SET  MULTI_USER 
GO
ALTER DATABASE [MarketDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarketDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarketDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarketDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarketDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarketDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarketDB', N'ON'
GO
ALTER DATABASE [MarketDB] SET QUERY_STORE = OFF
GO
USE [MarketDB]
GO
/****** Object:  Table [dbo].[TBLCategory]    Script Date: 4.02.2022 15:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](30) NULL,
 CONSTRAINT [PK_TBLCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLPROPERTY]    Script Date: 4.02.2022 15:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLPROPERTY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](30) NULL,
	[CATEGORY] [int] NULL,
	[PRICE] [decimal](4, 2) NULL,
	[PHOTO] [varchar](250) NULL,
	[DETAIL] [varchar](50) NULL,
 CONSTRAINT [PK_TBLPROPERTY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBLPROPERTY]  WITH CHECK ADD  CONSTRAINT [FK_TBLPROPERTY_TBLCategory] FOREIGN KEY([CATEGORY])
REFERENCES [dbo].[TBLCategory] ([ID])
GO
ALTER TABLE [dbo].[TBLPROPERTY] CHECK CONSTRAINT [FK_TBLPROPERTY_TBLCategory]
GO
USE [master]
GO
ALTER DATABASE [MarketDB] SET  READ_WRITE 
GO
