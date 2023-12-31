USE [master]
GO
/****** Object:  Database [BaseballData]    Script Date: 2022/10/17 09:29:07 ******/
CREATE DATABASE [BaseballData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Baseball', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Baseball.mdf' , SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Baseball_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Baseball_log.ldf' , SIZE = 524288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BaseballData] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseballData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseballData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseballData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseballData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseballData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseballData] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseballData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseballData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseballData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseballData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseballData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseballData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseballData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseballData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseballData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseballData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseballData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseballData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseballData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseballData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseballData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseballData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseballData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseballData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseballData] SET  MULTI_USER 
GO
ALTER DATABASE [BaseballData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseballData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseballData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseballData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BaseballData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseballData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BaseballData] SET QUERY_STORE = OFF
GO
USE [BaseballData]
GO
/****** Object:  Table [dbo].[halloffame]    Script Date: 2022/10/17 09:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[halloffame](
	[hofID] [varchar](10) NOT NULL,
	[yearID] [int] NOT NULL,
	[votedBy] [varchar](64) NULL,
	[ballots] [int] NULL,
	[needed] [int] NULL,
	[votes] [int] NULL,
	[inducted] [varchar](1) NULL,
	[category] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[hofID] ASC,
	[yearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managers]    Script Date: 2022/10/17 09:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managers](
	[managerID] [varchar](10) NULL,
	[yearID] [int] NOT NULL,
	[teamID] [varchar](3) NOT NULL,
	[lgID] [varchar](2) NULL,
	[inseason] [int] NOT NULL,
	[G] [int] NULL,
	[W] [int] NULL,
	[L] [int] NULL,
	[rank] [int] NULL,
	[plyrMgr] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[yearID] ASC,
	[teamID] ASC,
	[inseason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[players]    Script Date: 2022/10/17 09:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players](
	[lahmanID] [int] NOT NULL,
	[playerID] [varchar](10) NULL,
	[managerID] [varchar](10) NULL,
	[hofID] [varchar](10) NULL,
	[birthYear] [int] NULL,
	[birthMonth] [int] NULL,
	[birthDay] [int] NULL,
	[birthCountry] [varchar](50) NULL,
	[birthState] [varchar](2) NULL,
	[birthCity] [varchar](50) NULL,
	[deathYear] [int] NULL,
	[deathMonth] [int] NULL,
	[deathDay] [int] NULL,
	[deathCountry] [varchar](50) NULL,
	[deathState] [varchar](2) NULL,
	[deathCity] [varchar](50) NULL,
	[nameFirst] [varchar](50) NULL,
	[nameLast] [varchar](50) NULL,
	[nameNote] [varchar](255) NULL,
	[nameGiven] [varchar](255) NULL,
	[nameNick] [varchar](255) NULL,
	[weight] [int] NULL,
	[height] [int] NULL,
	[bats] [varchar](1) NULL,
	[throws] [varchar](1) NULL,
	[debut] [varchar](10) NULL,
	[finalGame] [varchar](10) NULL,
	[college] [varchar](50) NULL,
	[lahman40ID] [varchar](9) NULL,
	[lahman45ID] [varchar](9) NULL,
	[retroID] [varchar](9) NULL,
	[holtzID] [varchar](9) NULL,
	[bbrefID] [varchar](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[lahmanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_players_playerID_nameFirst_nameLast]    Script Date: 2022/10/17 09:29:07 ******/
CREATE NONCLUSTERED INDEX [NCI_players_playerID_nameFirst_nameLast] ON [dbo].[players]
(
	[playerID] ASC,
	[nameFirst] ASC,
	[nameLast] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[halloffame] ADD  DEFAULT (NULL) FOR [votedBy]
GO
ALTER TABLE [dbo].[halloffame] ADD  DEFAULT (NULL) FOR [ballots]
GO
ALTER TABLE [dbo].[halloffame] ADD  DEFAULT (NULL) FOR [needed]
GO
ALTER TABLE [dbo].[halloffame] ADD  DEFAULT (NULL) FOR [votes]
GO
ALTER TABLE [dbo].[halloffame] ADD  DEFAULT (NULL) FOR [inducted]
GO
ALTER TABLE [dbo].[halloffame] ADD  DEFAULT (NULL) FOR [category]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [managerID]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [lgID]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [G]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [W]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [L]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [rank]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (NULL) FOR [plyrMgr]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [playerID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [managerID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [hofID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [birthYear]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [birthMonth]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [birthDay]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [birthCountry]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [birthState]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [birthCity]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [deathYear]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [deathMonth]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [deathDay]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [deathCountry]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [deathState]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [deathCity]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [nameFirst]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [nameLast]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [nameNote]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [nameGiven]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [nameNick]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [weight]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [height]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [bats]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [throws]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [debut]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [finalGame]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [college]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [lahman40ID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [lahman45ID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [retroID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [holtzID]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (NULL) FOR [bbrefID]
GO
USE [master]
GO
ALTER DATABASE [BaseballData] SET  READ_WRITE 
GO
