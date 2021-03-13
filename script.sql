USE [master]
GO
/****** Object:  Database [JavawebAssginment]    Script Date: 3/13/2021 4:33:39 PM ******/
CREATE DATABASE [JavawebAssginment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavawebAssginment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\JavawebAssginment.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JavawebAssginment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\JavawebAssginment_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [JavawebAssginment]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/13/2021 4:33:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[IDcart] [nvarchar](10) NOT NULL,
	[totalPrice] [float] NULL,
	[dateOrder] [date] NULL,
	[dateShip] [date] NULL,
	[isPay] [bit] NULL,
	[username] [nvarchar](10) NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[IDcart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 3/13/2021 4:33:39 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/13/2021 4:33:39 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/13/2021 4:33:39 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/13/2021 4:33:39 PM ******/
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
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (N'C001', 2000, CAST(N'2021-01-31' AS Date), CAST(N'2021-02-01' AS Date), 1, NULL)
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (N'C002', 3000, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-03' AS Date), 1, NULL)
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (N'C003', 4000, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-04' AS Date), 1, NULL)
INSERT [dbo].[Cart] ([IDcart], [totalPrice], [dateOrder], [dateShip], [isPay], [username]) VALUES (N'C004', 5000, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-05' AS Date), 1, NULL)
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'C001', N'1', N'P001')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'C002', N'2', N'P002')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'C003', N'3', N'P003')
INSERT [dbo].[CartDetail] ([IDcart], [quanlity], [IDproduct]) VALUES (N'C004', N'4', N'P004')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'F001', N'GUCCI BOOTS')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M001', N'GUCCI SNEAKERS')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M002', N'GUCCI MULES')
INSERT [dbo].[Category] ([IDcategory], [categoryName]) VALUES (N'M003', N'GUCCI SANDALS')
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
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'1111111', N'hieu gaa', N'1234567', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'hieu ga', N'hieu ga', N'1234567', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U001', N'sanggg11', N'1234', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U002', N'khoa', N'123', 1)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U003', N'hiếu', N'123', 0)
INSERT [dbo].[User] ([username], [name], [password], [role]) VALUES (N'U004', N'bảo', N'123', 1)
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart] FOREIGN KEY([IDcart])
REFERENCES [dbo].[Cart] ([IDcart])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Product] FOREIGN KEY([IDproduct])
REFERENCES [dbo].[Product] ([IDproduct])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Product]
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
