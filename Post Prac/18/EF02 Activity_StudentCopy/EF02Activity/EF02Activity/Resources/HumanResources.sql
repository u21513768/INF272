USE [master]
GO
/****** Object:  Database [HumanResources]    Script Date: 2022/09/25 23:04:35 ******/
CREATE DATABASE [HumanResources]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HumanResources', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HumanResources.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HumanResources_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HumanResources_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HumanResources] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HumanResources].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HumanResources] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HumanResources] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HumanResources] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HumanResources] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HumanResources] SET ARITHABORT OFF 
GO
ALTER DATABASE [HumanResources] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HumanResources] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HumanResources] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HumanResources] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HumanResources] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HumanResources] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HumanResources] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HumanResources] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HumanResources] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HumanResources] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HumanResources] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HumanResources] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HumanResources] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HumanResources] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HumanResources] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HumanResources] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HumanResources] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HumanResources] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HumanResources] SET  MULTI_USER 
GO
ALTER DATABASE [HumanResources] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HumanResources] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HumanResources] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HumanResources] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HumanResources] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HumanResources] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HumanResources] SET QUERY_STORE = OFF
GO
USE [HumanResources]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [int] NOT NULL,
	[country_name] [varchar](40) NULL,
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK__countrie__7E8CD055065EEEB7] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](30) NOT NULL,
	[location_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dependents]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependents](
	[dependent_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[relationship] [varchar](25) NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dependent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [int] NOT NULL,
	[salary] [decimal](8, 2) NOT NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [varchar](35) NULL,
	[min_salary] [decimal](8, 2) NULL,
	[max_salary] [decimal](8, 2) NULL,
 CONSTRAINT [PK__jobs__6E32B6A52657B9CA] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[street_address] [varchar](40) NULL,
	[postal_code] [varchar](12) NULL,
	[city] [varchar](30) NOT NULL,
	[state_province] [varchar](25) NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK__location__771831EABC70BC4D] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 2022/09/25 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[region_id] [int] IDENTITY(1,1) NOT NULL,
	[region_name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (1, N'Andorra', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (2, N'United Arab Emirates', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (3, N'Afghanistan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (4, N'Antigua and Barbuda', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (5, N'Anguilla', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (6, N'Albania', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (7, N'Armenia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (8, N'Angola', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (9, N'Argentina', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (10, N'American Samoa', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (11, N'Austria', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (12, N'Australia', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (13, N'Aruba', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (14, N'Åland Islands', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (15, N'Azerbaijan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (16, N'Bosnia and Herzegovina', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (17, N'Barbados', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (18, N'Bangladesh', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (19, N'Belgium', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (20, N'Burkina Faso', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (21, N'Bulgaria', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (22, N'Bahrain', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (23, N'Burundi', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (24, N'Benin', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (25, N'Saint Barthélemy', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (26, N'Bermuda', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (27, N'Brunei Darussalam', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (28, N'Bolivia (Plurinational State of)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (29, N'Bonaire, Sint Eustatius and Saba', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (30, N'Brazil', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (31, N'Bahamas', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (32, N'Bhutan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (33, N'Bouvet Island', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (34, N'Botswana', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (35, N'Belarus', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (36, N'Belize', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (37, N'Canada', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (38, N'Cocos (Keeling) Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (39, N'Congo, Democratic Republic of the', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (40, N'Central African Republic', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (41, N'Congo', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (42, N'Switzerland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (43, N'Côte d''Ivoire', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (44, N'Cook Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (45, N'Chile', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (46, N'Cameroon', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (47, N'China', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (48, N'Colombia', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (49, N'Costa Rica', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (50, N'Cuba', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (51, N'Cabo Verde', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (52, N'Curaçao', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (53, N'Christmas Island', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (54, N'Cyprus', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (55, N'Czechia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (56, N'Germany', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (57, N'Djibouti', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (58, N'Denmark', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (59, N'Dominica', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (60, N'Dominican Republic', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (61, N'Algeria', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (62, N'Ecuador', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (63, N'Estonia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (64, N'Egypt', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (65, N'Western Sahara', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (66, N'Eritrea', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (67, N'Spain', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (68, N'Ethiopia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (69, N'Finland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (70, N'Fiji', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (71, N'Falkland Islands (Malvinas)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (72, N'Micronesia (Federated States of)', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (73, N'Faroe Islands', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (74, N'France', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (75, N'Gabon', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (76, N'Grenada', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (77, N'Georgia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (78, N'French Guiana', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (79, N'Guernsey', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (80, N'Ghana', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (81, N'Gibraltar', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (82, N'Greenland', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (83, N'Gambia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (84, N'Guinea', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (85, N'Guadeloupe', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (86, N'Equatorial Guinea', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (87, N'Greece', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (88, N'Guatemala', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (89, N'Guam', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (90, N'Guinea-Bissau', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (91, N'Guyana', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (92, N'HongKong', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (93, N'Heard Island and McDonald Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (94, N'Honduras', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (95, N'Croatia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (96, N'Haiti', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (97, N'Hungary', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (98, N'Indonesia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (99, N'Ireland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (100, N'Israel', 4)
GO
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (101, N'Isle of Man', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (102, N'India', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (103, N'British Indian Ocean Territory', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (104, N'Iraq', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (105, N'Iran (Islamic Republic of)', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (106, N'Iceland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (107, N'Italy', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (108, N'Jersey', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (109, N'Jamaica', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (110, N'Jordan', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (111, N'Japan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (112, N'Kenya', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (113, N'Kyrgyzstan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (114, N'Cambodia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (115, N'Kiribati', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (116, N'Comoros', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (117, N'Saint Kitts and Nevis', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (118, N'Korea (Democratic People''s Republic of)', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (119, N'Korea, Republic of', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (120, N'Kuwait', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (121, N'Cayman Islands', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (122, N'Kazakhstan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (123, N'Lao People''s Democratic Republic', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (124, N'Lebanon', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (125, N'Saint Lucia', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (126, N'Liechtenstein', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (127, N'Sri Lanka', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (128, N'Liberia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (129, N'Lesotho', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (130, N'Lithuania', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (131, N'Luxembourg', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (132, N'Latvia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (133, N'Libya', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (134, N'Morocco', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (135, N'Monaco', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (136, N'Moldova, Republic of', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (137, N'Montenegro', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (138, N'Saint Martin (French part)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (139, N'Madagascar', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (140, N'Marshall Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (141, N'North Macedonia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (142, N'Mali', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (143, N'Myanmar', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (144, N'Mongolia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (145, N'Macao', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (146, N'Northern Mariana Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (147, N'Martinique', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (148, N'Mauritania', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (149, N'Montserrat', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (150, N'Malta', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (151, N'Mauritius', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (152, N'Maldives', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (153, N'Malawi', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (154, N'Mexico', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (155, N'Malaysia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (156, N'Mozambique', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (157, N'Namibia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (158, N'New Caledonia', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (159, N'Niger', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (160, N'Norfolk Island', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (161, N'Nigeria', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (162, N'Nicaragua', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (163, N'Netherlands', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (164, N'Norway', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (165, N'Nepal', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (166, N'Nauru', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (167, N'Niue', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (168, N'New Zealand', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (169, N'Oman', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (170, N'Panama', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (171, N'Peru', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (172, N'French Polynesia', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (173, N'Papua New Guinea', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (174, N'Philippines', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (175, N'Pakistan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (176, N'Poland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (177, N'Saint Pierre and Miquelon', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (178, N'Pitcairn', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (179, N'Puerto Rico', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (180, N'Palestine, State of', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (181, N'Portugal', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (182, N'Palau', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (183, N'Paraguay', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (184, N'Qatar', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (185, N'Réunion', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (186, N'Romania', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (187, N'Serbia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (189, N'Russian Federation', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (190, N'Rwanda', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (191, N'Saudi Arabia', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (192, N'Solomon Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (193, N'Seychelles', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (194, N'Sudan', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (195, N'Sweden', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (196, N'Singapore', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (197, N'Slovenia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (198, N'Svalbard and Jan Mayen', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (199, N'Slovakia', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (200, N'Sierra Leone', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (201, N'San Marino', 1)
GO
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (202, N'Senegal', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (203, N'Somalia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (204, N'Suriname', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (205, N'South Sudan', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (206, N'Sao Tome and Principe', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (207, N'El Salvador', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (208, N'Sint Maarten (Dutch part)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (209, N'Syrian Arab Republic', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (210, N'Eswatini', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (211, N'Turks and Caicos Islands', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (212, N'Chad', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (213, N'French Southern Territories', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (214, N'Togo', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (215, N'Thailand', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (216, N'Tajikistan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (217, N'Tokelau', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (218, N'Timor-Leste', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (219, N'Turkmenistan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (220, N'Tunisia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (221, N'Tonga', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (222, N'Turkey', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (223, N'Trinidad and Tobago', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (224, N'Tuvalu', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (225, N'Taiwan, Province of China', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (226, N'Tanzania, United Republic of', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (227, N'Ukraine', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (228, N'Uganda', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (229, N'United Kingdom', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (230, N'United States Minor Outlying Islands', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (231, N'United States of America', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (232, N'Uruguay', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (233, N'Uzbekistan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (234, N'Holy See', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (235, N'Saint Vincent and the Grenadines', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (236, N'Venezuela (Bolivarian Republic of)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (237, N'Virgin Islands (British)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (238, N'Virgin Islands (U.S.)', 7)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (239, N'Viet Nam', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (240, N'Vanuatu', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (241, N'Wallis and Futuna', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (242, N'Samoa', 6)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (243, N'Yemen', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (244, N'Mayotte', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (245, N'South Africa', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (246, N'Zambia', 5)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (247, N'Zimbabwe', 5)
GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (1, N'Administration', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (2, N'Marketing', 1800)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (3, N'Purchasing', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (4, N'Human Resources', 2400)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (5, N'Shipping', 1500)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (6, N'IT', 1400)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (7, N'Public Relations', 2700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (8, N'Sales', 2500)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (9, N'Executive', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (10, N'Finance', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (11, N'Accounting', 1700)
SET IDENTITY_INSERT [dbo].[departments] OFF
GO
SET IDENTITY_INSERT [dbo].[dependents] ON 

INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (1, N'Penelope', N'Gietz', N'Child', 206)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (2, N'Nick', N'Higgins', N'Child', 205)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (3, N'Ed', N'Whalen', N'Child', 200)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (4, N'Jennifer', N'King', N'Child', 100)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (5, N'Johnny', N'Kochhar', N'Child', 101)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (6, N'Bette', N'De Haan', N'Child', 102)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (7, N'Grace', N'Faviet', N'Child', 109)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (8, N'Matthew', N'Chen', N'Child', 110)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (9, N'Joe', N'Sciarra', N'Child', 111)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (10, N'Christian', N'Urman', N'Child', 112)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (11, N'Zero', N'Popp', N'Child', 113)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (12, N'Karl', N'Greenberg', N'Child', 108)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (13, N'Uma', N'Mavris', N'Child', 203)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (14, N'Vivien', N'Hunold', N'Child', 103)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (15, N'Cuba', N'Ernst', N'Child', 104)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (16, N'Fred', N'Austin', N'Child', 105)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (17, N'Helen', N'Pataballa', N'Child', 106)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (18, N'Dan', N'Lorentz', N'Child', 107)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (19, N'Bob', N'Hartstein', N'Child', 201)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (20, N'Lucille', N'Fay', N'Child', 202)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (21, N'Kirsten', N'Baer', N'Child', 204)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (22, N'Elvis', N'Khoo', N'Child', 115)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (23, N'Sandra', N'Baida', N'Child', 116)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (24, N'Cameron', N'Tobias', N'Child', 117)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (25, N'Kevin', N'Himuro', N'Child', 118)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (26, N'Rip', N'Colmenares', N'Child', 119)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (27, N'Julia', N'Raphaely', N'Child', 114)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (28, N'Woody', N'Russell', N'Child', 145)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (29, N'Alec', N'Partners', N'Child', 146)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (30, N'Sandra', N'Taylor', N'Child', 176)
SET IDENTITY_INSERT [dbo].[dependents] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (100, N'Steven', N'King', N'steven.king@sqltutorial.org', N'515.123.4567', CAST(N'1987-06-17' AS Date), 4, CAST(40000.00 AS Decimal(8, 2)), NULL, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (101, N'Neena', N'Kochhar', N'neena.kochhar@sqltutorial.org', N'515.123.4568', CAST(N'1989-09-21' AS Date), 5, CAST(30000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (102, N'Lex', N'De Haan', N'lex.de haan@sqltutorial.org', N'515.123.4569', CAST(N'1993-01-13' AS Date), 5, CAST(30000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (103, N'Alexander', N'Hunold', N'alexander.hunold@sqltutorial.org', N'590.423.4567', CAST(N'1990-01-03' AS Date), 9, CAST(10000.00 AS Decimal(8, 2)), 102, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (104, N'Bruce', N'Ernst', N'bruce.ernst@sqltutorial.org', N'590.423.4568', CAST(N'1991-05-21' AS Date), 9, CAST(6000.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (105, N'David', N'Austin', N'david.austin@sqltutorial.org', N'590.423.4569', CAST(N'1997-06-25' AS Date), 9, CAST(4800.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (106, N'Valli', N'Pataballa', N'valli.pataballa@sqltutorial.org', N'590.423.4560', CAST(N'1998-02-05' AS Date), 9, CAST(4800.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (107, N'Diana', N'Lorentz', N'diana.lorentz@sqltutorial.org', N'590.423.5567', CAST(N'1999-02-07' AS Date), 9, CAST(4200.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (108, N'Nancy', N'Greenberg', N'nancy.greenberg@sqltutorial.org', N'515.124.4569', CAST(N'1994-08-17' AS Date), 7, CAST(12000.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (109, N'Daniel', N'Faviet', N'daniel.faviet@sqltutorial.org', N'515.124.4169', CAST(N'1994-08-16' AS Date), 6, CAST(9000.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (110, N'John', N'Chen', N'john.chen@sqltutorial.org', N'515.124.4269', CAST(N'1997-09-28' AS Date), 6, CAST(8200.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (111, N'Ismael', N'Sciarra', N'ismael.sciarra@sqltutorial.org', N'515.124.4369', CAST(N'1997-09-30' AS Date), 6, CAST(7700.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (112, N'Jose Manuel', N'Urman', N'jose manuel.urman@sqltutorial.org', N'515.124.4469', CAST(N'1998-03-07' AS Date), 6, CAST(7800.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (113, N'Luis', N'Popp', N'luis.popp@sqltutorial.org', N'515.124.4567', CAST(N'1999-12-07' AS Date), 6, CAST(6900.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (114, N'Den', N'Raphaely', N'den.raphaely@sqltutorial.org', N'515.127.4561', CAST(N'1994-12-07' AS Date), 14, CAST(15000.00 AS Decimal(8, 2)), 100, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (115, N'Alexander', N'Khoo', N'alexander.khoo@sqltutorial.org', N'515.127.4562', CAST(N'1995-05-18' AS Date), 13, CAST(3100.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (116, N'Shelli', N'Baida', N'shelli.baida@sqltutorial.org', N'515.127.4563', CAST(N'1997-12-24' AS Date), 13, CAST(2900.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (117, N'Sigal', N'Tobias', N'sigal.tobias@sqltutorial.org', N'515.127.4564', CAST(N'1997-07-24' AS Date), 13, CAST(2800.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (118, N'Guy', N'Himuro', N'guy.himuro@sqltutorial.org', N'515.127.4565', CAST(N'1998-11-15' AS Date), 13, CAST(2600.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (119, N'Karen', N'Colmenares', N'karen.colmenares@sqltutorial.org', N'515.127.4566', CAST(N'1999-08-10' AS Date), 13, CAST(2500.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (120, N'Matthew', N'Weiss', N'matthew.weiss@sqltutorial.org', N'650.123.1234', CAST(N'1996-07-18' AS Date), 19, CAST(8500.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (121, N'Adam', N'Fripp', N'adam.fripp@sqltutorial.org', N'650.123.2234', CAST(N'1997-04-10' AS Date), 19, CAST(8200.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (122, N'Payam', N'Kaufling', N'payam.kaufling@sqltutorial.org', N'650.123.3234', CAST(N'1995-05-01' AS Date), 19, CAST(7900.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (123, N'Shanta', N'Vollman', N'shanta.vollman@sqltutorial.org', N'650.123.4234', CAST(N'1997-10-10' AS Date), 19, CAST(8500.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (126, N'Irene', N'Mikkilineni', N'irene.mikkilineni@sqltutorial.org', N'650.124.1224', CAST(N'1998-09-28' AS Date), 18, CAST(2700.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (145, N'John', N'Russell', N'john.russell@sqltutorial.org', NULL, CAST(N'1996-10-01' AS Date), 15, CAST(20000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (146, N'Karen', N'Partners', N'karen.partners@sqltutorial.org', NULL, CAST(N'1997-01-05' AS Date), 15, CAST(13500.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (176, N'Jonathon', N'Taylor', N'jonathon.taylor@sqltutorial.org', NULL, CAST(N'1998-03-24' AS Date), 16, CAST(8600.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (177, N'Jack', N'Livingston', N'jack.livingston@sqltutorial.org', NULL, CAST(N'1998-04-23' AS Date), 16, CAST(8400.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (178, N'Kimberely', N'Grant', N'kimberely.grant@sqltutorial.org', NULL, CAST(N'1999-05-24' AS Date), 16, CAST(7000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (179, N'Charles', N'Johnson', N'charles.johnson@sqltutorial.org', NULL, CAST(N'2000-01-04' AS Date), 16, CAST(6200.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (192, N'Sarah', N'Bell', N'sarah.bell@sqltutorial.org', N'650.501.1876', CAST(N'1996-02-04' AS Date), 17, CAST(4000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (193, N'Britney', N'Everett', N'britney.everett@sqltutorial.org', N'650.501.2876', CAST(N'1997-03-03' AS Date), 17, CAST(3900.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (200, N'Jennifer', N'Whalen', N'jennifer.whalen@sqltutorial.org', N'515.123.4444', CAST(N'1987-09-17' AS Date), 3, CAST(4400.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (201, N'Michael', N'Hartstein', N'michael.hartstein@sqltutorial.org', N'515.123.5555', CAST(N'1996-02-17' AS Date), 10, CAST(13000.00 AS Decimal(8, 2)), 100, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (202, N'Pat', N'Fay', N'pat.fay@sqltutorial.org', N'603.123.6666', CAST(N'1997-08-17' AS Date), 11, CAST(6000.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (203, N'Susan', N'Mavris', N'susan.mavris@sqltutorial.org', N'515.123.7777', CAST(N'1994-06-07' AS Date), 8, CAST(6500.00 AS Decimal(8, 2)), 101, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (204, N'Hermann', N'Baer', N'hermann.baer@sqltutorial.org', N'515.123.8888', CAST(N'1994-06-07' AS Date), 12, CAST(10000.00 AS Decimal(8, 2)), 101, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (205, N'Shelley', N'Higgins', N'shelley.higgins@sqltutorial.org', N'515.123.8080', CAST(N'1994-06-07' AS Date), 2, CAST(12000.00 AS Decimal(8, 2)), 101, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (206, N'William', N'Gietz', N'william.gietz@sqltutorial.org', N'515.123.8181', CAST(N'1994-06-07' AS Date), 1, CAST(8300.00 AS Decimal(8, 2)), 205, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (207, N'Hubert', N'Christophersen', N'hchristophersendl@umn.edu', N'106.858.9927', CAST(N'2018-12-10' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (208, N'Armand', N'Amorine', N'aamorinepm@creative.org', N'404.632.7093', CAST(N'2018-12-12' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 101, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (209, N'Arlyne', N'Thurman', N'athurman72@cdc.gov', N'446.143.5083', CAST(N'2018-12-14' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (210, N'Aimil', N'Pritchett', N'apritchettbl@elpais.com', N'223.266.7558', CAST(N'2018-12-15' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (211, N'Mireielle', N'Seatter', N'mseatterm0@joomla.org', N'494.873.1162', CAST(N'2018-12-25' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (212, N'Diane', N'Marchington', N'dmarchington33@refer.com', N'371.262.6593', CAST(N'2018-12-26' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 103, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (213, N'Ardelia', N'Rennles', N'arennlesix@instagram.com', N'164.634.4335', CAST(N'2019-01-05' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (214, N'Rosmunda', N'Sapey', N'rsapeyda@opera.com', N'511.697.7254', CAST(N'2019-01-07' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (215, N'Lorianne', N'Dury', N'ldury73@europa.eu', N'849.485.0023', CAST(N'2019-01-13' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (216, N'Janeva', N'MacKey', N'jmackeycc@bloglines.com', N'721.826.7656', CAST(N'2019-01-20' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 114, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (219, N'Corney', N'Kesteven', N'ckestevenqb@gnu.org', N'579.869.7422', CAST(N'2019-02-01' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (220, N'Maddie', N'Youell', N'myouellcf@angelfire.com', N'966.413.2927', CAST(N'2019-03-01' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (221, N'Sebastian', N'Strothers', N'sstrothersis@hhs.gov', N'113.846.4398', CAST(N'2019-03-11' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (223, N'Cherish', N'Dawnay', N'cdawnaymr@fc2.com', N'133.380.1587', CAST(N'2019-03-24' AS Date), 9, CAST(7500.00 AS Decimal(8, 2)), 123, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (224, N'Pammie', N'Gillson', N'pgillson66@reddit.com', N'591.203.0687', CAST(N'2019-04-06' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 145, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (225, N'Lanita', N'Kirkland', N'lkirkland3p@psu.edu', N'460.634.8756', CAST(N'2019-04-08' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (226, N'Keen', N'Blackmore', N'kblackmorep0@reuters.com', N'861.373.4367', CAST(N'2019-04-22' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 100, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (227, N'Maxie', N'Ferrieroi', N'mferrieroiit@quantcast.com', N'124.750.4319', CAST(N'2019-04-26' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 102, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (228, N'Lonnard', N'Chatteris', N'lchatteris6j@usatoday.com', N'776.421.2276', CAST(N'2019-04-27' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (229, N'Kinsley', N'Linskey', N'klinskeyj6@zimbio.com', N'953.905.9738', CAST(N'2019-05-08' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (230, N'Ciel', N'Shanklin', N'cshanklinjg@xinhuanet.com', N'301.508.6126', CAST(N'2019-05-10' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 103, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (231, N'Daven', N'Niezen', N'dniezenna@friendfeed.com', N'208.293.1463', CAST(N'2019-05-14' AS Date), 16, CAST(6000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (232, N'Cornie', N'Wasselin', N'cwasselinrq@webnode.com', N'604.337.3854', CAST(N'2019-05-22' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (234, N'Eward', N'Tejero', N'etejerop5@redcross.org', N'964.995.7685', CAST(N'2019-05-27' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 101, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (235, N'Anne', N'Hudspith', N'bhudspithmm@arizona.edu', N'553.564.1265', CAST(N'2019-06-01' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 101, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (236, N'Clara', N'Cansdell', N'ccansdelli7@163.com', N'408.569.0369', CAST(N'2019-06-13' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 145, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (237, N'Nicky', N'Titmarsh', N'ntitmarshcm@delicious.com', N'705.822.4009', CAST(N'2019-06-13' AS Date), 18, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (238, N'Karrie', N'Union', N'kunionjs@whitehouse.gov', N'154.831.8045', CAST(N'2019-06-27' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (239, N'Abbott', N'Blewett', N'ablewettkl@deviantart.com', N'365.646.3838', CAST(N'2019-08-27' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (240, N'Clair', N'Pouton', N'cpouton6d@flickr.com', N'694.761.7671', CAST(N'2019-08-27' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (241, N'Carlos', N'McGiveen', N'cmcgiveen2y@survey.com', N'686.548.8915', CAST(N'2019-09-02' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 102, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (242, N'Ealasaid', N'Elnor', N'eelnorn0@state.tx.us', N'258.211.0607', CAST(N'2019-09-09' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 103, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (243, N'Marcia', N'Langstone', N'mlangstoneo0@home.pl', N'220.489.5065', CAST(N'2019-09-21' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (244, N'Padgett', N'Vigours', N'pvigoursmt@live.com', N'950.693.0074', CAST(N'2019-09-25' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 101, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (245, N'Logan', N'Vassel', N'lvasseloa@linkedin.com', N'999.785.2036', CAST(N'2019-09-29' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (246, N'Coriss', N'Bernardy', N'cbernardy5c@jimdo.com', N'826.562.3315', CAST(N'2019-10-06' AS Date), 9, CAST(7500.00 AS Decimal(8, 2)), 123, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (249, N'Kristen', N'Wellbeloved', N'kwellbeloved3b@blogs.com', N'222.982.0322', CAST(N'2019-11-09' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (250, N'Cointon', N'Habbijam', N'chabbijamj@guardian.co.uk', N'287.472.7509', CAST(N'2019-11-11' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (252, N'Milty', N'Treadwell', N'mtreadwellm5@geocities.jp', N'108.693.0600', CAST(N'2019-11-15' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (253, N'Bonni', N'Ville', N'bvillekr@google.de', N'882.926.3131', CAST(N'2019-12-11' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (254, N'Marco', N'Becken', N'mbeckenga@hao123.com', N'543.558.9054', CAST(N'2019-12-14' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (255, N'Tansy', N'Jacques', N'tjacquesmu@cnet.com', N'583.300.5730', CAST(N'2020-01-01' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (256, N'Dorry', N'Rodenborch', N'drodenborchpw@cnn.com', N'382.459.8270', CAST(N'2020-02-13' AS Date), 13, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (257, N'Rhianna', N'Kyberd', N'rkyberdk9@si.edu', N'312.710.3563', CAST(N'2020-02-27' AS Date), 16, CAST(6000.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (259, N'Hazlett', N'Binns', N'hbinnsid@geocities.jp', N'513.358.7655', CAST(N'2020-03-22' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 103, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (261, N'Neil', N'Garfield', N'ngarfieldcp@usgs.gov', N'503.811.6034', CAST(N'2020-04-07' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (262, N'Abraham', N'Gleader', N'agleaderjv@house.gov', N'846.272.3075', CAST(N'2020-04-17' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 145, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (263, N'Inglis', N'Goodayle', N'igoodaylekg@msu.edu', N'533.707.9984', CAST(N'2020-05-01' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 145, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (265, N'Man', N'Cowmeadow', N'mcowmeadowlq@recht24.de', N'536.322.4976', CAST(N'2020-05-30' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 101, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (266, N'Tamiko', N'Highman', N'thighmaneu@nba.com', N'885.425.6601', CAST(N'2020-06-03' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 120, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (267, N'Boyce', N'Musico', N'bmusicoct@apple.com', N'807.504.8269', CAST(N'2020-06-06' AS Date), 14, CAST(9500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (269, N'Winifield', N'Serraillier', N'wserraillierey@hatena.ne.jp', N'551.978.0084', CAST(N'2020-07-04' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (270, N'Briana', N'Nare', N'bnarehp@psu.edu', N'113.335.4453', CAST(N'2020-07-28' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (271, N'Katalin', N'Halloway', N'khallowayl3@cbslocal.com', N'995.663.4275', CAST(N'2020-08-06' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (272, N'Sela', N'Jaher', N'sjaher6h@ed.gov', N'548.372.6423', CAST(N'2020-08-07' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (274, N'Tessy', N'Pieter', N'tpieter74@printfriendly.com', N'876.862.4703', CAST(N'2020-08-16' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (275, N'Oliy', N'Lievesley', N'olievesleypd@nba.com', N'394.848.5526', CAST(N'2020-09-29' AS Date), 9, CAST(7500.00 AS Decimal(8, 2)), 123, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (276, N'Bekki', N'Metts', N'bmetts81@is.gd', N'738.391.2576', CAST(N'2020-10-05' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 103, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (278, N'Cheston', N'Saterweyte', N'csaterweytemp@today.com', N'781.818.3387', CAST(N'2020-11-20' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 101, 7)
GO
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (280, N'Errol', N'Trineman', N'etrinemannx@china.com.cn', N'390.377.6679', CAST(N'2020-12-30' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (281, N'Jermaine', N'Antunez', N'jantunezie@ifeng.com', N'374.860.1468', CAST(N'2021-01-21' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (282, N'Ronni', N'De Simone', N'rdesimonepa@china.com.cn', N'882.843.7031', CAST(N'2021-02-26' AS Date), 12, CAST(4500.00 AS Decimal(8, 2)), 123, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (285, N'Pavel', N'Ughi', N'pughi5i@twitpic.com', N'734.576.9726', CAST(N'2021-03-12' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 145, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (286, N'Becky', N'Bechley', N'bbechleym4@chronology.com', N'834.623.0992', CAST(N'2021-03-29' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 101, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (287, N'Wynn', N'Bagot', N'wbagot7q@yale.edu', N'566.220.8641', CAST(N'2021-04-03' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (288, N'Roseline', N'Crossfield', N'rcrossfieldop@delicious.com', N'242.832.4860', CAST(N'2021-04-05' AS Date), 9, CAST(7500.00 AS Decimal(8, 2)), 120, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (290, N'Rafaelita', N'Younghusband', N'ryounghusbandc1@examp.com', N'617.977.5347', CAST(N'2021-04-12' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (291, N'Sheelagh', N'Brittoner', N'sbrittonerat@blogger.com', N'204.160.3789', CAST(N'2021-05-04' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (292, N'Dorrie', N'Armin', N'darminhk@amazonaws.com', N'734.360.3003', CAST(N'2021-05-05' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (293, N'Zebulon', N'Dando', N'zdando6w@unesco.org', N'111.560.8536', CAST(N'2021-05-25' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (294, N'Tammie', N'Le Marchant', N'tlemarchantht@nifty.com', N'943.139.3462', CAST(N'2021-05-26' AS Date), 12, CAST(4500.00 AS Decimal(8, 2)), 123, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (296, N'Sydney', N'Steptow', N'ssteptow62@ocn.ne.jp', N'625.109.0367', CAST(N'2021-06-28' AS Date), 9, CAST(7500.00 AS Decimal(8, 2)), 123, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (297, N'Nerissa', N'Samsonsen', N'nsamsonsen32@wix.com', N'855.246.8897', CAST(N'2021-07-01' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (298, N'Phillipe', N'Hendrick', N'phendrick34@tinyurl.com', N'225.139.0844', CAST(N'2021-07-08' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (299, N'Elga', N'Eadmeads', N'eeadmeadshj@xrea.com', N'680.882.6908', CAST(N'2021-07-25' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 102, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (300, N'Ricard', N'Atcherley', N'ratcherleyqq@dot.gov', N'401.431.5204', CAST(N'2021-07-29' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (301, N'Melessa', N'Welchman', N'mwelchman7r@qq.com', N'542.189.4112', CAST(N'2021-08-03' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (302, N'Kile', N'Beevis', N'kbeevislt@friendfeed.com', N'324.671.0450', CAST(N'2021-08-06' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (303, N'Wilone', N'Grieve', N'wgrievecz@who.int', N'218.199.6777', CAST(N'2021-08-18' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (304, N'Ollie', N'Brompton', N'obromptonqp@altervista.org', N'910.223.8338', CAST(N'2021-08-26' AS Date), 13, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (306, N'Quincy', N'Bagworth', N'qbagworthlg@kickstarter.com', N'761.653.0774', CAST(N'2021-09-02' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (307, N'Dari', N'Harrell', N'dharrelldg@disqus.com', N'962.778.4329', CAST(N'2021-09-22' AS Date), 19, CAST(6000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (308, N'Roderic', N'Ouldcott', N'rouldcotto3@columbia.edu', N'368.282.0965', CAST(N'2021-10-18' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (310, N'Pietrek', N'Stickells', N'pstickellsft@mayoclinic.com', N'770.962.7695', CAST(N'2021-10-26' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 120, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (311, N'Prent', N'Skep', N'pskepnv@java.com', N'743.340.1705', CAST(N'2021-10-28' AS Date), 17, CAST(3000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (312, N'Phillipe', N'Risborough', N'prisborough9d@time.com', N'329.732.8851', CAST(N'2021-11-13' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 101, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (313, N'Vivian', N'Guillou', N'vguillou5g@histats.com', N'331.586.6847', CAST(N'2021-11-24' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (314, N'Mellisent', N'Karus', N'mkarus9x@freewebs.com', N'975.205.9033', CAST(N'2021-12-04' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 100, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (315, N'Thibaud', N'McCloid', N'tmccloidb1@privacy.gov.au', N'953.594.4845', CAST(N'2021-12-07' AS Date), 17, CAST(3000.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (316, N'Fayth', N'Leishman', N'fleishmannl@tripadvisor.com', N'237.184.3559', CAST(N'2021-12-09' AS Date), 3, CAST(3000.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (317, N'Katusha', N'Goroni', N'kgoroni8t@wordpress.org', N'796.314.6762', CAST(N'2021-12-15' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (318, N'Tedman', N'Le Hucquet', N'tlehucquetfx@yellowpages.com', N'683.497.9978', CAST(N'2021-12-20' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (319, N'Hubert', N'Lloyd', N'hlloyd3y@ftc.gov', N'254.907.8052', CAST(N'2021-12-21' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (320, N'Jacquie', N'Keaveny', N'jkeavenynb@hc360.com', N'321.537.0213', CAST(N'2021-12-23' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 103, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (321, N'Mitch', N'Rafferty', N'mrafferty4i@studiopress.com', N'559.600.6791', CAST(N'2021-12-25' AS Date), 7, CAST(8200.00 AS Decimal(8, 2)), 120, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (322, N'Karel', N'Scanes', N'kscanesoc@google.co.jp', N'432.605.9707', CAST(N'2022-01-06' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 102, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (323, N'Marget', N'Cadwallader', N'mcadwalladerci@sfgate.com', N'531.642.8693', CAST(N'2022-01-17' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (324, N'Cesaro', N'Dessaur', N'cdessaurhq@usnews.com', N'297.737.4873', CAST(N'2022-01-28' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (327, N'Galina', N'Josefsen', N'gjosefsenrg@qq.com', N'632.523.5709', CAST(N'2022-02-24' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (329, N'Janine', N'Matitiaho', N'jmatitiahoip@webmd.com', N'274.240.3469', CAST(N'2022-03-30' AS Date), 19, CAST(6000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (330, N'Noelle', N'Lansdale', N'nlansdalee2@paginegialle.it', N'192.907.6209', CAST(N'2022-04-14' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 120, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (331, N'Joyce', N'Fraschini', N'jfraschini6g@shinystat.com', N'212.647.1043', CAST(N'2022-04-30' AS Date), 18, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (333, N'Jarrett', N'Downham', N'jdownhamlh@paypal.com', N'488.661.0696', CAST(N'2022-05-15' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (334, N'Werner', N'Pithcock', N'wpithcock35@telegraph.co.uk', N'591.128.0804', CAST(N'2022-05-24' AS Date), 2, CAST(8200.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (336, N'Sawyer', N'Kissell', N'skissellq7@psu.edu', N'275.607.9444', CAST(N'2022-05-31' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 100, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (337, N'Georgeanne', N'Caldecott', N'gcaldecottnq@webster.com', N'951.257.6873', CAST(N'2022-06-13' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 100, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (339, N'Gigi', N'Dubble', N'gdubblegw@netvibes.com', N'956.113.0967', CAST(N'2022-06-22' AS Date), 1, CAST(4200.00 AS Decimal(8, 2)), 101, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (341, N'Merla', N'Barles', N'mbarlesnn@squarespace.com', N'586.554.1220', CAST(N'2022-07-14' AS Date), 11, CAST(4000.00 AS Decimal(8, 2)), 114, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (343, N'Manon', N'Kolin', N'mkolin12@rediff.com', N'563.731.9978', CAST(N'2022-08-01' AS Date), 10, CAST(9000.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (344, N'Babita', N'Ludye', N'bludyeew@g.co', N'111.528.7855', CAST(N'2022-08-14' AS Date), 8, CAST(4000.00 AS Decimal(8, 2)), 103, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (346, N'Sabrina', N'Cheeke', N'scheekee1@weather.com', N'779.208.9390', CAST(N'2022-09-03' AS Date), 5, CAST(25000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (348, N'Audrey', N'Roon', N'aroonol@studiopress.com', N'680.782.2837', CAST(N'2022-09-18' AS Date), 6, CAST(4200.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (349, N'Annissa', N'Dowsing', N'adowsing8x@reverb.com', N'420.208.3710', CAST(N'2019-01-20' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (350, N'Franky', N'Kairns', N'fkairns3s@plala.or.jp', N'389.330.7432', CAST(N'2019-01-31' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (351, N'Kareem', N'Atwood', N'katwood6u@yahoo.co.jp', N'908.710.8803', CAST(N'2019-03-18' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (352, N'Katalin', N'Chell', N'kchell1c@miitbeian.gov.cn', N'972.440.6727', CAST(N'2019-05-25' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (353, N'Chanda', N'McConigal', N'cmcconigalk5@issuu.com', N'776.915.4123', CAST(N'2019-10-08' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (354, N'Norton', N'Olechnowicz', N'nolechnowiczjh@indiego.com', N'135.225.5634', CAST(N'2019-10-23' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (355, N'Becki', N'Lecount', N'blecount3q@timesonline.co.uk', N'672.899.0675', CAST(N'2019-11-14' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (356, N'Molly', N'Kayes', N'mkayesdb@lulu.com', N'519.109.2452', CAST(N'2020-03-03' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (357, N'Cari', N'Spaducci', N'cspaduccif5@nba.com', N'202.308.6366', CAST(N'2020-03-29' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (358, N'Harlan', N'Sillett', N'hsillettge@live.com', N'792.470.8036', CAST(N'2020-05-29' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (359, N'Amandi', N'Baxter', N'abaxterml@pinterest.com', N'548.924.1962', CAST(N'2020-06-27' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (360, N'Rosamund', N'Paullin', N'rpaullinlx@hud.gov', N'744.530.5218', CAST(N'2020-08-14' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (361, N'Barris', N'Newby', N'bnewbyl7@usatoday.com', N'543.869.3346', CAST(N'2020-11-14' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (362, N'Doretta', N'Ambler', N'damblerej@jigsy.com', N'302.355.3697', CAST(N'2020-12-17' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (363, N'Witty', N'Fullard', N'wfullardrl@ebay.com', N'545.249.1599', CAST(N'2021-03-04' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (364, N'Farlie', N'East', N'feastlc@hatena.ne.jp', N'260.145.5626', CAST(N'2021-03-11' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (365, N'Lauryn', N'Biasini', N'lbiasini2n@amazon.de', N'646.231.8514', CAST(N'2021-04-10' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (366, N'Lura', N'Speakman', N'lspeakmanok@unesco.org', N'862.296.2115', CAST(N'2021-06-21' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (367, N'Howie', N'Bulford', N'hbulfordme@blinklist.com', N'749.255.7174', CAST(N'2021-08-31' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (368, N'Angus', N'Bletsoe', N'abletsoen@google.es', N'317.613.6615', CAST(N'2021-10-19' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (369, N'Ibby', N'MacSween', N'imacsween40@virginia.edu', N'199.505.0560', CAST(N'2022-02-01' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (370, N'Stefanie', N'Elloit', N'selloitcw@cargocollect.com', N'520.821.7112', CAST(N'2022-02-02' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (371, N'Braden', N'Vankov', N'bvankovne@prnewswire.com', N'665.361.2248', CAST(N'2022-03-17' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (372, N'Sarita', N'Benzies', N'sbenziesa6@sakura.ne.jp', N'408.498.5595', CAST(N'2022-05-08' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (373, N'Benyamin', N'Dangerfield', N'bdangerfieldq5@mozilla.org', N'254.155.4216', CAST(N'2022-05-29' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (374, N'Ariel', N'Treneer', N'atreneercu@liveinternet.ru', N'505.721.3157', CAST(N'2022-06-19' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (375, N'Roch', N'Wastall', N'rwastallai@japanpost.jp', N'576.733.0246', CAST(N'2022-07-09' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (376, N'Isidore', N'Sammons', N'isammonsch@newsvine.com', N'301.372.7123', CAST(N'2022-07-15' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (377, N'Lambert', N'Garthland', N'lgarthlandpx@who.int', N'552.218.7282', CAST(N'2022-08-27' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (378, N'Alwyn', N'Gandy', N'agandydy@stanford.edu', N'235.123.6308', CAST(N'2022-09-15' AS Date), 20, CAST(2500.00 AS Decimal(8, 2)), 123, 5)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[jobs] ON 

INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (1, N'Accountant', CAST(4200.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (2, N'Account Manager', CAST(8200.00 AS Decimal(8, 2)), CAST(16000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (3, N'Admin Assistant', CAST(3000.00 AS Decimal(8, 2)), CAST(6000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (4, N'President', CAST(20000.00 AS Decimal(8, 2)), CAST(40000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (5, N'Vice President', CAST(15000.00 AS Decimal(8, 2)), CAST(30000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (6, N'Accountant', CAST(4200.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (7, N'Finance Manager', CAST(8200.00 AS Decimal(8, 2)), CAST(16000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (8, N'HR Representative', CAST(4000.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (9, N'Programmer', CAST(4000.00 AS Decimal(8, 2)), CAST(10000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (10, N'Marketing Manager', CAST(9000.00 AS Decimal(8, 2)), CAST(15000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (11, N'Marketing Representative', CAST(4000.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (12, N'Relations Representative', CAST(4500.00 AS Decimal(8, 2)), CAST(10500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (13, N'Purchasing Clerk', CAST(2500.00 AS Decimal(8, 2)), CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (14, N'Purchasing Manager', CAST(8000.00 AS Decimal(8, 2)), CAST(15000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (15, N'Sales Manager', CAST(10000.00 AS Decimal(8, 2)), CAST(20000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (16, N'Sales Representative', CAST(6000.00 AS Decimal(8, 2)), CAST(12000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (17, N'Shipping Clerk', CAST(2500.00 AS Decimal(8, 2)), CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (18, N'Stock Clerk', CAST(2000.00 AS Decimal(8, 2)), CAST(5000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (19, N'Stock Manager', CAST(5500.00 AS Decimal(8, 2)), CAST(8500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (20, N'Warehouse Worker
', CAST(1200.00 AS Decimal(8, 2)), CAST(2500.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[locations] ON 

INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1400, N'2014 Jabberwocky Rd', N'26192', N'Southlake', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1500, N'2011 Interiors Blvd', N'99236', N'South San Francisco', N'California', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1700, N'2004 Charade Rd', N'98199', N'Seattle', N'Washington', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1800, N'147 Spadina Ave', N'M5V 2L7', N'Toronto', N'Ontario', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2400, N'8204 Arthur St', NULL, N'London', NULL, 229)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2500, N'Magdalen Centre, Oxford Park', N'OX9 9ZB', N'Oxford', N'Oxford', 229)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2700, N'Schwanthalerstr. 7031', N'80925', N'Munich', N'Bavaria', 56)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2701, N'0263 Tony Parkway', N'80204', N'Denver', N'Colorado', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2702, N'0279 Butterfield Street', N'30358', N'Atlanta', N'Georgia', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2703, N'0 Mariners Cove Plaza', N'16534', N'Erie', N'Pennsylvania', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2704, N'03 Hudson Street', N'789', N'Oslo', N'Oslo', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2705, N'0 David Park', N'7340-214', N'Mosteiros', N'Portalegre', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2706, N'0 Goodland Place', N'45310', N'El Refugio', N'Jalisco', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2707, N'0 Manufacturers Lane', N'75518', N'Melaka', N'Melaka', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2708, N'0482 Main Court', N'10004 CEDEX', N'Troyes', N'Champagne-Ardenne', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2709, N'05 Lotheville Terrace', N'51950', N'San Sebastian', N'Mexico', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2710, N'06 Birchwood Junction', N'33204', N'Gijon', N'Asturias', 67)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2711, N'06 Ryan Lane', N'41905', N'Migrate', N'Kentucky', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2712, N'07 Schlimgen Court', N'25005', N'Lleida', N'Cataluna', 67)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2713, N'1 Anthes Street', N'30760', N'Ipoh', N'Perak', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2714, N'1 Center Trail', N'752 26', N'Uppsala', N'Uppsala', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2716, N'1 Katie Point', N'91275', N'Rancho Nuevo', N'Veracruz Llave', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2717, N'1 Manitowish Crossing', N'10129', N'Torino', N'Piemonte', 107)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2718, N'1 Morningstar Plaza', N'V3B', N'Bay Roberts', N'Newfoundland and Labrador', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2719, N'1 Sugar Lane', N'75586', N'Melaka', N'Melaka', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2720, N'10 Anthes Avenue', N'16146', N'Genova', N'Liguria', 107)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2721, N'10 Milwaukee Point', N'3700-599', N'Souto da Costa', N'Aveiro', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2722, N'1050 Rutledge Road', N'22179', N'Hamburg', N'Hamburg', 56)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2723, N'10537 Gale Way', N'4570-198', N'Estela', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2724, N'11 Burrows Point', N'4600-652', N'Quinta', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2725, N'13708 Lerdahl Trail', N'1069', N'Amsterdam Nieuw West', N'Provincie Noord-Holland', 163)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2726, N'1413 Dakota Lane', N'1035', N'Budapest', N'Budapest', 97)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2727, N'1471 Knutson Junction', N'55417', N'Minneapolis', N'Minnesota', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2728, N'15328 Emmet Court', N'6060-089', N'Monsanto', N'Castelo Branco', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2729, N'15669 Sherman Junction', N'4635-522', N'Toutosa', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2730, N'16394 Del Sol Street', N'15286', N'Pittsburgh', N'Pennsylvania', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2731, N'18 Bowman Center', N'4690-712', N'Lameira', N'Viseu', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2732, N'18 Dryden Center', N'55718', N'El Potrero', N'Mexico', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2733, N'18 Rutledge Plaza', N'756 49', N'Uppsala', N'Uppsala', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2734, N'184 Fordem Point', N'44159 CEDEX', N'Ancenis', N'Pays de la Loire', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2735, N'191 Kensington Crossing', N'E4G', N'Viking', N'Alberta', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2736, N'199 Fulton Pass', N'2530-063', N'Abelheira', N'Lisboa', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2737, N'2 1st Lane', N'118 65', N'Stockholm', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2738, N'2 Fremont Way', N'5552', N'Alor Setar', N'Kedah', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2740, N'2 International Drive', N'R2J', N'Kamsack', N'Saskatchewan', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2741, N'2 Lawn Hill', N'361 92', N'Emmaboda', N'Kalmar', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2742, N'2 Lien Parkway', N'72204', N'Little Rock', N'Arkansas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2743, N'2 Marcy Trail', N'1000-005', N'Lisboa', N'Lisboa', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2745, N'20 Ridgeway Road', N'35244', N'Birmingham', N'Alabama', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2746, N'202 Lyons Lane', N'33345', N'Fort Lauderdale', N'Florida', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2747, N'202 Moulton Park', N'4860-077', N'Quinta', N'Braga', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2748, N'2077 Wayridge Hill', N'2420-031', N'Soutocico', N'Leiria', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2749, N'21 Cherokee Circle', N'41004 CEDEX', N'Blois', N'Centre', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2750, N'21440 Spohn Pass', N'59112', N'Billings', N'Montana', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2751, N'222 Jackson Lane', N'22212', N'Arlington', N'Virginia', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2752, N'22354 Hoepker Street', N'5100-005', N'Lamego', N'Viseu', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2753, N'226 Lyons Street', N'4960-343', N'Boavista', N'Viana do Castelo', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2754, N'24 Sundown Lane', N'4625-347', N'Penha Longa', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2755, N'242 Blaine Road', N'28009 CEDEX', N'Chartres', N'Centre', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2756, N'244 Vermont Terrace', N'4089', N'Hafrsfjord', N'Rogaland', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2757, N'24633 Rigney Alley', N'77045', N'Houston', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2758, N'24638 Stone Corner Road', N'5034', N'Tilburg', N'Provincie Noord-Brabant', 163)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2759, N'2481 Katie Pass', N'45208', N'Cincinnati', N'Ohio', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2760, N'252 Oak Valley Way', N'46254', N'Indianapolis', N'Indiana', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2761, N'2547 Ridge Oak Place', N'55564', N'Young America', N'Minnesota', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2762, N'26190 Badeau Terrace', N'3012', N'Drammen', N'Buskerud', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2763, N'27 Hagan Point', N'48604', N'Saginaw', N'Michigan', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2765, N'280 Kedzie Alley', N'3045-356', N'Arzila', N'Coimbra', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2766, N'28021 Shoshone Drive', N'45296', N'Cincinnati', N'Ohio', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2767, N'2866 Summerview Terrace', N'3070-385', N'Presa', N'Coimbra', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2768, N'28886 John Wall Alley', N'59444 CEDEX', N'Wasquehal', N'Nord-Pas-de-Calais', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2769, N'3 Bay Terrace', N'121 48', N'Johanneshov', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2770, N'3 Daystar Street', N'39271', N'El Limon', N'Guerrero', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2771, N'3 Florence Court', N'103 04', N'Stockholm', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2772, N'3 Gale Center', N'V7X', N'Wabana', N'Newfoundland and Labrador', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2773, N'3 Jana Junction', N'115 77', N'Stockholm', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2774, N'3 Larry Drive', N'93856', N'Guadalupe Victoria', N'Veracruz Llave', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2775, N'3 Mitchell Junction', N'60506 CEDEX', N'Chantilly', N'Picardie', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2776, N'3 Prairieview Junction', N'93702', N'Kuching', N'Sarawak', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2777, N'3067 Northport Center', N'1239', N'Budapest', N'Budapest', 97)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2778, N'3181 Washington Circle', N'49544', N'Grand Rapids', N'Michigan', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2779, N'33 Melody Trail', N'4650-454', N'Carvalhal', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2780, N'339 Arrowood Junction', N'34102', N'Naples', N'Florida', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2781, N'34803 Mcbride Road', N'65898', N'Springfield', N'Missouri', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2783, N'3625 Morrow Court', N'3300-043', N'Arganil', N'Coimbra', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2784, N'36272 Scott Junction', N'64540', N'Santa Fe', N'Nuevo Leon', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2785, N'364 Morningstar Plaza', N'2304', N'Leiden', N'Provincie Zuid-Holland', 163)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2786, N'365 Rowland Junction', N'20167', N'Sterling', N'Virginia', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2787, N'366 Michigan Parkway', N'V5A', N'Anmore', N'British Columbia', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2788, N'367 Scofield Road', N'79977', N'El Paso', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2790, N'38 Roth Terrace', N'121 32', N'Enskededalen', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2791, N'38524 Farragut Hill', N'23509', N'Norfolk', N'Virginia', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2792, N'38663 Pond Center', N'5050-365', N'Portela', N'Vila Real', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2793, N'39397 Kedzie Circle', N'21747', N'Hagerstown', N'Maryland', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2794, N'3956 Warrior Circle', N'T9N', N'Bonnyville', N'Alberta', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2795, N'4 Daystar Pass', N'50090', N'Santa Clara', N'Mexico', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2796, N'4 Jana Lane', N'18706', N'Wilkes Barre', N'Pennsylvania', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2797, N'4 Monica Avenue', N'45296', N'Cincinnati', N'Ohio', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2798, N'4 Oxford Circle', N'N9V', N'Osoyoos', N'British Columbia', 37)
GO
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2799, N'41 Melody Pass', N'52405', N'Cedar Rapids', N'Iowa', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2800, N'4179 Hallows Park', N'2670-755', N'Lousa', N'Lisboa', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2801, N'4187 Elka Plaza', N'88930', N'Benito Juarez', N'Tamaulipas', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2802, N'42405 Toban Park', N'174 59', N'Sundbyberg', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2803, N'4459 Tony Way', N'60630', N'Chicago', N'Illinois', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2804, N'45 Lyons Alley', N'30204', N'Cartagena', N'Murcia', 67)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2805, N'4560 Coleman Parkway', N'712', N'Oslo', N'Oslo', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2806, N'4631 Surrey Pass', N'2605-150', N'Pego Longo', N'Lisboa', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2807, N'46432 Carpenter Trail', N'4525-355', N'Louredo', N'Aveiro', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2808, N'4679 Doe Crossing Circle', N'114 84', N'Stockholm', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2809, N'4793 Myrtle Crossing', N'61635', N'Peoria', N'Illinois', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2810, N'4926 Eastwood Trail', N'3220-523', N'Vila Nova', N'Coimbra', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2811, N'5 Evergreen Place', N'961 36', N'Boden', N'Norrbotten', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2812, N'5 John Wall Crossing', N'90705', N'Sandakan', N'Sabah', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2813, N'5 Pierstorff Circle', N'3709', N'Zeist', N'Provincie Utrecht', 163)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2814, N'5 Spenser Point', N'44710', N'Canton', N'Ohio', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2815, N'5 Sycamore Crossing', N'20249', N'Hamburg', N'Hamburg', 56)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2816, N'50 New Castle Park', N'49505', N'Grand Rapids', N'Michigan', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2817, N'501 Dexter Point', N'7712', N'Steinkjer', N'Nord-Trondelag', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2818, N'506 Cardinal Drive', N'89550', N'Reno', N'Nevada', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2819, N'51398 Transport Pass', N'33196', N'Miami', N'Florida', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2820, N'5194 Becker Court', N'4755-393', N'Pedra Furada', N'Braga', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2821, N'52 Dwight Road', N'123 47', N'Farsta', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2822, N'52 Goodland Plaza', N'93094', N'Simi Valley', N'California', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2823, N'52086 Sauthoff Avenue', N'6420-696', N'Vila Franca das Naves', N'Guarda', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2824, N'52180 Boyd Trail', N'40141', N'Bologna', N'Emilia-Romagna', 107)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2825, N'5309 Moland Junction', N'10310', N'Staten Island', N'New York', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2826, N'5389 Mayer Road', N'4435-603', N'Baguim do Monte', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2827, N'54301 Mallard Road', N'76121', N'Fort Worth', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2828, N'545 Spohn Center', N'47207', N'Magisterial', N'Jalisco', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2829, N'549 Holmberg Road', N'16070', N'Bachok', N'Kelantan', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2830, N'551 Fieldstone Place', N'80243', N'Denver', N'Colorado', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2831, N'56 Hazelcrest Point', N'15240', N'Pittsburgh', N'Pennsylvania', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2832, N'56280 International Avenue', N'472', N'Oslo', N'Oslo', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2833, N'57 Kedzie Center', N'5400-339', N'Valongo', N'Vila Real', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2834, N'584 Kim Parkway', N'7104', N'Newark', N'New Jersey', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2835, N'5856 Eliot Way', N'12103', N'Berlin', N'Berlin', 56)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2836, N'5870 Melvin Plaza', N'37924', N'Knoxville', N'Tennessee', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2837, N'5875 Lillian Pass', N'4620-378', N'Ponte Nova', N'Porto', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2838, N'59896 Westerfield Crossing', N'K7S', N'Arnprior', N'Ontario', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2839, N'6 Briar Crest Parkway', N'34080', N'Montpellier', N'Languedoc-Roussillon', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2840, N'6 Brown Plaza', N'68517', N'Lincoln', N'Nebraska', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2841, N'6 Buell Junction', N'395003', N'R S', N'Gujarat', 102)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2842, N'6 Buhler Drive', N'4750-549', N'Manhete', N'Braga', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2843, N'6 Del Sol Park', N'31119', N'Atlanta', N'Georgia', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2844, N'6 Novick Circle', N'88525', N'El Paso', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2845, N'60570 2nd Center', N'1209', N'Hilversum', N'Provincie Noord-Holland', 163)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2846, N'6098 Corry Park', N'20608', N'Kuala Terengganu', N'Terengganu', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2847, N'6235 Southridge Center', N'78220', N'San Antonio', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2849, N'630 Prairie Rose Way', N'92127', N'San Diego', N'California', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2850, N'64 Oak Valley Court', N'6854', N'Norwalk', N'Connecticut', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2851, N'6479 6th Street', N'68451', N'El Progreso', N'Oaxaca', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2852, N'65357 Towne Drive', N'7900-495', N'Canhestros', N'Beja', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2853, N'65649 Morning Terrace', N'3840-032', N'Choca do Mar', N'Aveiro', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2854, N'661 Sugar Crossing', N'N6C', N'London', N'Ontario', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2855, N'67 Stang Parkway', N'162 87', N'Stockholm', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2856, N'676 Golf View Court', N'753 81', N'Uppsala', N'Uppsala', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2857, N'68 Nancy Terrace', N'52740', N'Loma Bonita', N'Mexico', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2858, N'7 Anthes Point', N'93907', N'Salinas', N'California', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2859, N'7 Barby Place', N'4671', N'Kristiansand S', N'Vest-Agder', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2860, N'7 Chinook Drive', N'28944', N'Fuenlabrada', N'Madrid', 67)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2861, N'7 Gateway Lane', N'N4W', N'Grimshaw', N'Alberta', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2862, N'7 Macpherson Trail', N'6420-696', N'Vila Franca das Naves', N'Guarda', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2863, N'7 Village Alley', N'34102', N'Naples', N'Florida', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2864, N'70551 Haas Avenue', N'72204', N'Little Rock', N'Arkansas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2865, N'7095 Morningstar Court', N'3720-085', N'Macinhata da Seixa', N'Aveiro', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2866, N'7097 Swallow Hill', N'5030-049', N'Barreiro', N'Vila Real', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2869, N'73036 Ohio Way', N'44984 CEDEX', N'Sainte-Luce-sur-Loire', N'Pays de la Loire', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2870, N'733 Ridge Oak Plaza', N'N3S', N'Outlook', N'Saskatchewan', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2871, N'74 Tomscot Place', N'30358', N'Atlanta', N'Georgia', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2872, N'7693 Kensington Pass', N'5098', N'Bergen', N'Hordaland', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2873, N'78 Ludington Road', N'19178', N'Philadelphia', N'Pennsylvania', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2874, N'78263 Starling Parkway', N'52060', N'San Antonio', N'Mexico', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2875, N'79412 Shoshone Drive', N'55690', N'Emiliano Zapata', N'Mexico', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2876, N'8 Hallows Avenue', N'981 31', N'Kiruna', N'Norrbotten', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2877, N'8 Hoard Trail', N'89024 CEDEX', N'Auxerre', N'Bourgogne', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2878, N'8 Lindbergh Pass', N'60567', N'Naperville', N'Illinois', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2879, N'8 Mayer Trail', N'39130', N'Magdeburg', N'Sachsen-Anhalt', 56)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2880, N'8 Merry Junction', N'87105', N'Albuquerque', N'New Mexico', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2881, N'8051 Alpine Court', N'68144', N'Omaha', N'Nebraska', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2882, N'8085 Pennsylvania Road', N'571', N'Oslo', N'Oslo', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2883, N'81580 Sachs Place', N'679', N'Oslo', N'Oslo', 164)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2884, N'819 Menomonie Junction', N'61607', N'Emiliano Zapata', N'Michoacan De Ocampo', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2885, N'82524 Basil Street', N'94970', N'Manlio Fabio Altamirano', N'Veracruz Llave', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2886, N'826 Merry Alley', N'128', N'Roma', N'Lazio', 107)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2887, N'82642 Larry Hill', N'374 81', N'Karlshamn', N'Blekinge', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2888, N'8333 Fair Oaks Alley', N'89759', N'Independencia', N'Tamaulipas', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2889, N'8333 Roth Road', N'2525-805', N'Serra D''El Rei', N'Leiria', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2890, N'8481 Summerview Plaza', N'15572', N'Kota Bharu', N'Kelantan', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2891, N'8657 Westend Drive', N'19204 CEDEX', N'Ussel', N'Limousin', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2892, N'866 Westerfield Trail', N'3885-705', N'Maceda', N'Aveiro', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2893, N'8733 Arkansas Road', N'4860-411', N'Sobreira', N'Braga', 181)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2894, N'87343 Buhler Crossing', N'64504', N'Saint Joseph', N'Missouri', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2895, N'88 Summer Ridge Plaza', N'19318 CEDEX', N'Brive-la-Gaillarde', N'Limousin', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2896, N'9 Farmco Park', N'10131', N'New York City', N'New York', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2897, N'9 Lien Avenue', N'145 74', N'Norsborg', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2898, N'901 Barnett Parkway', N'79004 CEDEX', N'Niort', N'Poitou-Charentes', 74)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2899, N'90217 Fairview Trail', N'67710', N'Las Palmas', N'Nuevo Leon', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2900, N'907 Northfield Center', N'5622', N'Alor Setar', N'Kedah', 155)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2901, N'90702 Maryland Plaza', N'60630', N'Chicago', N'Illinois', 231)
GO
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2902, N'91 Boyd Way', N'43240', N'Columbus', N'Ohio', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2903, N'91 Ridge Oak Way', N'33023', N'Hollywood', N'Florida', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2904, N'9317 Gateway Avenue', N'155 33', N'Nykvarn', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2905, N'94 Spohn Center', N'70183', N'New Orleans', N'Louisiana', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2906, N'9424 Union Point', N'L5W', N'Mississauga', N'Ontario', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2907, N'94615 Delaware Junction', N'92640', N'Fullerton', N'California', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2908, N'9493 Macpherson Court', N'S0G', N'Calmar', N'Alberta', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2909, N'9528 Dunning Junction', N'114 49', N'Stockholm', N'Stockholm', 195)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2910, N'9585 Hagan Junction', N'36770', N'La Cruz', N'Guanajuato', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2911, N'96693 Nancy Lane', N'77299', N'Houston', N'Texas', 231)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2912, N'97412 Sage Hill', N'V1A', N'Kimberley', N'British Columbia', 37)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2913, N'977 Becker Point', N'96980', N'Francisco Villa', N'Veracruz Llave', 154)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2914, N'986 Luster Parkway', N'14905', N'Elmira', N'New York', 231)
SET IDENTITY_INSERT [dbo].[locations] OFF
GO
SET IDENTITY_INSERT [dbo].[regions] ON 

INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (1, N'Europe')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (2, N'North-Americas')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (3, N'Asia')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (4, N'Middle East and Africa')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (5, N'Africa')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (6, N'Oceania')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (7, N'South-America')
SET IDENTITY_INSERT [dbo].[regions] OFF
GO
ALTER TABLE [dbo].[countries] ADD  CONSTRAINT [DF__countries__count__300424B4]  DEFAULT (NULL) FOR [country_name]
GO
ALTER TABLE [dbo].[departments] ADD  DEFAULT (NULL) FOR [location_id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [manager_id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [department_id]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__min_salary__35BCFE0A]  DEFAULT (NULL) FOR [min_salary]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__max_salary__36B12243]  DEFAULT (NULL) FOR [max_salary]
GO
ALTER TABLE [dbo].[locations] ADD  CONSTRAINT [DF__locations__stree__37A5467C]  DEFAULT (NULL) FOR [street_address]
GO
ALTER TABLE [dbo].[locations] ADD  CONSTRAINT [DF__locations__posta__38996AB5]  DEFAULT (NULL) FOR [postal_code]
GO
ALTER TABLE [dbo].[locations] ADD  CONSTRAINT [DF__locations__state__398D8EEE]  DEFAULT (NULL) FOR [state_province]
GO
ALTER TABLE [dbo].[regions] ADD  DEFAULT (NULL) FOR [region_name]
GO
ALTER TABLE [dbo].[countries]  WITH CHECK ADD  CONSTRAINT [FK_countries_regions] FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([region_id])
GO
ALTER TABLE [dbo].[countries] CHECK CONSTRAINT [FK_countries_regions]
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD  CONSTRAINT [FK__departmen__locat__3C69FB99] FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[departments] CHECK CONSTRAINT [FK__departmen__locat__3C69FB99]
GO
ALTER TABLE [dbo].[dependents]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK__employees__job_i__3F466844] FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK__employees__job_i__3F466844]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK__locations__count__412EB0B6] FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK__locations__count__412EB0B6]
GO
USE [master]
GO
ALTER DATABASE [HumanResources] SET  READ_WRITE 
GO
