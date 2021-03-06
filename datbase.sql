USE [master]
GO
/****** Object:  Database [WardrobeMVC]    Script Date: 8/7/2017 2:07:57 AM ******/
CREATE DATABASE [WardrobeMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WardrobeMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeMVC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WardrobeMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WardrobeMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WardrobeMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WardrobeMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WardrobeMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WardrobeMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WardrobeMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WardrobeMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WardrobeMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WardrobeMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WardrobeMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WardrobeMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WardrobeMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WardrobeMVC] SET  MULTI_USER 
GO
ALTER DATABASE [WardrobeMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WardrobeMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WardrobeMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WardrobeMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WardrobeMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WardrobeMVC]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accessory](
	[AccessorysID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [varchar](500) NOT NULL,
	[Color] [nchar](10) NOT NULL,
	[Season] [nchar](10) NOT NULL,
	[Occassions] [varchar](50) NOT NULL,
	[AsscTypesID] [int] NOT NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[AccessorysID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AsscType]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsscType](
	[AsscTypesID] [int] NOT NULL,
	[AsscTypeName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_AsscType] PRIMARY KEY CLUSTERED 
(
	[AsscTypesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bottoms]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bottoms](
	[BottomsID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](500) NOT NULL,
	[Color] [nchar](10) NOT NULL,
	[Season] [nchar](10) NOT NULL,
	[Occassion] [nvarchar](50) NOT NULL,
	[BottomTypesID] [int] NOT NULL,
 CONSTRAINT [PK_Bottoms] PRIMARY KEY CLUSTERED 
(
	[BottomsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BottomType]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BottomType](
	[BottomTypesID] [int] IDENTITY(1,1) NOT NULL,
	[BottomTypeName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_BottomType] PRIMARY KEY CLUSTERED 
(
	[BottomTypesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfit]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfit](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[TopsID] [int] NULL,
	[BottomsID] [int] NULL,
	[ShoesID] [int] NULL,
	[AccessorysID] [int] NULL,
 CONSTRAINT [PK_Outfit] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe](
	[ShoesID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](500) NOT NULL,
	[Color] [nchar](10) NOT NULL,
	[Season] [nchar](10) NOT NULL,
	[Occassion] [nvarchar](50) NOT NULL,
	[ShoeTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Shoe] PRIMARY KEY CLUSTERED 
(
	[ShoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoeType]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeType](
	[ShoeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ShoesTypeName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ShoeType] PRIMARY KEY CLUSTERED 
(
	[ShoeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_3]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_3](
	[BottomID] [int] NOT NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Top]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Top](
	[TopsID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [nvarchar](500) NOT NULL,
	[Color] [nchar](10) NOT NULL,
	[Season] [nchar](10) NOT NULL,
	[Occassion] [nvarchar](50) NOT NULL,
	[TopTypesID] [int] NOT NULL,
 CONSTRAINT [PK_Top] PRIMARY KEY CLUSTERED 
(
	[TopsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TopType]    Script Date: 8/7/2017 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopType](
	[TopTypesID] [int] IDENTITY(1,1) NOT NULL,
	[TopTypeName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TopType] PRIMARY KEY CLUSTERED 
(
	[TopTypesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([AccessorysID], [Name], [Photo], [Color], [Season], [Occassions], [AsscTypesID]) VALUES (6, N'Belt Biker', N'/images/rsz_belt.jpg', N'Black     ', N'All       ', N'All', 1)
INSERT [dbo].[Accessory] ([AccessorysID], [Name], [Photo], [Color], [Season], [Occassions], [AsscTypesID]) VALUES (7, N'Hat Harley', N'/images/rsz_hat.jpg', N'Black     ', N'Summer    ', N'Riding', 2)
INSERT [dbo].[Accessory] ([AccessorysID], [Name], [Photo], [Color], [Season], [Occassions], [AsscTypesID]) VALUES (8, N'Watch Silver', N'/images/rsz_watch.jpg', N'Silver    ', N'All       ', N'All', 3)
SET IDENTITY_INSERT [dbo].[Accessory] OFF
INSERT [dbo].[AsscType] ([AsscTypesID], [AsscTypeName]) VALUES (1, N'BeltBlack ')
INSERT [dbo].[AsscType] ([AsscTypesID], [AsscTypeName]) VALUES (2, N'HatHarley ')
INSERT [dbo].[AsscType] ([AsscTypesID], [AsscTypeName]) VALUES (3, N'WatchCzn  ')
SET IDENTITY_INSERT [dbo].[Bottoms] ON 

INSERT [dbo].[Bottoms] ([BottomsID], [Name], [Photo], [Color], [Season], [Occassion], [BottomTypesID]) VALUES (6, N'Dickies Work khakies', N'/images/rsz_dickies.jpg', N'Tan       ', N'All       ', N'Work', 2)
INSERT [dbo].[Bottoms] ([BottomsID], [Name], [Photo], [Color], [Season], [Occassion], [BottomTypesID]) VALUES (7, N'Levis Jeans Faded Plain Pockets', N'/images/rsz_jeans.jpg', N'Blue      ', N'All       ', N'All', 5)
INSERT [dbo].[Bottoms] ([BottomsID], [Name], [Photo], [Color], [Season], [Occassion], [BottomTypesID]) VALUES (8, N'True Religion Jeans Decorated Pockets', N'/images/rsz_truerelligonjeans.jpg', N'Blue      ', N'All       ', N'All', 4)
SET IDENTITY_INSERT [dbo].[Bottoms] OFF
SET IDENTITY_INSERT [dbo].[BottomType] ON 

INSERT [dbo].[BottomType] ([BottomTypesID], [BottomTypeName]) VALUES (2, N'khakis    ')
INSERT [dbo].[BottomType] ([BottomTypesID], [BottomTypeName]) VALUES (4, N'JeansTR   ')
INSERT [dbo].[BottomType] ([BottomTypesID], [BottomTypeName]) VALUES (5, N'JeansLV   ')
SET IDENTITY_INSERT [dbo].[BottomType] OFF
SET IDENTITY_INSERT [dbo].[Outfit] ON 

INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (21, 16, 6, 3, 6)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (22, 21, 7, 3, 6)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (23, 19, 8, 4, 6)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (24, 22, 8, 3, 6)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (25, 19, 7, 3, 8)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (26, 23, 8, 3, 7)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (27, 16, 6, 3, 6)
INSERT [dbo].[Outfit] ([OutfitID], [TopsID], [BottomsID], [ShoesID], [AccessorysID]) VALUES (28, 17, 8, 3, 7)
SET IDENTITY_INSERT [dbo].[Outfit] OFF
SET IDENTITY_INSERT [dbo].[Shoe] ON 

INSERT [dbo].[Shoe] ([ShoesID], [Name], [Photo], [Color], [Season], [Occassion], [ShoeTypeID]) VALUES (3, N'Boots High Ankle', N'/images/rsz_harleyBoots.jpg', N'Black     ', N'All       ', N'All', 1)
INSERT [dbo].[Shoe] ([ShoesID], [Name], [Photo], [Color], [Season], [Occassion], [ShoeTypeID]) VALUES (4, N'Flip Flops in Between Toe', N'/images/rsz_corona.jpg', N'Brown     ', N'Summer    ', N'Party', 2)
SET IDENTITY_INSERT [dbo].[Shoe] OFF
SET IDENTITY_INSERT [dbo].[ShoeType] ON 

INSERT [dbo].[ShoeType] ([ShoeTypeID], [ShoesTypeName]) VALUES (1, N'HarleyBoot')
INSERT [dbo].[ShoeType] ([ShoeTypeID], [ShoesTypeName]) VALUES (2, N'CoronaFF  ')
SET IDENTITY_INSERT [dbo].[ShoeType] OFF
SET IDENTITY_INSERT [dbo].[Top] ON 

INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (16, N'Stafford Plain V Neck', N'/images/rsz_staffordvneck.jpg', N'White     ', N'All       ', N'All', 3)
INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (17, N'Stafford Plain Crew Neck', N'/images/rsz_staffordcrewneck.jpg', N'White     ', N'All       ', N'All', 2)
INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (19, N'P Ellis Dress Shirt Long Sleeve', N'/images/rsz_perryellispasleybrown.jpg', N'Brown     ', N'Fall      ', N'Party', 5)
INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (20, N'Dress Shirt Long Sleeve', N'/images/rsz_perryellispasleyblue.jpg', N'Blue      ', N'Fall      ', N'Party', 4)
INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (21, N'Sleeveless T-Shirt', N'/images/rsz_sleevlesstshirt.jpg', N'Black     ', N'Summer    ', N'All', 8)
INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (22, N'Harley T-Shirt Short Sleeve', N'/images/harley.jpg', N'Black     ', N'Summer    ', N'Riding', 9)
INSERT [dbo].[Top] ([TopsID], [Name], [Photo], [Color], [Season], [Occassion], [TopTypesID]) VALUES (23, N'Dress Shirt Long Sleeve', N'/images/rsz_perryellispasley.jpg', N'Light Blue', N'Fall      ', N'Party', 7)
SET IDENTITY_INSERT [dbo].[Top] OFF
SET IDENTITY_INSERT [dbo].[TopType] ON 

INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (2, N'StaffordCN')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (3, N'StaffordVN')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (4, N'PerryBlue ')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (5, N'PerryBrown')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (6, N'TRLong    ')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (7, N'PerryLB   ')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (8, N'SleeveLess')
INSERT [dbo].[TopType] ([TopTypesID], [TopTypeName]) VALUES (9, N'HarleySS  ')
SET IDENTITY_INSERT [dbo].[TopType] OFF
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_AsscType] FOREIGN KEY([AsscTypesID])
REFERENCES [dbo].[AsscType] ([AsscTypesID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_AsscType]
GO
ALTER TABLE [dbo].[Bottoms]  WITH CHECK ADD  CONSTRAINT [FK_Bottoms_BottomType] FOREIGN KEY([BottomTypesID])
REFERENCES [dbo].[BottomType] ([BottomTypesID])
GO
ALTER TABLE [dbo].[Bottoms] CHECK CONSTRAINT [FK_Bottoms_BottomType]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Accessory] FOREIGN KEY([AccessorysID])
REFERENCES [dbo].[Accessory] ([AccessorysID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Accessory]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Bottoms] FOREIGN KEY([BottomsID])
REFERENCES [dbo].[Bottoms] ([BottomsID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Bottoms]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Shoe] FOREIGN KEY([ShoesID])
REFERENCES [dbo].[Shoe] ([ShoesID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Shoe]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Top] FOREIGN KEY([TopsID])
REFERENCES [dbo].[Top] ([TopsID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Top]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_ShoeType] FOREIGN KEY([ShoeTypeID])
REFERENCES [dbo].[ShoeType] ([ShoeTypeID])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_ShoeType]
GO
ALTER TABLE [dbo].[Top]  WITH CHECK ADD  CONSTRAINT [FK_Top_TopType] FOREIGN KEY([TopTypesID])
REFERENCES [dbo].[TopType] ([TopTypesID])
GO
ALTER TABLE [dbo].[Top] CHECK CONSTRAINT [FK_Top_TopType]
GO
USE [master]
GO
ALTER DATABASE [WardrobeMVC] SET  READ_WRITE 
GO
