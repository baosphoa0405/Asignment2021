USE [master]
GO
/****** Object:  Database [JavawebAssginment]    Script Date: 19/3/2021 2:58:47 PM ******/
CREATE DATABASE [JavawebAssginment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavawebAssginment', FILENAME = N'D:\JavawebAssginment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JavawebAssginment_log', FILENAME = N'D:\JavawebAssginment_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JavawebAssginment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JavawebAssginment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JavawebAssginment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JavawebAssginment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JavawebAssginment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JavawebAssginment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JavawebAssginment] SET ARITHABORT OFF 
GO
ALTER DATABASE [JavawebAssginment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JavawebAssginment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JavawebAssginment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JavawebAssginment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JavawebAssginment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JavawebAssginment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JavawebAssginment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JavawebAssginment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JavawebAssginment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JavawebAssginment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JavawebAssginment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JavawebAssginment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JavawebAssginment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JavawebAssginment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JavawebAssginment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JavawebAssginment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JavawebAssginment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JavawebAssginment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JavawebAssginment] SET  MULTI_USER 
GO
ALTER DATABASE [JavawebAssginment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JavawebAssginment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JavawebAssginment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JavawebAssginment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JavawebAssginment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JavawebAssginment] SET QUERY_STORE = OFF
GO
USE [JavawebAssginment]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [JavawebAssginment]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 19/3/2021 2:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[IDcart] [int] IDENTITY(1,1) NOT NULL,
	[totalPrice] [float] NULL,
	[dateOrder] [date] NULL,
	[dateShip] [date] NULL,
	[isPay] [bit] NULL,
	[username] [nvarchar](20) NULL,
 CONSTRAINT [PK_Cart_] PRIMARY KEY CLUSTERED 
(
	[IDcart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 19/3/2021 2:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[IDcart] [nvarchar](10) NOT NULL,
	[quanlity] [nvarchar](10) NULL,
	[IDproduct] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[IDcart] ASC,
	[IDproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/3/2021 2:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDcategory] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](20) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IDcategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/3/2021 2:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDproduct] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[img] [nvarchar](50) NULL,
	[size] [nvarchar](10) NULL,
	[price] [float] NULL,
	[description] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[IDcategory] [nvarchar](10) NULL,
	[quanlity] [nvarchar](10) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IDproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19/3/2021 2:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](20) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](10) NULL,
	[role] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (17, 4000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-17' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (19, 5000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-28' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (20, 6000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (21, 12000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (23, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (24, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (25, 4000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (26, 5000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-17' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (27, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (28, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (29, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (30, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (31, 4000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (32, 3000000, CAST(N'2021-03-16' AS Date), CAST(N'2021-03-31' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (33, 1000000, CAST(N'2021-03-16' AS Date), CAST(N'2021-04-04' AS Date), 0, N'U003')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (34, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-27' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (35, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-04-06' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (36, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-31' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (37, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-04-09' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (38, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-04-09' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (39, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-18' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (40, 1000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-18' AS Date), 0, N'U004')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (43, 2000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-27' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (44, 5000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-27' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (45, 4000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (46, 6000000, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-27' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (50, 2000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-28' AS Date), 0, N'baosphoa0405')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (51, 2000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-28' AS Date), 0, N'baosphoa0405')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (54, 2000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-28' AS Date), 0, N'baosphoa0405')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (55, 9000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-21' AS Date), 0, N'baosphoa0405')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (56, 5000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-25' AS Date), 0, N'baosphoa0405')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (57, 4000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-25' AS Date), 0, N'U004')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (58, 4000000, CAST(N'2021-03-19' AS Date), CAST(N'2021-04-01' AS Date), 0, N'baosphoa0403')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'17', N'2', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'17', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'19', N'3', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'19', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'20', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'20', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'20', N'1', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'21', N'2', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'21', N'2', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'21', N'2', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'23', N'3', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'25', N'4', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'26', N'5', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'27', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'27', N'1', N'P009')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'28', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'28', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'31', N'2', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'32', N'3', N'P005')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'33', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'34', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'36', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'39', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'40', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'43', N'2', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'44', N'3', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'44', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'45', N'2', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'46', N'2', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'50', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'51', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'54', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'55', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'55', N'1', N'P005')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'55', N'1', N'P006')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'55', N'1', N'P012')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'56', N'1', N'P006')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'56', N'1', N'P011')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'57', N'2', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'58', N'2', N'P002')
GO
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'F001', N'GUCCI BOOTS')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M001', N'GUCCI SNEAKERS')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M002', N'GUCCI MULES')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M003', N'GUCCI SANDALS')
GO
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P001', N'Gucci Sneakers', N'gucci1', N'40', 1000000, N'Giày được làm từ chất liệu tốt, dễ đi', 1, N'M001', N'0')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P002', N'Gucci Jordaan', N'gucci2', N'35', 2000000, N'Rất dễ phối đồ', 1, N'F001', N'89')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P003', N'Gucci Men''s Ace', N'gucci3', N'30', 3000000, N'Thiết kế tối giản, tinh tế.', 1, N'F001', N'97')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P004', N'Gucci Chunky ', N'gucci4', N'44', 4000000, N'Giày mang một phong thái trẻ trung.', 1, N'M001', N'0')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P005', N'Gucci Sneakers Red', N'sneakers1', N'30', 1000000, N'Giày thời trang', 1, N'M001', N'99')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P006', N'Gucci Sneakers White', N'sneakers2', N'41', 2000000, N'Giày hip hop', 1, N'M001', N'8')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P007', N'Gucci Sneakers Yellow', N'sneakers3', N'42', 3000000, N'Giày hoa hậu', 1, N'M001', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P008', N'Gucci Sneakers Purple', N'sneakers', N'43', 4000000, N'Giày chống nước', 1, N'M001', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P009', N'Gucci Sandal Red', N'sandal', N'39', 1000000, N'Giày thời trang', 1, N'M003', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P010', N'Gucci Sandal Yellow', N'sandal1', N'38', 2000000, N'Giày hip hop', 1, N'M003', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P011', N'Gucci Sandal Purple', N'sandal2', N'37', 3000000, N'Giày chống nước', 1, N'M003', N'99')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P012', N'Gucci Sandal Blue', N'sandal3', N'36', 4000000, N'Giày hoa hậu', 1, N'M003', N'99')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P013', N'Gucci Mule Red', N'mule', N'35', 1000000, N'Giày thời trang', 1, N'M002', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P014', N'Gucci Mule Yellow', N'mule1', N'34', 2000000, N'Giày hip hop', 1, N'M002', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P015', N'Gucci Mule Purple', N'mule2', N'33', 3000000, N'Giày hoa hậu', 1, N'M002', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P016', N'Gucci Mule Pink', N'mule3', N'32', 4000000, N'Giày chống nước', 1, N'M002', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P017', N'Gucci Boots Red', N'boots', N'31', 1000000, N'Giày thời trang', 1, N'F001', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P018', N'Gucci Boots Yellow', N'boots1', N'30', 2000000, N'Giày hoa hậu', 1, N'F001', N'100')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory], [quanlity]) VALUES (N'P019', N'Gucci Boots Pink', N'boots3', N'45', 3000000, N'Giày chống nước', 1, N'F001', N'10')
GO
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'abc', N'sang', N'123', 1)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'baosphoa0403', NULL, NULL, 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'baosphoa0405', N'baohihi', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U002', N'khoa', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U004', N'báº£o haha', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U006', N'hieu gaa', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U0077', N'gdsgds', N'123', 0)
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IDcategory])
REFERENCES [dbo].[Category] ([IDcategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [JavawebAssginment] SET  READ_WRITE 
GO
