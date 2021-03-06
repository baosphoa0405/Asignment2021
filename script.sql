USE [master]
GO
/****** Object:  Database [JavawebAssginment]    Script Date: 15/3/2021 11:41:05 PM ******/
CREATE DATABASE [JavawebAssginment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavawebAssginment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JavawebAssginment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JavawebAssginment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JavawebAssginment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Cart]    Script Date: 15/3/2021 11:41:05 PM ******/
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
	[username] [nvarchar](10) NULL,
 CONSTRAINT [PK_Cart_] PRIMARY KEY CLUSTERED 
(
	[IDcart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 15/3/2021 11:41:05 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 15/3/2021 11:41:05 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 15/3/2021 11:41:05 PM ******/
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IDproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15/3/2021 11:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](10) NOT NULL,
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

INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (1, 200, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-15' AS Date), 1, N'hihi')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (2, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (7, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (8, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-18' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (9, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-26' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (10, 6000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-17' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (11, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (12, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-28' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (13, 7000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-31' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (14, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-27' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (15, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-27' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (16, 7000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-17' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (17, 4000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-17' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (18, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-18' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (19, 5000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-28' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (20, 6000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (21, 12000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (22, 6000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (23, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (24, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (25, 4000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (26, 5000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-17' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (27, 2000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (28, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (29, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (30, 3000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-20' AS Date), 0, N'U002')
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (31, 4000000, CAST(N'2021-03-15' AS Date), CAST(N'2021-03-19' AS Date), 0, N'U002')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'16', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'16', N'1', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'16', N'1', N'P006')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'17', N'2', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'17', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'18', N'2', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'19', N'3', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'19', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'20', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'20', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'20', N'1', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'21', N'2', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'21', N'2', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'21', N'2', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'22', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'22', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'22', N'1', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'23', N'3', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'25', N'4', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'26', N'5', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'27', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'27', N'1', N'P009')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'28', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'28', N'1', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'31', N'2', N'P002')
GO
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'F001', N'GUCCI BOOTS')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M001', N'GUCCI SNEAKERS')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M002', N'GUCCI MULES')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M003', N'GUCCI SANDALS')
GO
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P001', N'Gucci Sneakers', N'gucci1', N'40', 1000000, N'Giày được làm từ chất liệu tốt, dễ đi', 1, N'M001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P002', N'Gucci Jordaan', N'gucci2', N'35', 2000000, N'Rất dễ phối đồ', 1, N'F001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P003', N'Gucci Men''s Ace Embroidered', N'gucci3', N'30', 3000000, N'Thiết kế tối giản, tinh tế.', 1, N'F001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P004', N'Gucci Chunky Rainbow', N'gucci4', N'44', 4000000, N'Giày mang một phong thái trẻ trung.', 1, N'M001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P005', N'Gucci Sneakers Red', N'sneakers1', N'30', 1000000, N'Giày thời trang', 1, N'M001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P006', N'Gucci Sneakers White', N'sneakers2', N'41', 2000000, N'Giày hip hop', 1, N'M001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P007', N'Gucci Sneakers Yellow', N'sneakers3', N'42', 3000000, N'Giày hoa hậu', 1, N'M001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P008', N'Gucci Sneakers Purple', N'sneakers', N'43', 4000000, N'Giày chống nước', 1, N'M001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P009', N'Gucci Sandal Red', N'sandal', N'39', 1000000, N'Giày thời trang', 1, N'M003')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P010', N'Gucci Sandal Yellow', N'sandal1', N'38', 2000000, N'Giày hip hop', 1, N'M003')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P011', N'Gucci Sandal Purple', N'sandal2', N'37', 3000000, N'Giày chống nước', 1, N'M003')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P012', N'Gucci Sandal Blue', N'sandal3', N'36', 4000000, N'Giày hoa hậu', 1, N'M003')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P013', N'Gucci Mule Red', N'mule', N'35', 1000000, N'Giày thời trang', 1, N'M002')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P014', N'Gucci Mule Yellow', N'mule1', N'34', 2000000, N'Giày hip hop', 1, N'M002')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P015', N'Gucci Mule Purple', N'mule2', N'33', 3000000, N'Giày hoa hậu', 1, N'M002')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P016', N'Gucci Mule Pink', N'mule3', N'32', 4000000, N'Giày chống nước', 1, N'M002')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P017', N'Gucci Boots Red', N'boots', N'31', 1000000, N'Giày thời trang', 1, N'F001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P018', N'Gucci Boots Yellow', N'boots1', N'30', 2000000, N'Giày hoa hậu', 1, N'F001')
INSERT [dbo].[Product] ([IDproduct], [name], [img], [size], [price], [description], [status], [IDcategory]) VALUES (N'P019', N'Gucci Boots Pink', N'boots3', N'45', 3000000, N'Giày chống nước', 1, N'F001')
GO
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'1111111', N'hieu gaa', N'1234567', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'hieu ga', N'hieu ga', N'1234567', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U001', N'sanggg11', N'1234', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U002', N'khoa', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U003', N'hiếu', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U004', N'bảo', N'123', 1)
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
