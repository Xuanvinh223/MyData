USE [master]
GO
/****** Object:  Database [QuanLi_NoiThat_v1]    Script Date: 7/31/2023 12:03:58 AM ******/
CREATE DATABASE [QuanLi_NoiThat_v1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLi_NoiThat_v1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLi_NoiThat_v1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLi_NoiThat_v1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLi_NoiThat_v1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLi_NoiThat_v1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET QUERY_STORE = OFF
GO
USE [QuanLi_NoiThat_v1]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NULL,
	[Fullname] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[RoleId] [varchar](50) NULL,
	[Createdate] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillImportProduct]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillImportProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[ProviderId] [int] NULL,
	[Createdate] [datetime] NULL,
	[Amount] [money] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_BillImportProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Createdate] [datetime] NULL,
	[Amount] [money] NULL,
	[DiscountCode] [varchar](50) NULL,
	[DiscountPercent] [int] NULL,
	[NewAmount] [money] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
	[Amount] [money] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Discount_Code] [varchar](50) NOT NULL,
	[Discount_Percent] [int] NULL,
	[Quantity] [int] NULL,
	[Used_Quantity] [int] NULL,
	[Startdate] [datetime] NULL,
	[Enddate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[Discount_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageProduct]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Name] [varchar](500) NULL,
 CONSTRAINT [PK_ImageDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportProducts]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillImportProductId] [int] NULL,
	[ProductId] [int] NULL,
	[PriceImport] [money] NULL,
	[QuantityImport] [int] NULL,
	[AmountImport] [money] NULL,
	[Description] [nvarchar](max) NULL,
	[Createdate] [datetime] NULL,
 CONSTRAINT [PK_ImportProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meterials]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Meterial] [nvarchar](500) NULL,
 CONSTRAINT [PK_Meterials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTP]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[OTPCode] [varchar](6) NULL,
	[ExpirationTime] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_OTP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Price] [money] NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_PriceHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[SizeId] [int] NULL,
	[MeterialId] [int] NULL,
	[Image] [varchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetCategory]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CategoryId] [varchar](50) NULL,
 CONSTRAINT [PK_SetCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 7/31/2023 12:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Gender], [Address], [Image], [RoleId], [Createdate]) VALUES (N'user1', N'password1', N'User One', N'user1@example.com', N'1234567890', 1, N'123 Main St, City', N'image1.jpg', N'role1', CAST(N'2023-07-30T23:43:15.187' AS DateTime))
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Gender], [Address], [Image], [RoleId], [Createdate]) VALUES (N'user2', N'password2', N'User Two', N'user2@example.com', N'9876543210', 0, N'456 Park Ave, Town', N'image2.jpg', N'role2', CAST(N'2023-07-30T23:43:15.187' AS DateTime))
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Gender], [Address], [Image], [RoleId], [Createdate]) VALUES (N'user3', N'password3', N'User Three', N'user3@example.com', N'5554443333', 1, N'789 Elm Rd, Village', N'image3.jpg', N'role1', CAST(N'2023-07-30T23:43:15.187' AS DateTime))
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Gender], [Address], [Image], [RoleId], [Createdate]) VALUES (N'user4', N'password4', N'User Four', N'user4@example.com', N'1112223333', 0, N'101 Oak St, County', N'image4.jpg', N'role2', CAST(N'2023-07-30T23:43:15.187' AS DateTime))
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Gender], [Address], [Image], [RoleId], [Createdate]) VALUES (N'user5', N'password5', N'User Five', N'user5@example.com', N'9998887777', 1, N'222 Maple Dr, State', N'image5.jpg', N'role1', CAST(N'2023-07-30T23:43:15.187' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (3, 2, 4, 3, 100.0000, 300.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (4, 2, 6, 1, 120.0000, 120.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (5, 3, 5, 2, 80.0000, 160.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (6, 3, 8, 4, 90.0000, 360.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (7, 4, 7, 1, 75.0000, 75.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (8, 4, 9, 2, 85.0000, 170.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (9, 5, 10, 1, 70.0000, 70.0000)
INSERT [dbo].[BillDetail] ([Id], [BillId], [ProductId], [Quantity], [Price], [Amount]) VALUES (10, 5, 12, 3, 95.0000, 285.0000)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[BillImportProduct] ON 

INSERT [dbo].[BillImportProduct] ([Id], [Username], [ProviderId], [Createdate], [Amount], [PaymentMethod], [Status]) VALUES (1, N'user1', 1, CAST(N'2023-07-30T23:43:52.720' AS DateTime), 250.0000, N'Cash', 1)
INSERT [dbo].[BillImportProduct] ([Id], [Username], [ProviderId], [Createdate], [Amount], [PaymentMethod], [Status]) VALUES (2, N'user2', 2, CAST(N'2023-07-30T23:43:52.720' AS DateTime), 200.0000, N'Credit Card', 1)
INSERT [dbo].[BillImportProduct] ([Id], [Username], [ProviderId], [Createdate], [Amount], [PaymentMethod], [Status]) VALUES (3, N'user3', 3, CAST(N'2023-07-30T23:43:52.720' AS DateTime), 180.0000, N'PayPal', 1)
INSERT [dbo].[BillImportProduct] ([Id], [Username], [ProviderId], [Createdate], [Amount], [PaymentMethod], [Status]) VALUES (4, N'user4', 4, CAST(N'2023-07-30T23:43:52.720' AS DateTime), 300.0000, N'Cash', 0)
INSERT [dbo].[BillImportProduct] ([Id], [Username], [ProviderId], [Createdate], [Amount], [PaymentMethod], [Status]) VALUES (5, N'user5', 5, CAST(N'2023-07-30T23:43:52.720' AS DateTime), 350.0000, N'Credit Card', 0)
SET IDENTITY_INSERT [dbo].[BillImportProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Id], [Username], [Createdate], [Amount], [DiscountCode], [DiscountPercent], [NewAmount], [PaymentMethod], [Status]) VALUES (2, N'user1', CAST(N'2023-01-05T00:00:00.000' AS DateTime), 190.0000, N'DISC10', 10, 171.0000, N'Credit Card', 1)
INSERT [dbo].[Bills] ([Id], [Username], [Createdate], [Amount], [DiscountCode], [DiscountPercent], [NewAmount], [PaymentMethod], [Status]) VALUES (3, N'user2', CAST(N'2023-01-10T00:00:00.000' AS DateTime), 420.0000, NULL, NULL, 420.0000, N'Paypal', 1)
INSERT [dbo].[Bills] ([Id], [Username], [Createdate], [Amount], [DiscountCode], [DiscountPercent], [NewAmount], [PaymentMethod], [Status]) VALUES (4, N'user3', CAST(N'2023-02-15T00:00:00.000' AS DateTime), 320.0000, N'DISC15', 15, 272.0000, N'Cash', 1)
INSERT [dbo].[Bills] ([Id], [Username], [Createdate], [Amount], [DiscountCode], [DiscountPercent], [NewAmount], [PaymentMethod], [Status]) VALUES (5, N'user4', CAST(N'2023-02-20T00:00:00.000' AS DateTime), 245.0000, N'DISC10', 10, 220.5000, N'Credit Card', 1)
INSERT [dbo].[Bills] ([Id], [Username], [Createdate], [Amount], [DiscountCode], [DiscountPercent], [NewAmount], [PaymentMethod], [Status]) VALUES (6, N'user5', CAST(N'2023-03-25T00:00:00.000' AS DateTime), 355.0000, NULL, NULL, 355.0000, N'Paypal', 1)
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (2, N'user1', 3, 2, 55.0000, 110.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (3, N'user1', 5, 1, 80.0000, 80.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (4, N'user2', 4, 3, 100.0000, 300.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (5, N'user2', 6, 1, 120.0000, 120.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (6, N'user3', 5, 2, 80.0000, 160.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (7, N'user3', 8, 4, 90.0000, 360.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (8, N'user4', 7, 1, 75.0000, 75.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (9, N'user4', 9, 2, 85.0000, 170.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (10, N'user5', 10, 1, 70.0000, 70.0000, 1)
INSERT [dbo].[Carts] ([Id], [Username], [ProductId], [Quantity], [Price], [Amount], [Status]) VALUES (11, N'user5', 12, 3, 95.0000, 285.0000, 1)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'cat1', N'Category One')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'cat2', N'Category Two')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'cat3', N'Category Three')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'cat4', N'Category Four')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'cat5', N'Category Five')
GO
INSERT [dbo].[Discounts] ([Discount_Code], [Discount_Percent], [Quantity], [Used_Quantity], [Startdate], [Enddate], [Status]) VALUES (N'DISC10', 10, 100, 20, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([Discount_Code], [Discount_Percent], [Quantity], [Used_Quantity], [Startdate], [Enddate], [Status]) VALUES (N'DISC15', 15, 150, 30, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-10-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([Discount_Code], [Discount_Percent], [Quantity], [Used_Quantity], [Startdate], [Enddate], [Status]) VALUES (N'DISC20', 20, 200, 50, CAST(N'2023-03-15T00:00:00.000' AS DateTime), CAST(N'2023-09-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([Discount_Code], [Discount_Percent], [Quantity], [Used_Quantity], [Startdate], [Enddate], [Status]) VALUES (N'DISC25', 25, 300, 100, CAST(N'2023-06-10T00:00:00.000' AS DateTime), CAST(N'2023-12-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([Discount_Code], [Discount_Percent], [Quantity], [Used_Quantity], [Startdate], [Enddate], [Status]) VALUES (N'DISC30', 30, 250, NULL, CAST(N'2023-07-01T07:00:00.000' AS DateTime), CAST(N'2023-11-30T07:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[ImageProduct] ON 

INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (3, 3, N'product3_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (4, 3, N'product3_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (5, 4, N'product4_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (6, 4, N'product4_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (7, 5, N'product5_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (8, 5, N'product5_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (9, 6, N'product6_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (10, 6, N'product6_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (11, 7, N'product7_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (12, 7, N'product7_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (13, 8, N'product8_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (14, 8, N'product8_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (15, 9, N'product9_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (16, 9, N'product9_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (17, 10, N'product10_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (18, 10, N'product10_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (19, 11, N'product11_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (20, 11, N'product11_image2.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (21, 12, N'product12_image1.jpg')
INSERT [dbo].[ImageProduct] ([Id], [ProductId], [Name]) VALUES (22, 12, N'product12_image2.jpg')
SET IDENTITY_INSERT [dbo].[ImageProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportProducts] ON 

INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (13, 3, 3, 55.0000, 50, 2750.0000, N'Imported from supplier A', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (14, 1, 4, 90.0000, 30, 2700.0000, N'Imported from supplier A', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (15, 2, 3, 48.0000, 20, 960.0000, N'Imported from supplier B', CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (16, 2, 5, 70.0000, 25, 1750.0000, N'Imported from supplier B', CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (17, 3, 4, 35.0000, 40, 1400.0000, N'Imported from supplier C', CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (24, 3, 3, 52.0000, 30, 1560.0000, N'Imported from supplier C', CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (25, 4, 6, 70.0000, 15, 1050.0000, N'Imported from supplier D', CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (26, 4, 8, 88.0000, 10, 880.0000, N'Imported from supplier D', CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (27, 5, 9, 60.0000, 50, 3000.0000, N'Imported from supplier E', CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ImportProducts] ([Id], [BillImportProductId], [ProductId], [PriceImport], [QuantityImport], [AmountImport], [Description], [Createdate]) VALUES (28, 5, 12, 75.0000, 40, 3000.0000, N'Imported from supplier E', CAST(N'2023-05-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ImportProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Meterials] ON 

INSERT [dbo].[Meterials] ([Id], [Meterial]) VALUES (1, N'Wood')
INSERT [dbo].[Meterials] ([Id], [Meterial]) VALUES (2, N'Metal')
INSERT [dbo].[Meterials] ([Id], [Meterial]) VALUES (3, N'Glass')
INSERT [dbo].[Meterials] ([Id], [Meterial]) VALUES (4, N'Plastic')
INSERT [dbo].[Meterials] ([Id], [Meterial]) VALUES (5, N'Fabric')
SET IDENTITY_INSERT [dbo].[Meterials] OFF
GO
SET IDENTITY_INSERT [dbo].[OTP] ON 

INSERT [dbo].[OTP] ([Id], [Username], [OTPCode], [ExpirationTime], [Status], [CreateAt], [UpdateAt]) VALUES (1, N'user1', N'123456', CAST(N'2023-07-31T00:00:00.000' AS DateTime), N'Active', CAST(N'2023-07-30T23:44:34.857' AS DateTime), CAST(N'2023-07-30T23:44:34.857' AS DateTime))
INSERT [dbo].[OTP] ([Id], [Username], [OTPCode], [ExpirationTime], [Status], [CreateAt], [UpdateAt]) VALUES (2, N'user2', N'654321', CAST(N'2023-07-31T00:00:00.000' AS DateTime), N'Active', CAST(N'2023-07-30T23:44:34.857' AS DateTime), CAST(N'2023-07-30T23:44:34.857' AS DateTime))
INSERT [dbo].[OTP] ([Id], [Username], [OTPCode], [ExpirationTime], [Status], [CreateAt], [UpdateAt]) VALUES (3, N'user3', N'987654', CAST(N'2023-07-31T00:00:00.000' AS DateTime), N'Active', CAST(N'2023-07-30T23:44:34.857' AS DateTime), CAST(N'2023-07-30T23:44:34.857' AS DateTime))
INSERT [dbo].[OTP] ([Id], [Username], [OTPCode], [ExpirationTime], [Status], [CreateAt], [UpdateAt]) VALUES (4, N'user4', N'456789', CAST(N'2023-07-31T00:00:00.000' AS DateTime), N'Active', CAST(N'2023-07-30T23:44:34.857' AS DateTime), CAST(N'2023-07-30T23:44:34.857' AS DateTime))
INSERT [dbo].[OTP] ([Id], [Username], [OTPCode], [ExpirationTime], [Status], [CreateAt], [UpdateAt]) VALUES (5, N'user5', N'789456', CAST(N'2023-07-31T00:00:00.000' AS DateTime), N'Active', CAST(N'2023-07-30T23:44:34.857' AS DateTime), CAST(N'2023-07-30T23:44:34.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[OTP] OFF
GO
SET IDENTITY_INSERT [dbo].[PriceHistory] ON 

INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (4, 3, 60.0000, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (5, 4, 100.0000, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (6, 5, 80.0000, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (7, 6, 75.0000, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (8, 7, 90.0000, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (9, 3, 55.0000, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (10, 4, 95.0000, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (11, 5, 75.0000, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (12, 6, 70.0000, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (13, 7, 88.0000, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (14, 3, 52.0000, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (15, 4, 90.0000, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (16, 5, 70.0000, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (17, 6, 68.0000, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [ChangeDate]) VALUES (18, 7, 85.0000, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PriceHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (3, N'Product One', 100.0000, 10, N'Description of Product One', 1, 1, 1, N'product1.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (4, N'Product Two', 50.0000, 15, N'Description of Product Two', 1, 2, 2, N'product2.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (5, N'Product Three', 75.0000, 20, N'Description of Product Three', 1, 1, 3, N'product3.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (6, N'Product Four', 120.0000, 5, N'Description of Product Four', 1, 3, 2, N'product4.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (7, N'Product Five', 90.0000, 12, N'Description of Product Five', 1, 2, 1, N'product5.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (8, N'Product One', 100.0000, 10, N'Description of Product One', 1, 1, 1, N'product1.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (9, N'Product Two', 50.0000, 15, N'Description of Product Two', 1, 2, 2, N'product2.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (10, N'Product Three', 75.0000, 20, N'Description of Product Three', 1, 1, 3, N'product3.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (11, N'Product Four', 120.0000, 5, N'Description of Product Four', 1, 3, 2, N'product4.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Description], [Status], [SizeId], [MeterialId], [Image]) VALUES (12, N'Product Five', 90.0000, 12, N'Description of Product Five', 1, 2, 1, N'product5.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([Id], [Name], [Address], [Email], [Phone], [Description]) VALUES (1, N'Provider One', N'123 Provider St, City', N'provider1@example.com', N'1112223333', N'Provider One description')
INSERT [dbo].[Provider] ([Id], [Name], [Address], [Email], [Phone], [Description]) VALUES (2, N'Provider Two', N'456 Provider Ave, Town', N'provider2@example.com', N'4445556666', N'Provider Two description')
INSERT [dbo].[Provider] ([Id], [Name], [Address], [Email], [Phone], [Description]) VALUES (3, N'Provider Three', N'789 Provider Rd, Village', N'provider3@example.com', N'7778889999', N'Provider Three description')
INSERT [dbo].[Provider] ([Id], [Name], [Address], [Email], [Phone], [Description]) VALUES (4, N'Provider Four', N'101 Provider Dr, County', N'provider4@example.com', N'2223334444', N'Provider Four description')
INSERT [dbo].[Provider] ([Id], [Name], [Address], [Email], [Phone], [Description]) VALUES (5, N'Provider Five', N'222 Provider Blvd, State', N'provider5@example.com', N'8889990000', N'Provider Five description')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'role1', N'Role One')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'role2', N'Role Two')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'role3', N'Role Three')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'role4', N'Role Four')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'role5', N'Role Five')
GO
SET IDENTITY_INSERT [dbo].[SetCategory] ON 

INSERT [dbo].[SetCategory] ([Id], [ProductId], [CategoryId]) VALUES (9, 3, N'CAT1')
INSERT [dbo].[SetCategory] ([Id], [ProductId], [CategoryId]) VALUES (10, 3, N'CAT3')
INSERT [dbo].[SetCategory] ([Id], [ProductId], [CategoryId]) VALUES (11, 4, N'CAT2')
INSERT [dbo].[SetCategory] ([Id], [ProductId], [CategoryId]) VALUES (12, 5, N'CAT4')
INSERT [dbo].[SetCategory] ([Id], [ProductId], [CategoryId]) VALUES (13, 6, N'CAT5')
SET IDENTITY_INSERT [dbo].[SetCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Id], [Size]) VALUES (1, N'Small')
INSERT [dbo].[Size] ([Id], [Size]) VALUES (2, N'Medium')
INSERT [dbo].[Size] ([Id], [Size]) VALUES (3, N'Large')
INSERT [dbo].[Size] ([Id], [Size]) VALUES (4, N'Extra Large')
INSERT [dbo].[Size] ([Id], [Size]) VALUES (5, N'XXL')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Role]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Bills] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Bills]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Products]
GO
ALTER TABLE [dbo].[BillImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_BillImportProduct_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[BillImportProduct] CHECK CONSTRAINT [FK_BillImportProduct_Accounts]
GO
ALTER TABLE [dbo].[BillImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_BillImportProduct_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([Id])
GO
ALTER TABLE [dbo].[BillImportProduct] CHECK CONSTRAINT [FK_BillImportProduct_Provider]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Accounts1] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Accounts1]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Discounts] FOREIGN KEY([DiscountCode])
REFERENCES [dbo].[Discounts] ([Discount_Code])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Discounts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[ImageProduct]  WITH CHECK ADD  CONSTRAINT [FK_ImageDetail_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ImageProduct] CHECK CONSTRAINT [FK_ImageDetail_Products]
GO
ALTER TABLE [dbo].[ImportProducts]  WITH CHECK ADD  CONSTRAINT [FK_ImportProducts_BillImportProduct] FOREIGN KEY([BillImportProductId])
REFERENCES [dbo].[BillImportProduct] ([Id])
GO
ALTER TABLE [dbo].[ImportProducts] CHECK CONSTRAINT [FK_ImportProducts_BillImportProduct]
GO
ALTER TABLE [dbo].[ImportProducts]  WITH CHECK ADD  CONSTRAINT [FK_ImportProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ImportProducts] CHECK CONSTRAINT [FK_ImportProducts_Products]
GO
ALTER TABLE [dbo].[OTP]  WITH CHECK ADD  CONSTRAINT [FK_OTP_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OTP] CHECK CONSTRAINT [FK_OTP_Accounts]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriceHistory_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_PriceHistory_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Meterials] FOREIGN KEY([MeterialId])
REFERENCES [dbo].[Meterials] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Meterials]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Size]
GO
ALTER TABLE [dbo].[SetCategory]  WITH CHECK ADD  CONSTRAINT [FK_SetCategory_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[SetCategory] CHECK CONSTRAINT [FK_SetCategory_Categories]
GO
ALTER TABLE [dbo].[SetCategory]  WITH CHECK ADD  CONSTRAINT [FK_SetCategory_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[SetCategory] CHECK CONSTRAINT [FK_SetCategory_Products]
GO
USE [master]
GO
ALTER DATABASE [QuanLi_NoiThat_v1] SET  READ_WRITE 
GO
