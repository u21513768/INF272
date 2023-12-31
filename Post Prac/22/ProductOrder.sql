USE [master]
GO
/****** Object:  Database [ProductOrder]    Script Date: 2022/10/23 12:49:45 ******/
CREATE DATABASE [ProductOrder]
GO
ALTER DATABASE [ProductOrder] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductOrder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductOrder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductOrder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductOrder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductOrder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductOrder] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductOrder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductOrder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductOrder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductOrder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductOrder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductOrder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductOrder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductOrder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductOrder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductOrder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductOrder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductOrder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductOrder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductOrder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductOrder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductOrder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductOrder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductOrder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductOrder] SET  MULTI_USER 
GO
ALTER DATABASE [ProductOrder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductOrder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductOrder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductOrder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductOrder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductOrder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductOrder] SET QUERY_STORE = OFF
GO
USE [ProductOrder]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2022/10/23 12:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[City] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2022/10/23 12:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderNumber] [nvarchar](10) NULL,
	[CustomerId] [int] NOT NULL,
	[TotalAmount] [decimal](12, 2) NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 2022/10/23 12:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ORDERITEM] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2022/10/23 12:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[UnitPrice] [decimal](12, 2) NULL,
	[Package] [nvarchar](30) NULL,
	[IsDiscontinued] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/10/23 12:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
 CONSTRAINT [PK_SUPPLIER] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (1, N'Maria', N'Anders', N'Berlin', N'Germany', N'030-0074321')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (2, N'Ana', N'Trujillo', N'México D.F.', N'Mexico', N'(5) 555-4729')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (3, N'Antonio', N'Moreno', N'México D.F.', N'Mexico', N'(5) 555-3932')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (4, N'Thomas', N'Hardy', N'London', N'UK', N'(171) 555-7788')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (5, N'Christina', N'Berglund', N'Luleå', N'Sweden', N'0921-12 34 65')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (6, N'Hanna', N'Moos', N'Mannheim', N'Germany', N'0621-08460')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (7, N'Frédérique', N'Citeaux', N'Strasbourg', N'France', N'88.60.15.31')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (8, N'Martín', N'Sommer', N'Madrid', N'Spain', N'(91) 555 22 82')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (9, N'Laurence', N'Lebihan', N'Marseille', N'France', N'91.24.45.40')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (10, N'Elizabeth', N'Lincoln', N'Tsawassen', N'Canada', N'(604) 555-4729')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (11, N'Victoria', N'Ashworth', N'London', N'UK', N'(171) 555-1212')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (12, N'Patricio', N'Simpson', N'Buenos Aires', N'Argentina', N'(1) 135-5555')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (13, N'Francisco', N'Chang', N'México D.F.', N'Mexico', N'(5) 555-3392')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (14, N'Yang', N'Wang', N'Bern', N'Switzerland', N'0452-076545')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (15, N'Pedro', N'Afonso', N'Sao Paulo', N'Brazil', N'(11) 555-7647')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (16, N'Elizabeth', N'Brown', N'London', N'UK', N'(171) 555-2282')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (17, N'Sven', N'Ottlieb', N'Aachen', N'Germany', N'0241-039123')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (18, N'Janine', N'Labrune', N'Nantes', N'France', N'40.67.88.88')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (19, N'Ann', N'Devon', N'London', N'UK', N'(171) 555-0297')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (20, N'Roland', N'Mendel', N'Graz', N'Austria', N'7675-3425')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (1, CAST(N'2012-07-04T00:00:00.000' AS DateTime), N'542378', 1, CAST(440.00 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (2, CAST(N'2012-07-05T00:00:00.000' AS DateTime), N'542379', 6, CAST(1863.40 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (3, CAST(N'2012-07-08T00:00:00.000' AS DateTime), N'542380', 8, CAST(1813.00 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (4, CAST(N'2012-07-08T00:00:00.000' AS DateTime), N'542381', 13, CAST(670.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (5, CAST(N'2012-07-09T00:00:00.000' AS DateTime), N'542382', 15, CAST(3730.00 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (6, CAST(N'2012-07-10T00:00:00.000' AS DateTime), N'542383', 16, CAST(1444.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (7, CAST(N'2012-07-11T00:00:00.000' AS DateTime), N'542384', 7, CAST(625.20 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (8, CAST(N'2012-07-12T00:00:00.000' AS DateTime), N'542385', 5, CAST(2490.50 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (9, CAST(N'2012-07-15T00:00:00.000' AS DateTime), N'542386', 4, CAST(517.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (10, CAST(N'2012-07-16T00:00:00.000' AS DateTime), N'542387', 20, CAST(1119.90 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (11, CAST(N'2012-07-17T00:00:00.000' AS DateTime), N'542388', 18, CAST(2018.60 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (12, CAST(N'2012-07-18T00:00:00.000' AS DateTime), N'542389', 19, CAST(100.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (13, CAST(N'2012-07-19T00:00:00.000' AS DateTime), N'542390', 17, CAST(1746.20 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (14, CAST(N'2012-07-19T00:00:00.000' AS DateTime), N'542391', 6, CAST(448.00 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (15, CAST(N'2012-07-22T00:00:00.000' AS DateTime), N'542392', 8, CAST(624.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (16, CAST(N'2012-07-23T00:00:00.000' AS DateTime), N'542393', 2, CAST(2464.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (17, CAST(N'2012-07-24T00:00:00.000' AS DateTime), N'542394', 9, CAST(724.50 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (18, CAST(N'2012-07-25T00:00:00.000' AS DateTime), N'542395', 10, CAST(1176.00 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (19, CAST(N'2012-07-26T00:00:00.000' AS DateTime), N'542396', 13, CAST(364.80 AS Decimal(12, 2)))
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount]) VALUES (20, CAST(N'2012-07-29T00:00:00.000' AS DateTime), N'542397', 11, CAST(4031.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 11, 12)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (2, 1, 4, 10)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (3, 1, 3, 5)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (4, 2, 14, 9)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (5, 2, 15, 40)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (6, 3, 16, 10)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (7, 3, 6, 35)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (8, 3, 1, 15)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (9, 4, 19, 6)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (10, 4, 18, 15)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (11, 4, 2, 20)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (12, 5, 20, 40)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (13, 5, 11, 25)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (14, 5, 8, 40)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (15, 6, 17, 20)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (16, 6, 15, 42)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (17, 6, 14, 40)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (18, 7, 7, 15)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (19, 7, 5, 21)
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [ProductId], [Quantity]) VALUES (20, 7, 2, 21)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (1, N'Chai', 1, CAST(18.00 AS Decimal(12, 2)), N'10 boxes x 20 bags', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (2, N'Chang', 1, CAST(19.00 AS Decimal(12, 2)), N'24 - 12 oz bottles', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (3, N'Aniseed Syrup', 1, CAST(10.00 AS Decimal(12, 2)), N'12 - 550 ml bottles', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, CAST(22.00 AS Decimal(12, 2)), N'48 - 6 oz jars', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, CAST(21.35 AS Decimal(12, 2)), N'36 boxes', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (6, N'Grandma''s Boysenberry Spread', 3, CAST(25.00 AS Decimal(12, 2)), N'12 - 8 oz jars', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 3, CAST(30.00 AS Decimal(12, 2)), N'12 - 1 lb pkgs.', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (8, N'Northwoods Cranberry Sauce', 3, CAST(40.00 AS Decimal(12, 2)), N'12 - 12 oz jars', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (9, N'Mishi Kobe Niku', 4, CAST(97.00 AS Decimal(12, 2)), N'18 - 500 g pkgs.', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (10, N'Ikura', 4, CAST(31.00 AS Decimal(12, 2)), N'12 - 200 ml jars', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (11, N'Queso Cabrales', 5, CAST(21.00 AS Decimal(12, 2)), N'1 kg pkg.', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (12, N'Queso Manchego La Pastora', 5, CAST(38.00 AS Decimal(12, 2)), N'10 - 500 g pkgs.', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (13, N'Konbu', 6, CAST(6.00 AS Decimal(12, 2)), N'2 kg box', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (14, N'Tofu', 6, CAST(23.25 AS Decimal(12, 2)), N'40 - 100 g pkgs.', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (15, N'Genen Shouyu', 6, CAST(15.50 AS Decimal(12, 2)), N'24 - 250 ml bottles', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (16, N'Pavlova', 7, CAST(17.45 AS Decimal(12, 2)), N'32 - 500 g boxes', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (17, N'Alice Mutton', 7, CAST(39.00 AS Decimal(12, 2)), N'20 - 1 kg tins', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (18, N'Carnarvon Tigers', 7, CAST(62.50 AS Decimal(12, 2)), N'16 kg pkg.', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (19, N'Teatime Chocolate Biscuits', 8, CAST(9.20 AS Decimal(12, 2)), N'10 boxes x 12 pieces', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued]) VALUES (20, N'Sir Rodney''s Marmalade', 8, CAST(81.00 AS Decimal(12, 2)), N'30 gift boxes', 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (1, N'Exotic Liquids', N'Charlotte Cooper', NULL, N'London', N'UK', N'(171) 555-2222', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (2, N'New Orleans Cajun Delights', N'Shelley Burke', NULL, N'New Orleans', N'USA', N'(100) 555-4822', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (3, N'Grandma Kelly''s Homestead', N'Regina Murphy', NULL, N'Ann Arbor', N'USA', N'(313) 555-5735', N'(313) 555-3349')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (4, N'Tokyo Traders', N'Yoshi Nagase', NULL, N'Tokyo', N'Japan', N'(03) 3555-5011', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (5, N'Cooperativa de Quesos ''Las Cabras''', N'Antonio del Valle Saavedra', NULL, N'Oviedo', N'Spain', N'(98) 598 76 54', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (6, N'Mayumi''s', N'Mayumi Ohno', NULL, N'Osaka', N'Japan', N'(06) 431-7877', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (7, N'Pavlova, Ltd.', N'Ian Devling', NULL, N'Melbourne', N'Australia', N'(03) 444-2343', N'(03) 444-6588')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (8, N'Specialty Biscuits, Ltd.', N'Peter Wilson', NULL, N'Manchester', N'UK', N'(161) 555-4448', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (9, N'PB Knäckebröd AB', N'Lars Peterson', NULL, N'Göteborg', N'Sweden', N'031-987 65 43', N'031-987 65 91')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (10, N'Refrescos Americanas LTDA', N'Carlos Diaz', NULL, N'Sao Paulo', N'Brazil', N'(11) 555 4640', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (11, N'Heli Süßwaren GmbH & Co. KG', N'Petra Winkler', NULL, N'Berlin', N'Germany', N'(010) 9984510', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (12, N'Plutzer Lebensmittelgroßmärkte AG', N'Martin Bein', NULL, N'Frankfurt', N'Germany', N'(069) 992755', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (13, N'Nord-Ost-Fisch Handelsgesellschaft mbH', N'Sven Petersen', NULL, N'Cuxhaven', N'Germany', N'(04721) 8713', N'(04721) 8714')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (14, N'Formaggi Fortini s.r.l.', N'Elio Rossi', NULL, N'Ravenna', N'Italy', N'(0544) 60323', N'(0544) 60603')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (15, N'Norske Meierier', N'Beate Vileid', NULL, N'Sandvika', N'Norway', N'(0)2-953010', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (16, N'Bigfoot Breweries', N'Cheryl Saylor', NULL, N'Bend', N'USA', N'(503) 555-9931', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (17, N'Svensk Sjöföda AB', N'Michael Björn', NULL, N'Stockholm', N'Sweden', N'08-123 45 67', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (18, N'Aux joyeux ecclésiastiques', N'Guylène Nodier', NULL, N'Paris', N'France', N'(1) 03.83.00.68', N'(1) 03.83.00.62')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (19, N'New England Seafood Cannery', N'Robb Merchant', NULL, N'Boston', N'USA', N'(617) 555-3267', N'(617) 555-3389')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (20, N'Leka Trading', N'Chandra Leka', NULL, N'Singapore', N'Singapore', N'555-8787', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (21, N'Lyngbysild', N'Niels Petersen', NULL, N'Lyngby', N'Denmark', N'43844108', N'43844115')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (22, N'Zaanse Snoepfabriek', N'Dirk Luchte', NULL, N'Zaandam', N'Netherlands', N'(12345) 1212', N'(12345) 1210')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (23, N'Karkki Oy', N'Anne Heikkonen', NULL, N'Lappeenranta', N'Finland', N'(953) 10956', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (24, N'G''day, Mate', N'Wendy Mackenzie', NULL, N'Sydney', N'Australia', N'(02) 555-5914', N'(02) 555-4873')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (25, N'Ma Maison', N'Jean-Guy Lauzon', NULL, N'Montréal', N'Canada', N'(514) 555-9022', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (26, N'Pasta Buttini s.r.l.', N'Giovanni Giudici', NULL, N'Salerno', N'Italy', N'(089) 6547665', N'(089) 6547667')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (27, N'Escargots Nouveaux', N'Marie Delamare', NULL, N'Montceau', N'France', N'85.57.00.07', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (28, N'Gai pâturage', N'Eliane Noz', NULL, N'Annecy', N'France', N'38.76.98.06', N'38.76.98.58')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (29, N'Forêts d''érables', N'Chantal Goulet', NULL, N'Ste-Hyacinthe', N'Canada', N'(514) 555-2955', N'(514) 555-2921')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexCustomerName]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexCustomerName] ON [dbo].[Customer]
(
	[LastName] ASC,
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderCustomerId]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexOrderCustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderOrderDate]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexOrderOrderDate] ON [dbo].[Order]
(
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderItemOrderId]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexOrderItemOrderId] ON [dbo].[OrderItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderItemProductId]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexOrderItemProductId] ON [dbo].[OrderItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexProductName]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexProductName] ON [dbo].[Product]
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IndexProductSupplierId]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexProductSupplierId] ON [dbo].[Product]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexSupplierCountry]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexSupplierCountry] ON [dbo].[Supplier]
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexSupplierName]    Script Date: 2022/10/23 12:49:45 ******/
CREATE NONCLUSTERED INDEX [IndexSupplierName] ON [dbo].[Supplier]
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsDiscontinued]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_REFERENCE_CUSTOMER] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_REFERENCE_CUSTOMER]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_ORDERITE_REFERENCE_ORDER] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_ORDERITE_REFERENCE_ORDER]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_ORDERITE_REFERENCE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_ORDERITE_REFERENCE_PRODUCT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_REFERENCE_SUPPLIER] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_PRODUCT_REFERENCE_SUPPLIER]
GO
USE [master]
GO
ALTER DATABASE [ProductOrder] SET  READ_WRITE 
GO
