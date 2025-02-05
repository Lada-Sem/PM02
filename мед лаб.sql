USE [master]
GO
/****** Object:  Database [Медицинская лаборатория]    Script Date: 15.05.2024 8:49:16 ******/
CREATE DATABASE [Медицинская лаборатория]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Медицинская лаборатория2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Медицинская лаборатория2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Медицинская лаборатория2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Медицинская лаборатория2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Медицинская лаборатория] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Медицинская лаборатория].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Медицинская лаборатория] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET ARITHABORT OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Медицинская лаборатория] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Медицинская лаборатория] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Медицинская лаборатория] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Медицинская лаборатория] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Медицинская лаборатория] SET  MULTI_USER 
GO
ALTER DATABASE [Медицинская лаборатория] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Медицинская лаборатория] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Медицинская лаборатория] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Медицинская лаборатория] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Медицинская лаборатория] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Медицинская лаборатория]
GO
/****** Object:  Table [dbo].[blood_services]    Script Date: 15.05.2024 8:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blood_services](
	[id] [int] NOT NULL,
	[service] [int] NOT NULL,
	[result] [float] NOT NULL,
	[finished] [bigint] NOT NULL,
	[accepted] [bit] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[analyzer] [nvarchar](50) NOT NULL,
	[user] [int] NOT NULL,
 CONSTRAINT [PK_blood_services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bloode]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bloode](
	[id] [int] NOT NULL,
	[patient] [int] NOT NULL,
	[barcode] [int] NOT NULL,
	[date] [bigint] NOT NULL,
 CONSTRAINT [PK_bloode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[surname] [nvarchar](255) NOT NULL,
	[login] [nvarchar](255) NOT NULL,
	[ip] [nvarchar](50) NULL,
	[password] [nvarchar](255) NOT NULL,
	[lastenter] [date] NULL,
	[services] [nvarchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Бухгалтер]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Бухгалтер](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[expense_company] [int] NULL,
	[services] [int] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_Бухгалтер] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Выставленые счета страховой компании]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Выставленые счета страховой компании](
	[id] [int] NOT NULL,
	[insurance_company] [int] NULL,
	[cost] [money] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_Выставленые счета страховой компании] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Данные анализатора]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные анализатора](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[date_time_order] [datetime] NOT NULL,
	[date_time_servise] [datetime] NOT NULL,
 CONSTRAINT [PK_Данные анализатора] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Данные лаборантов]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные лаборантов](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[date_time_of_entry] [datetime] NULL,
	[servaces] [int] NULL,
 CONSTRAINT [PK_Данные лаборантов] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ДанныеСтраховыхКомпаний]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ДанныеСтраховыхКомпаний](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[INN] [int] NOT NULL,
	[p/c] [int] NOT NULL,
	[BIK] [int] NOT NULL,
 CONSTRAINT [PK_ДанныеСтраховыхКомпаний] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[service] [int] NULL,
	[status_order] [nvarchar](50) NULL,
	[services_rendered] [int] NULL,
	[finished] [date] NULL,
	[patient] [int] NULL,
	[status_service] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ОказаннаяУслуга]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ОказаннаяУслуга](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_result] [date] NOT NULL,
	[user] [int] NOT NULL,
	[analyzer] [int] NOT NULL,
	[result] [float] NOT NULL,
 CONSTRAINT [PK_ОказаниеУслуг] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Пациент]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пациент](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[birthday] [date] NULL,
	[pasport_s] [int] NULL,
	[pasport_n] [int] NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[number_polis] [int] NOT NULL,
	[type_polis] [nvarchar](50) NULL,
	[страховая компания] [int] NULL,
 CONSTRAINT [PK_Пациент] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Услуги_лаборатории]    Script Date: 15.05.2024 8:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Услуги_лаборатории](
	[id] [int] NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[cost] [money] NOT NULL,
	[deviation] [int] NULL,
 CONSTRAINT [PK_Услуги_лаборатории] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (1, 415, 0.20596, 1590686686000, 1, N'Finished', N'Ledetect', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (2, 548, 0.32315, 1579176567000, 1, N'Finished', N'Ledetect', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (3, 229, 0.87765, 1575674200000, 1, N'Rejected', N'Ledetect', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (4, 287, 0.70653, 1597014952000, 0, N'Rejected', N'Ledetect', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (5, 855, 1.10557, 1587597447000, 0, N'Rejected', N'Ledetect', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (6, 176, 0.82349, 1569329607000, 0, N'Rejected', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (7, 258, 2.70431, 1583169574000, 0, N'Rejected', N'Ledetect', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (8, 229, 0.26165, 1588641706000, 0, N'Finished', N'Biorad', 83)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (9, 797, 0.75965, 1596771039000, 0, N'Finished', N'Biorad', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (10, 311, 2.26157, 1589736842000, 1, N'Finished', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (11, 229, 1.30955, 1580420776000, 0, N'Rejected', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (12, 323, 2.45194, 1590893181000, 1, N'Rejected', N'Biorad', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (14, 797, 2.33942, 1596874933000, 1, N'Finished', N'Biorad', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (15, 258, 1.81458, 1582812034000, 0, N'Rejected', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (17, 176, 2.00529, 1586486894000, 0, N'Rejected', N'Ledetect', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (18, 323, 2.68164, 1586726738000, 0, N'Rejected', N'Ledetect', 33)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (19, 258, 2.58109, 1596024681000, 0, N'Rejected', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (20, 287, 1.02999, 1594450718000, 0, N'Rejected', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (21, 311, 1.50671, 1594579955000, 1, N'Finished', N'Biorad', 17)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (22, 548, 1.34183, 1597323751000, 0, N'Rejected', N'Ledetect', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (23, 229, 2.74746, 1582706825000, 0, N'Finished', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (24, 258, 0.5515, 1575664121000, 0, N'Finished', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (25, 176, 1.54711, 1599689897000, 0, N'Rejected', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (26, 287, 1.47505, 1598454084000, 0, N'Finished', N'Ledetect', 57)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (27, 323, 0.73895, 1581770481000, 0, N'Finished', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (28, 258, 1.45771, 1573597542000, 1, N'Finished', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (29, 229, 2.52095, 1590919740000, 1, N'Rejected', N'Ledetect', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (30, 287, 2.93254, 1592943696000, 0, N'Rejected', N'Ledetect', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (31, 855, 1.28269, 1574115807000, 0, N'Rejected', N'Ledetect', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (32, 176, 0.25445, 1593327663000, 1, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (33, 415, 1.1003, 1585207386000, 0, N'Finished', N'Biorad', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (34, 258, 0.5973, 1577583818000, 0, N'Finished', N'Ledetect', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (35, 311, 0.60158, 1575316802000, 0, N'Rejected', N'Ledetect', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (36, 855, 2.29756, 1583495871000, 1, N'Rejected', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (37, 229, 1.70197, 1585062930000, 1, N'Finished', N'Ledetect', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (38, 229, 1.83918, 1594931097000, 1, N'Finished', N'Biorad', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (39, 855, 1.23863, 1599341091000, 1, N'Rejected', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (40, 287, 0.79542, 1574313517000, 1, N'Rejected', N'Biorad', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (41, 415, 0.92081, 1597046670000, 1, N'Finished', N'Ledetect', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (42, 287, 1.55959, 1587129226000, 0, N'Rejected', N'Biorad', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (43, 797, 2.15947, 1570635567000, 0, N'Finished', N'Ledetect', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (44, 176, 1.83925, 1598290780000, 0, N'Rejected', N'Ledetect', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (45, 258, 0.83208, 1590452300000, 0, N'Finished', N'Ledetect', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (46, 229, 1.91431, 1584132658000, 0, N'Rejected', N'Ledetect', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (47, 258, 1.14966, 1583956810000, 1, N'Finished', N'Biorad', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (48, 323, 0.87803, 1569362496000, 1, N'Rejected', N'Ledetect', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (49, 287, 0.5489, 1598878231000, 1, N'Rejected', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (50, 797, 1.84008, 1597810692000, 0, N'Rejected', N'Ledetect', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (52, 548, 2.77076, 1580365917000, 1, N'Finished', N'Biorad', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (53, 258, 2.35921, 1596623192000, 0, N'Finished', N'Ledetect', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (54, 258, 0.14068, 1578193821000, 0, N'Rejected', N'Ledetect', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (55, 855, 0.71921, 1588727049000, 1, N'Finished', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (56, 797, 0.90594, 1599181546000, 1, N'Finished', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (57, 176, 0.07803, 1577398479000, 0, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (58, 229, 0.13137, 1584435628000, 1, N'Finished', N'Biorad', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (59, 287, 2.38365, 1587180078000, 0, N'Finished', N'Ledetect', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (60, 176, 2.08968, 1599143088000, 0, N'Rejected', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (61, 548, 0.44258, 1582611140000, 1, N'Rejected', N'Biorad', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (62, 323, 2.72892, 1582631606000, 1, N'Finished', N'Ledetect', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (63, 287, 2.16161, 1595375219000, 0, N'Finished', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (64, 258, 0.85642, 1599046676000, 1, N'Rejected', N'Ledetect', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (65, 229, 1.181, 1587641214000, 1, N'Rejected', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (66, 323, 2.60852, 1598646451000, 1, N'Rejected', N'Biorad', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (67, 855, 2.26144, 1579845885000, 1, N'Finished', N'Ledetect', 33)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (68, 258, 0.29841, 1585748074000, 0, N'Finished', N'Biorad', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (69, 229, 2.86421, 1584160001000, 1, N'Rejected', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (70, 176, 1.77457, 1585023135000, 1, N'Finished', N'Ledetect', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (71, 258, 1.63399, 1587940223000, 1, N'Rejected', N'Ledetect', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (73, 548, 2.35757, 1572003273000, 0, N'Rejected', N'Biorad', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (74, 415, 2.63427, 1595630336000, 0, N'Finished', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (75, 229, 1.73988, 1577185408000, 1, N'Rejected', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (76, 548, 2.19045, 1587205395000, 0, N'Rejected', N'Ledetect', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (77, 258, 1.39743, 1580585080000, 1, N'Finished', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (78, 855, 0.20061, 1587458575000, 1, N'Rejected', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (79, 323, 1.74164, 1575715279000, 1, N'Finished', N'Ledetect', 73)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (80, 229, 0.38659, 1575395592000, 1, N'Rejected', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (81, 415, 0.17931, 1589218302000, 1, N'Finished', N'Biorad', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (82, 311, 1.44512, 1572605003000, 0, N'Rejected', N'Ledetect', 33)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (83, 229, 1.92224, 1579229910000, 0, N'Rejected', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (84, 311, 2.74916, 1568575884000, 1, N'Rejected', N'Ledetect', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (85, 797, 1.36314, 1584765062000, 0, N'Finished', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (86, 415, 2.83828, 1592539910000, 0, N'Rejected', N'Biorad', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (87, 548, 1.15453, 1573485850000, 0, N'Finished', N'Ledetect', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (88, 176, 0.56096, 1583200499000, 1, N'Rejected', N'Ledetect', 10)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (89, 548, 0.55271, 1570405789000, 1, N'Rejected', N'Ledetect', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (90, 415, 2.80377, 1591856497000, 0, N'Finished', N'Biorad', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (91, 287, 0.48404, 1591402737000, 1, N'Rejected', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (92, 258, 2.84165, 1586661073000, 1, N'Rejected', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (93, 323, 1.54082, 1574956862000, 0, N'Finished', N'Biorad', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (94, 176, 2.649, 1590961367000, 0, N'Finished', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (95, 797, 1.53309, 1586586168000, 1, N'Finished', N'Ledetect', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (96, 797, 2.97053, 1576246358000, 1, N'Finished', N'Biorad', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (97, 311, 2.72063, 1570771140000, 1, N'Finished', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (98, 855, 2.00579, 1592217329000, 1, N'Finished', N'Ledetect', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (99, 287, 0.77066, 1591090917000, 1, N'Rejected', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (100, 797, 0.31087, 1574480469000, 1, N'Rejected', N'Ledetect', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (101, 311, 1.44282, 1589313704000, 0, N'Rejected', N'Biorad', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (102, 311, 0.64779, 1573732952000, 0, N'Finished', N'Biorad', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (103, 287, 0.93109, 1596010421000, 0, N'Finished', N'Ledetect', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (104, 311, 0.97092, 1568922156000, 1, N'Rejected', N'Ledetect', 11)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (105, 229, 2.33872, 1577055118000, 0, N'Finished', N'Ledetect', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (106, 415, 0.22856, 1571065769000, 0, N'Finished', N'Biorad', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (107, 548, 0.5129, 1587188750000, 1, N'Finished', N'Ledetect', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (108, 548, 2.68928, 1589128865000, 1, N'Finished', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (109, 176, 2.69276, 1581375573000, 1, N'Rejected', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (110, 176, 2.35287, 1575314040000, 0, N'Finished', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (111, 311, 1.32579, 1573422322000, 0, N'Finished', N'Ledetect', 19)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (112, 415, 1.44393, 1581814586000, 0, N'Finished', N'Ledetect', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (113, 311, 2.31802, 1568414873000, 1, N'Finished', N'Biorad', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (114, 415, 1.48403, 1586702530000, 0, N'Rejected', N'Ledetect', 10)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (115, 258, 2.46256, 1581268255000, 0, N'Rejected', N'Ledetect', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (116, 548, 2.89404, 1582554773000, 0, N'Finished', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (117, 311, 1.89544, 1570766664000, 1, N'Rejected', N'Biorad', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (118, 855, 2.32994, 1574378562000, 1, N'Finished', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (119, 258, 1.22869, 1595140481000, 1, N'Rejected', N'Ledetect', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (120, 855, 0.03385, 1592299173000, 1, N'Rejected', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (121, 415, 0.07602, 1593361995000, 0, N'Rejected', N'Biorad', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (122, 258, 2.04526, 1598518413000, 0, N'Rejected', N'Ledetect', 61)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (124, 258, 2.74222, 1581060478000, 0, N'Finished', N'Ledetect', 46)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (125, 287, 2.21585, 1597433993000, 0, N'Rejected', N'Ledetect', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (127, 311, 1.82058, 1579760758000, 0, N'Rejected', N'Ledetect', 73)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (128, 229, 0.55726, 1584623704000, 0, N'Rejected', N'Ledetect', 10)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (129, 855, 1.60784, 1596593132000, 0, N'Rejected', N'Biorad', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (131, 229, 2.87543, 1591792518000, 1, N'Rejected', N'Biorad', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (132, 176, 0.25671, 1572556989000, 1, N'Rejected', N'Biorad', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (133, 548, 2.11533, 1574131565000, 1, N'Finished', N'Biorad', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (134, 311, 2.58633, 1593849915000, 0, N'Rejected', N'Ledetect', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (135, 415, 2.89733, 1592067675000, 1, N'Rejected', N'Ledetect', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (136, 548, 0.01918, 1583411846000, 1, N'Rejected', N'Biorad', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (137, 548, 2.77145, 1571174071000, 1, N'Rejected', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (138, 258, 0.07413, 1575172116000, 0, N'Rejected', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (140, 176, 1.50022, 1581445762000, 1, N'Rejected', N'Ledetect', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (141, 415, 0.16257, 1574770532000, 0, N'Rejected', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (142, 287, 2.60892, 1596514668000, 1, N'Finished', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (143, 176, 1.39236, 1594099160000, 1, N'Finished', N'Ledetect', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (144, 323, 2.29188, 1584909124000, 1, N'Finished', N'Ledetect', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (145, 855, 2.01419, 1585459825000, 1, N'Finished', N'Ledetect', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (146, 797, 2.74987, 1573207083000, 0, N'Finished', N'Ledetect', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (147, 548, 2.87971, 1593843772000, 1, N'Finished', N'Ledetect', 61)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (148, 548, 0.19352, 1570538306000, 0, N'Rejected', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (149, 229, 1.39579, 1583978371000, 0, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (150, 311, 0.50333, 1597475809000, 0, N'Rejected', N'Biorad', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (151, 323, 0.87121, 1584660322000, 1, N'Finished', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (152, 855, 0.05779, 1587883317000, 1, N'Finished', N'Ledetect', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (153, 176, 0.28212, 1568843181000, 0, N'Rejected', N'Biorad', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (154, 287, 1.64969, 1574770320000, 0, N'Finished', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (155, 548, 2.45323, 1588179491000, 1, N'Rejected', N'Biorad', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (156, 797, 2.36586, 1578691485000, 1, N'Rejected', N'Ledetect', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (157, 311, 1.88683, 1570339245000, 0, N'Rejected', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (158, 258, 0.96719, 1598197732000, 1, N'Finished', N'Biorad', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (159, 855, 0.71179, 1593048600000, 0, N'Rejected', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (161, 323, 1.18979, 1589046359000, 1, N'Rejected', N'Biorad', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (162, 287, 1.10467, 1587598655000, 0, N'Finished', N'Ledetect', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (163, 855, 1.46438, 1587719805000, 0, N'Finished', N'Biorad', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (164, 797, 1.10256, 1595412812000, 0, N'Finished', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (165, 229, 0.07709, 1596761700000, 0, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (166, 548, 0.77362, 1575208145000, 1, N'Rejected', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (167, 415, 2.0623, 1579872813000, 1, N'Finished', N'Ledetect', 48)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (168, 323, 0.36839, 1579648677000, 1, N'Rejected', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (169, 287, 1.30064, 1583565053000, 0, N'Finished', N'Biorad', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (170, 548, 1.94359, 1598598094000, 1, N'Rejected', N'Biorad', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (171, 415, 0.29474, 1569551597000, 1, N'Finished', N'Biorad', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (172, 311, 2.24139, 1594452237000, 0, N'Finished', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (173, 287, 0.21449, 1576129650000, 1, N'Rejected', N'Biorad', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (174, 311, 2.39705, 1587087170000, 0, N'Finished', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (175, 287, 1.94773, 1589735077000, 0, N'Finished', N'Ledetect', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (176, 311, 2.23857, 1574985856000, 0, N'Rejected', N'Ledetect', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (177, 258, 0.65236, 1588123211000, 1, N'Finished', N'Biorad', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (178, 229, 2.33878, 1577033257000, 1, N'Finished', N'Biorad', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (179, 797, 2.66386, 1595176579000, 1, N'Finished', N'Ledetect', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (181, 311, 1.02566, 1583530185000, 1, N'Finished', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (182, 548, 2.85782, 1581345483000, 1, N'Rejected', N'Biorad', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (183, 258, 0.05632, 1574051877000, 0, N'Finished', N'Biorad', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (184, 287, 0.27164, 1575014156000, 0, N'Rejected', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (185, 311, 1.41015, 1578173731000, 0, N'Rejected', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (186, 311, 2.33107, 1572220005000, 0, N'Finished', N'Ledetect', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (187, 176, 1.94988, 1590465224000, 1, N'Rejected', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (188, 415, 1.24511, 1583255765000, 0, N'Rejected', N'Biorad', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (189, 548, 1.74332, 1581978202000, 1, N'Finished', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (190, 855, 2.07596, 1584212278000, 0, N'Rejected', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (191, 311, 2.07388, 1572242735000, 1, N'Finished', N'Ledetect', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (192, 548, 2.59248, 1570263445000, 1, N'Finished', N'Biorad', 46)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (193, 258, 0.04706, 1594734608000, 1, N'Finished', N'Ledetect', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (194, 548, 0.16309, 1582192592000, 0, N'Finished', N'Biorad', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (195, 287, 1.23851, 1581399741000, 1, N'Rejected', N'Ledetect', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (196, 415, 2.72377, 1580791747000, 1, N'Rejected', N'Biorad', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (197, 176, 1.24071, 1577723623000, 1, N'Finished', N'Biorad', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (198, 229, 1.16842, 1574326035000, 1, N'Rejected', N'Biorad', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (199, 415, 1.74968, 1572922890000, 1, N'Finished', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (200, 258, 1.70379, 1574077739000, 0, N'Rejected', N'Ledetect', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (201, 323, 0.25892, 1586127833000, 0, N'Finished', N'Biorad', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (202, 311, 0.29801, 1583246483000, 1, N'Rejected', N'Biorad', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (203, 258, 0.07559, 1574293336000, 1, N'Finished', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (204, 415, 2.26218, 1590668027000, 0, N'Finished', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (205, 415, 1.77943, 1588100391000, 1, N'Rejected', N'Biorad', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (206, 229, 1.58448, 1593503767000, 1, N'Finished', N'Biorad', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (207, 229, 0.35711, 1580178305000, 0, N'Rejected', N'Biorad', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (208, 548, 2.15169, 1596929734000, 0, N'Finished', N'Biorad', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (209, 323, 0.59146, 1579655878000, 0, N'Rejected', N'Biorad', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (210, 229, 0.01244, 1599481650000, 1, N'Finished', N'Biorad', 5)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (211, 548, 1.41159, 1568630112000, 0, N'Finished', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (212, 548, 2.74665, 1584085624000, 1, N'Finished', N'Biorad', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (213, 855, 1.01367, 1579326836000, 1, N'Finished', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (214, 548, 1.49906, 1569221085000, 1, N'Finished', N'Biorad', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (215, 323, 2.04941, 1580221328000, 1, N'Finished', N'Ledetect', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (216, 176, 2.66389, 1596010874000, 0, N'Rejected', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (217, 229, 0.62648, 1574118535000, 0, N'Rejected', N'Biorad', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (218, 415, 1.06906, 1598715340000, 0, N'Rejected', N'Biorad', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (219, 415, 2.80156, 1582586831000, 1, N'Finished', N'Biorad', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (220, 323, 1.61243, 1594935076000, 0, N'Rejected', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (221, 287, 2.81479, 1578647960000, 0, N'Rejected', N'Biorad', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (222, 855, 1.88757, 1581874238000, 0, N'Rejected', N'Ledetect', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (223, 323, 0.32646, 1582694823000, 0, N'Finished', N'Biorad', 83)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (225, 323, 0.40255, 1573714159000, 0, N'Finished', N'Ledetect', 17)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (227, 323, 1.49287, 1590161036000, 1, N'Finished', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (228, 548, 1.69263, 1596884884000, 0, N'Rejected', N'Biorad', 32)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (229, 258, 1.70776, 1570197051000, 0, N'Finished', N'Biorad', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (230, 797, 2.85618, 1586903651000, 0, N'Rejected', N'Biorad', 83)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (231, 258, 1.37229, 1571510648000, 0, N'Finished', N'Biorad', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (232, 415, 0.5636, 1571802391000, 0, N'Finished', N'Biorad', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (235, 548, 1.89317, 1577679341000, 0, N'Finished', N'Biorad', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (236, 415, 0.33973, 1580245286000, 0, N'Rejected', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (237, 548, 0.59097, 1591563049000, 1, N'Rejected', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (238, 176, 1.05304, 1581103154000, 0, N'Finished', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (239, 323, 1.77131, 1583284246000, 0, N'Rejected', N'Biorad', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (240, 855, 1.66137, 1580425050000, 0, N'Finished', N'Biorad', 57)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (241, 258, 2.15787, 1578811693000, 0, N'Rejected', N'Biorad', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (242, 548, 0.05047, 1586531212000, 0, N'Finished', N'Ledetect', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (243, 311, 0.69041, 1587247374000, 1, N'Rejected', N'Biorad', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (245, 258, 1.69243, 1589581924000, 1, N'Rejected', N'Ledetect', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (246, 415, 1.02944, 1571563027000, 0, N'Rejected', N'Ledetect', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (247, 323, 1.54583, 1587290471000, 1, N'Rejected', N'Biorad', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (248, 176, 2.61539, 1575585541000, 0, N'Finished', N'Ledetect', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (250, 323, 0.0335, 1585509709000, 1, N'Finished', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (251, 287, 0.08174, 1581035773000, 0, N'Finished', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (252, 176, 0.82788, 1589777957000, 1, N'Finished', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (253, 229, 1.62146, 1580857193000, 1, N'Rejected', N'Ledetect', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (254, 415, 2.94514, 1596213252000, 0, N'Rejected', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (255, 229, 1.29101, 1588860569000, 0, N'Rejected', N'Biorad', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (256, 287, 0.40567, 1574263597000, 0, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (257, 258, 2.85615, 1590494507000, 0, N'Rejected', N'Biorad', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (259, 415, 0.13284, 1584697317000, 1, N'Rejected', N'Biorad', 83)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (260, 311, 0.5707, 1596968723000, 1, N'Rejected', N'Ledetect', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (261, 548, 2.67668, 1585932685000, 1, N'Rejected', N'Biorad', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (262, 311, 0.91438, 1593953543000, 0, N'Finished', N'Ledetect', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (263, 415, 2.92941, 1575629401000, 1, N'Rejected', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (264, 797, 2.01929, 1587269543000, 0, N'Rejected', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (265, 229, 2.54582, 1578939249000, 0, N'Rejected', N'Biorad', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (266, 258, 0.40538, 1582714708000, 1, N'Finished', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (267, 258, 1.60854, 1584341019000, 1, N'Rejected', N'Biorad', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (268, 797, 1.63651, 1584354301000, 0, N'Rejected', N'Biorad', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (269, 258, 1.46094, 1585874614000, 1, N'Rejected', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (270, 855, 0.88862, 1596881805000, 0, N'Rejected', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (271, 548, 2.42281, 1573588004000, 1, N'Rejected', N'Ledetect', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (272, 287, 1.84708, 1578033240000, 0, N'Finished', N'Ledetect', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (273, 415, 1.22672, 1587733431000, 0, N'Rejected', N'Ledetect', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (274, 548, 2.70527, 1577733718000, 1, N'Finished', N'Ledetect', 83)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (275, 797, 0.67313, 1576286554000, 0, N'Finished', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (276, 229, 1.36454, 1594535572000, 1, N'Rejected', N'Biorad', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (277, 311, 0.51654, 1584816420000, 1, N'Rejected', N'Biorad', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (278, 176, 0.67289, 1570154155000, 0, N'Finished', N'Ledetect', 100)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (279, 311, 0.46772, 1585319141000, 1, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (280, 323, 1.95328, 1583550257000, 1, N'Rejected', N'Ledetect', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (281, 229, 0.27074, 1577232635000, 1, N'Finished', N'Biorad', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (282, 176, 0.68085, 1576539441000, 0, N'Rejected', N'Ledetect', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (283, 311, 0.74859, 1577163516000, 1, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (285, 287, 2.45956, 1575594815000, 0, N'Finished', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (286, 176, 2.09713, 1574262505000, 0, N'Rejected', N'Biorad', 3)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (287, 415, 1.25788, 1584038814000, 1, N'Rejected', N'Biorad', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (288, 797, 2.25767, 1587406347000, 0, N'Rejected', N'Biorad', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (289, 287, 1.48827, 1591239484000, 0, N'Finished', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (290, 548, 2.72159, 1584897210000, 1, N'Finished', N'Ledetect', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (291, 311, 0.42651, 1596685049000, 0, N'Finished', N'Biorad', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (292, 287, 2.14838, 1570832718000, 1, N'Finished', N'Biorad', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (293, 176, 0.47508, 1572696538000, 1, N'Rejected', N'Ledetect', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (294, 258, 2.70343, 1589605641000, 1, N'Rejected', N'Ledetect', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (295, 855, 1.80649, 1581688502000, 0, N'Finished', N'Ledetect', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (296, 287, 0.4105, 1586543542000, 0, N'Finished', N'Biorad', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (297, 287, 0.85316, 1594977590000, 0, N'Finished', N'Ledetect', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (298, 323, 1.86878, 1582508788000, 0, N'Finished', N'Ledetect', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (299, 258, 0.28566, 1589199741000, 1, N'Finished', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (300, 548, 0.85214, 1596581504000, 1, N'Rejected', N'Ledetect', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (301, 287, 1.54591, 1596097912000, 0, N'Rejected', N'Biorad', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (303, 415, 1.33118, 1568643373000, 1, N'Rejected', N'Ledetect', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (304, 855, 0.77846, 1582599127000, 1, N'Finished', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (305, 855, 1.0936, 1574141491000, 0, N'Rejected', N'Ledetect', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (306, 323, 0.68632, 1592072729000, 1, N'Rejected', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (307, 323, 2.24064, 1579781486000, 0, N'Rejected', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (308, 287, 1.36177, 1588995579000, 0, N'Finished', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (309, 258, 0.86477, 1597788836000, 1, N'Rejected', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (310, 548, 0.23196, 1599075901000, 1, N'Finished', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (311, 548, 2.66849, 1599340038000, 0, N'Rejected', N'Biorad', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (312, 323, 2.56041, 1571055100000, 0, N'Finished', N'Biorad', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (313, 797, 2.84305, 1581341090000, 1, N'Rejected', N'Ledetect', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (314, 855, 0.20005, 1596529188000, 1, N'Finished', N'Biorad', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (316, 176, 1.69255, 1584696349000, 1, N'Finished', N'Biorad', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (317, 311, 1.94839, 1599918186000, 1, N'Rejected', N'Biorad', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (318, 797, 2.78229, 1589748297000, 0, N'Finished', N'Biorad', 59)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (319, 323, 0.87857, 1569618472000, 1, N'Rejected', N'Biorad', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (320, 287, 1.72594, 1588235197000, 1, N'Finished', N'Ledetect', 24)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (322, 258, 0.20758, 1572078427000, 0, N'Rejected', N'Ledetect', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (323, 797, 1.23825, 1575283519000, 0, N'Finished', N'Ledetect', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (324, 855, 0.89278, 1580706060000, 0, N'Finished', N'Ledetect', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (325, 415, 0.4775, 1577143830000, 1, N'Finished', N'Ledetect', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (326, 855, 0.75702, 1577271794000, 1, N'Rejected', N'Ledetect', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (327, 229, 2.51009, 1575646552000, 0, N'Finished', N'Biorad', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (328, 229, 2.59564, 1583227460000, 0, N'Finished', N'Biorad', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (329, 229, 0.5917, 1599012374000, 1, N'Finished', N'Biorad', 3)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (330, 287, 0.01967, 1598859800000, 0, N'Finished', N'Ledetect', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (331, 229, 0.04593, 1583683972000, 1, N'Rejected', N'Ledetect', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (332, 287, 2.47489, 1585378211000, 1, N'Rejected', N'Biorad', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (333, 176, 0.09417, 1568347392000, 0, N'Finished', N'Biorad', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (334, 287, 0.95537, 1574440949000, 1, N'Rejected', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (335, 323, 2.46171, 1589932414000, 1, N'Rejected', N'Ledetect', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (336, 415, 1.76231, 1588817347000, 0, N'Rejected', N'Biorad', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (337, 287, 0.99997, 1571652236000, 1, N'Rejected', N'Ledetect', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (338, 311, 1.60806, 1591978820000, 1, N'Rejected', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (339, 415, 2.86801, 1599295665000, 1, N'Rejected', N'Ledetect', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (340, 855, 1.39104, 1580004787000, 1, N'Finished', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (341, 176, 1.63287, 1574589867000, 0, N'Finished', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (342, 176, 1.12581, 1593044381000, 1, N'Finished', N'Ledetect', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (343, 855, 0.90379, 1589311939000, 1, N'Rejected', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (344, 323, 1.48959, 1569838650000, 1, N'Rejected', N'Ledetect', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (345, 258, 2.43021, 1572497409000, 0, N'Rejected', N'Biorad', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (346, 855, 1.99782, 1581274871000, 0, N'Finished', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (347, 258, 2.86474, 1589200816000, 1, N'Finished', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (348, 855, 0.19527, 1592550906000, 1, N'Rejected', N'Ledetect', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (349, 258, 1.73505, 1592358110000, 0, N'Finished', N'Biorad', 36)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (350, 311, 1.48003, 1587493203000, 0, N'Rejected', N'Biorad', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (351, 176, 2.07807, 1599504156000, 1, N'Finished', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (352, 323, 2.95037, 1587723876000, 0, N'Rejected', N'Ledetect', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (353, 258, 1.221, 1598024436000, 1, N'Finished', N'Biorad', 59)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (354, 311, 1.32855, 1572610681000, 0, N'Rejected', N'Biorad', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (355, 855, 0.81819, 1573197017000, 0, N'Finished', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (356, 415, 1.01426, 1583628546000, 0, N'Finished', N'Biorad', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (357, 797, 1.85915, 1569223579000, 1, N'Finished', N'Ledetect', 3)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (358, 855, 0.4165, 1589918921000, 0, N'Finished', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (359, 415, 1.62991, 1577769259000, 0, N'Rejected', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (360, 311, 1.97853, 1581885257000, 1, N'Finished', N'Ledetect', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (361, 311, 2.91601, 1583713460000, 1, N'Finished', N'Ledetect', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (362, 287, 0.5195, 1585811695000, 0, N'Finished', N'Biorad', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (363, 323, 1.30176, 1585779119000, 0, N'Finished', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (364, 229, 2.78509, 1588616536000, 0, N'Rejected', N'Ledetect', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (365, 229, 2.68625, 1587338437000, 0, N'Finished', N'Ledetect', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (366, 176, 0.16941, 1577236396000, 0, N'Rejected', N'Ledetect', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (367, 176, 1.82138, 1581588108000, 0, N'Finished', N'Biorad', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (368, 415, 0.53006, 1590865959000, 0, N'Finished', N'Ledetect', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (369, 229, 2.89096, 1576730339000, 1, N'Finished', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (370, 229, 1.58994, 1570513295000, 0, N'Finished', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (371, 548, 2.33253, 1593773829000, 0, N'Rejected', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (372, 415, 1.35958, 1593981151000, 1, N'Finished', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (373, 548, 0.12751, 1584483545000, 0, N'Finished', N'Ledetect', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (374, 311, 1.15287, 1593072915000, 0, N'Rejected', N'Biorad', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (375, 311, 1.18724, 1599723882000, 1, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (376, 287, 1.18479, 1572434104000, 0, N'Finished', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (378, 797, 1.36898, 1582725313000, 0, N'Finished', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (379, 176, 1.19626, 1595611027000, 0, N'Rejected', N'Ledetect', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (380, 415, 1.40735, 1579801562000, 0, N'Rejected', N'Ledetect', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (381, 323, 2.33934, 1588527240000, 1, N'Finished', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (382, 311, 2.17101, 1573794004000, 1, N'Finished', N'Ledetect', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (383, 855, 2.09461, 1589392265000, 1, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (384, 311, 0.45028, 1585302259000, 1, N'Finished', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (385, 258, 1.11557, 1593059404000, 1, N'Rejected', N'Biorad', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (386, 855, 1.50481, 1595156841000, 0, N'Rejected', N'Biorad', 57)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (387, 258, 2.05619, 1568416088000, 0, N'Finished', N'Ledetect', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (388, 548, 1.18646, 1589072634000, 0, N'Finished', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (389, 229, 2.32546, 1569407778000, 0, N'Finished', N'Biorad', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (390, 287, 1.84937, 1584503833000, 0, N'Rejected', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (391, 797, 1.04276, 1587737781000, 0, N'Rejected', N'Biorad', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (392, 176, 1.60881, 1576732220000, 1, N'Finished', N'Ledetect', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (393, 797, 0.11562, 1591172228000, 1, N'Finished', N'Biorad', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (394, 855, 0.3115, 1578836968000, 0, N'Rejected', N'Biorad', 73)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (395, 797, 1.36272, 1598132039000, 1, N'Finished', N'Biorad', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (396, 229, 2.67827, 1584428087000, 1, N'Rejected', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (398, 797, 1.66053, 1588047201000, 1, N'Rejected', N'Ledetect', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (399, 797, 0.16042, 1570919605000, 1, N'Finished', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (400, 855, 1.46856, 1569992126000, 1, N'Finished', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (401, 415, 0.63369, 1574121358000, 1, N'Rejected', N'Ledetect', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (402, 797, 0.19374, 1576787964000, 0, N'Rejected', N'Biorad', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (403, 855, 0.02675, 1583019086000, 0, N'Rejected', N'Biorad', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (404, 415, 0.38788, 1589997008000, 0, N'Rejected', N'Ledetect', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (405, 258, 1.88265, 1573065288000, 0, N'Rejected', N'Ledetect', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (406, 287, 2.88435, 1589539427000, 1, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (407, 797, 1.89262, 1569630635000, 1, N'Rejected', N'Ledetect', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (408, 229, 0.76167, 1599866935000, 1, N'Rejected', N'Ledetect', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (409, 176, 1.33248, 1581983034000, 0, N'Rejected', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (410, 287, 0.91192, 1573414681000, 0, N'Finished', N'Ledetect', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (411, 287, 2.1184, 1588090272000, 0, N'Rejected', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (412, 258, 1.93808, 1589703128000, 0, N'Finished', N'Ledetect', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (413, 415, 1.11245, 1579844009000, 1, N'Rejected', N'Ledetect', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (414, 548, 2.51972, 1579199222000, 1, N'Rejected', N'Ledetect', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (415, 548, 2.04021, 1572037872000, 0, N'Finished', N'Ledetect', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (416, 323, 2.51944, 1595318873000, 0, N'Finished', N'Biorad', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (417, 311, 0.56976, 1571546965000, 0, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (418, 797, 0.9311, 1585116287000, 0, N'Rejected', N'Ledetect', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (419, 258, 1.91176, 1593267066000, 1, N'Rejected', N'Biorad', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (420, 415, 0.74392, 1582993944000, 1, N'Finished', N'Ledetect', 33)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (421, 287, 0.65703, 1573876368000, 1, N'Finished', N'Ledetect', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (422, 323, 0.01138, 1575539131000, 1, N'Rejected', N'Ledetect', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (423, 797, 2.41606, 1583024410000, 0, N'Finished', N'Ledetect', 24)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (424, 258, 2.74475, 1586098477000, 1, N'Finished', N'Biorad', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (425, 287, 1.94802, 1573422454000, 0, N'Finished', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (426, 797, 0.29993, 1573403069000, 1, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (427, 548, 2.57271, 1599609193000, 0, N'Finished', N'Biorad', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (428, 176, 0.64655, 1584156421000, 1, N'Finished', N'Ledetect', 61)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (429, 323, 1.46641, 1588992567000, 1, N'Rejected', N'Biorad', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (430, 855, 0.41263, 1572686042000, 0, N'Rejected', N'Ledetect', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (431, 548, 1.42921, 1597096605000, 0, N'Finished', N'Biorad', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (432, 415, 2.36233, 1572474199000, 0, N'Finished', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (433, 258, 2.13273, 1585203728000, 1, N'Rejected', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (434, 229, 2.57252, 1582521079000, 0, N'Rejected', N'Ledetect', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (435, 258, 2.90278, 1585600014000, 1, N'Finished', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (436, 323, 0.67525, 1585811086000, 1, N'Finished', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (437, 323, 2.92855, 1584192752000, 1, N'Finished', N'Biorad', 59)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (438, 323, 2.58071, 1588837389000, 1, N'Finished', N'Biorad', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (439, 855, 1.40477, 1583864142000, 0, N'Rejected', N'Biorad', 73)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (440, 287, 1.32297, 1569625867000, 1, N'Finished', N'Ledetect', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (441, 311, 2.10327, 1591623256000, 1, N'Finished', N'Biorad', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (442, 855, 0.72348, 1573430199000, 0, N'Rejected', N'Biorad', 74)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (443, 229, 0.43683, 1583238310000, 1, N'Rejected', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (444, 415, 2.60903, 1568687619000, 0, N'Finished', N'Biorad', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (445, 311, 1.67921, 1584033863000, 0, N'Finished', N'Biorad', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (446, 415, 0.77765, 1589756737000, 0, N'Finished', N'Biorad', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (447, 855, 0.75877, 1574557892000, 0, N'Finished', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (448, 229, 1.11052, 1583808817000, 1, N'Finished', N'Biorad', 19)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (449, 855, 2.76873, 1587219244000, 1, N'Finished', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (451, 323, 1.51707, 1592262671000, 0, N'Rejected', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (452, 415, 0.14364, 1583119406000, 1, N'Rejected', N'Biorad', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (453, 548, 2.19149, 1585442648000, 1, N'Finished', N'Biorad', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (454, 855, 2.77988, 1576288539000, 1, N'Rejected', N'Ledetect', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (455, 548, 2.03607, 1582803106000, 1, N'Finished', N'Biorad', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (456, 258, 1.26363, 1583961328000, 0, N'Rejected', N'Ledetect', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (457, 258, 2.77258, 1582979129000, 0, N'Finished', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (458, 855, 2.19905, 1589712019000, 1, N'Finished', N'Ledetect', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (459, 311, 0.43008, 1576805791000, 1, N'Finished', N'Ledetect', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (460, 287, 2.03143, 1599162634000, 0, N'Finished', N'Biorad', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (461, 323, 0.67569, 1572224316000, 1, N'Rejected', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (462, 176, 0.30138, 1578662723000, 0, N'Rejected', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (463, 797, 1.09713, 1597250533000, 0, N'Finished', N'Ledetect', 19)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (464, 548, 1.86013, 1580141578000, 1, N'Rejected', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (465, 323, 0.46993, 1598805765000, 0, N'Rejected', N'Biorad', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (466, 311, 1.97305, 1588488066000, 0, N'Rejected', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (467, 323, 0.52738, 1577767272000, 0, N'Rejected', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (468, 176, 0.07092, 1574712941000, 0, N'Finished', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (469, 797, 1.85301, 1589707928000, 1, N'Rejected', N'Ledetect', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (470, 548, 1.08384, 1575874713000, 0, N'Finished', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (471, 176, 1.53611, 1598255709000, 0, N'Rejected', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (472, 287, 0.75808, 1588378376000, 0, N'Rejected', N'Biorad', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (473, 797, 0.09086, 1577465658000, 1, N'Finished', N'Biorad', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (474, 287, 1.71086, 1597464403000, 0, N'Finished', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (475, 311, 2.99575, 1592345115000, 1, N'Rejected', N'Biorad', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (476, 548, 0.04854, 1585218873000, 1, N'Finished', N'Biorad', 36)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (477, 855, 0.90845, 1576704070000, 1, N'Finished', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (478, 415, 0.6654, 1579592820000, 1, N'Rejected', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (479, 548, 2.15148, 1585816960000, 1, N'Finished', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (480, 323, 1.84229, 1572853912000, 0, N'Finished', N'Ledetect', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (481, 229, 2.1731, 1582878540000, 0, N'Finished', N'Biorad', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (482, 548, 1.72447, 1583183760000, 0, N'Rejected', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (483, 176, 2.77077, 1594459682000, 0, N'Rejected', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (484, 176, 2.89261, 1587323970000, 0, N'Finished', N'Ledetect', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (485, 287, 2.29432, 1597961422000, 0, N'Finished', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (486, 855, 1.72742, 1581981122000, 0, N'Finished', N'Ledetect', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (487, 287, 2.27476, 1583456902000, 0, N'Rejected', N'Biorad', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (488, 176, 1.57217, 1582442362000, 0, N'Rejected', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (489, 311, 2.05232, 1580093658000, 1, N'Rejected', N'Ledetect', 48)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (490, 797, 1.30257, 1582184589000, 0, N'Finished', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (491, 176, 0.14365, 1583716962000, 1, N'Finished', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (492, 287, 1.55506, 1574916683000, 1, N'Finished', N'Biorad', 48)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (493, 287, 1.86965, 1586901419000, 0, N'Finished', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (494, 415, 0.54532, 1568461355000, 0, N'Finished', N'Biorad', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (495, 855, 1.75999, 1586525351000, 1, N'Finished', N'Ledetect', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (496, 258, 0.90159, 1587442992000, 1, N'Rejected', N'Biorad', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (497, 311, 1.47845, 1587067714000, 0, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (498, 323, 1.39738, 1591930545000, 0, N'Rejected', N'Biorad', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (499, 797, 0.51001, 1569659879000, 0, N'Finished', N'Biorad', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (500, 548, 0.95381, 1579476109000, 1, N'Rejected', N'Ledetect', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (501, 323, 1.16215, 1588086163000, 1, N'Rejected', N'Ledetect', 32)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (502, 323, 0.09628, 1596738506000, 1, N'Rejected', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (503, 415, 2.13286, 1573766700000, 0, N'Finished', N'Biorad', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (504, 323, 1.06449, 1586691382000, 0, N'Finished', N'Ledetect', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (505, 311, 0.63576, 1579146963000, 1, N'Rejected', N'Ledetect', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (507, 855, 0.61745, 1599480035000, 0, N'Finished', N'Biorad', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (508, 311, 2.26483, 1582056730000, 0, N'Rejected', N'Ledetect', 74)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (509, 548, 1.49164, 1592385024000, 0, N'Finished', N'Ledetect', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (510, 176, 0.3375, 1573900196000, 0, N'Finished', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (511, 229, 2.45448, 1574085819000, 0, N'Rejected', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (512, 287, 0.43806, 1579650499000, 1, N'Rejected', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (513, 797, 0.89628, 1599161295000, 1, N'Rejected', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (514, 855, 1.77968, 1574414858000, 0, N'Rejected', N'Ledetect', 33)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (515, 548, 2.33285, 1576853489000, 0, N'Finished', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (516, 415, 0.6954, 1596009489000, 0, N'Rejected', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (517, 797, 1.52848, 1583229212000, 1, N'Rejected', N'Biorad', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (518, 323, 0.79853, 1571529029000, 1, N'Finished', N'Ledetect', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (519, 311, 1.19252, 1593699459000, 1, N'Finished', N'Biorad', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (520, 855, 1.03046, 1579451680000, 1, N'Rejected', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (521, 855, 0.11505, 1598719314000, 1, N'Rejected', N'Ledetect', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (523, 258, 2.56747, 1576645637000, 1, N'Rejected', N'Biorad', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (525, 415, 0.86579, 1591349860000, 1, N'Rejected', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (526, 176, 2.14783, 1582541932000, 0, N'Rejected', N'Biorad', 48)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (527, 323, 2.1037, 1583703537000, 0, N'Rejected', N'Biorad', 18)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (528, 548, 1.68514, 1593180226000, 0, N'Finished', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (529, 548, 1.91283, 1595362141000, 0, N'Rejected', N'Ledetect', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (530, 258, 2.83875, 1589780841000, 1, N'Rejected', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (531, 855, 2.41714, 1577602270000, 1, N'Finished', N'Biorad', 100)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (532, 258, 1.90761, 1588251777000, 0, N'Rejected', N'Biorad', 23)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (533, 548, 0.15789, 1584736108000, 1, N'Rejected', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (534, 258, 2.59998, 1570672651000, 1, N'Rejected', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (535, 311, 0.68672, 1596015782000, 1, N'Rejected', N'Ledetect', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (536, 258, 1.40541, 1569350416000, 0, N'Finished', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (537, 258, 1.55404, 1580500031000, 1, N'Rejected', N'Ledetect', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (538, 855, 2.58414, 1571067196000, 1, N'Finished', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (539, 797, 1.50976, 1596298385000, 1, N'Finished', N'Ledetect', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (540, 855, 2.11685, 1597338183000, 1, N'Finished', N'Biorad', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (541, 229, 1.97449, 1585985654000, 1, N'Rejected', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (542, 797, 0.41129, 1584152155000, 0, N'Rejected', N'Biorad', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (543, 287, 2.00003, 1597635594000, 0, N'Rejected', N'Ledetect', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (544, 855, 0.31038, 1590284510000, 1, N'Rejected', N'Biorad', 46)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (545, 323, 2.85504, 1589204634000, 1, N'Rejected', N'Ledetect', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (546, 548, 0.62443, 1586221735000, 1, N'Rejected', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (547, 229, 1.18031, 1591711313000, 1, N'Finished', N'Ledetect', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (548, 855, 1.75897, 1571198340000, 1, N'Finished', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (549, 176, 2.17628, 1592893850000, 0, N'Finished', N'Biorad', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (550, 855, 1.86042, 1585872982000, 1, N'Finished', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (552, 287, 2.92189, 1578497625000, 1, N'Finished', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (553, 176, 2.093, 1591446076000, 1, N'Finished', N'Biorad', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (555, 323, 1.61795, 1585912315000, 1, N'Rejected', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (556, 855, 0.51931, 1588409973000, 1, N'Rejected', N'Biorad', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (557, 323, 2.62203, 1583363195000, 1, N'Rejected', N'Biorad', 73)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (558, 548, 2.98807, 1570861941000, 1, N'Finished', N'Ledetect', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (559, 415, 1.73461, 1599448633000, 0, N'Finished', N'Ledetect', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (560, 311, 0.887, 1584016372000, 1, N'Finished', N'Biorad', 19)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (561, 287, 2.87576, 1595182325000, 1, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (562, 229, 2.87975, 1573212125000, 1, N'Finished', N'Biorad', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (563, 258, 1.16841, 1595063840000, 0, N'Finished', N'Biorad', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (564, 323, 2.90835, 1597259087000, 0, N'Rejected', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (565, 287, 0.08631, 1599046315000, 0, N'Finished', N'Ledetect', 57)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (566, 287, 0.35615, 1578475925000, 0, N'Finished', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (567, 258, 2.77145, 1569761608000, 0, N'Rejected', N'Biorad', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (568, 548, 1.12394, 1595800067000, 1, N'Rejected', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (569, 415, 2.34019, 1595061685000, 1, N'Finished', N'Biorad', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (570, 323, 1.96044, 1582942058000, 1, N'Finished', N'Biorad', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (572, 797, 2.33723, 1595454107000, 0, N'Finished', N'Ledetect', 17)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (573, 323, 2.63124, 1598442294000, 1, N'Rejected', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (574, 229, 0.00699, 1586892624000, 1, N'Finished', N'Biorad', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (575, 176, 2.08269, 1587597650000, 1, N'Finished', N'Ledetect', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (576, 855, 1.92749, 1591642537000, 0, N'Finished', N'Biorad', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (577, 258, 0.39536, 1593125836000, 0, N'Rejected', N'Biorad', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (578, 311, 0.77022, 1589457295000, 0, N'Finished', N'Biorad', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (579, 548, 0.05415, 1592119663000, 1, N'Finished', N'Biorad', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (580, 415, 1.67543, 1588000406000, 1, N'Finished', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (581, 855, 1.06359, 1585639355000, 1, N'Rejected', N'Ledetect', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (582, 258, 0.5682, 1580455013000, 0, N'Rejected', N'Biorad', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (583, 323, 0.60316, 1578396620000, 1, N'Rejected', N'Ledetect', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (584, 258, 1.64459, 1583416854000, 0, N'Finished', N'Biorad', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (585, 311, 2.11552, 1571543004000, 0, N'Finished', N'Ledetect', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (586, 311, 1.08605, 1569702625000, 0, N'Rejected', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (587, 548, 0.42607, 1589289260000, 1, N'Rejected', N'Ledetect', 19)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (588, 229, 1.68505, 1573279372000, 1, N'Finished', N'Biorad', 10)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (589, 229, 0.67762, 1597328730000, 1, N'Finished', N'Biorad', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (590, 797, 1.10988, 1595411282000, 1, N'Finished', N'Biorad', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (591, 258, 2.84404, 1591764145000, 1, N'Finished', N'Biorad', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (592, 229, 2.05051, 1599456601000, 0, N'Finished', N'Ledetect', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (593, 311, 0.70952, 1571637752000, 0, N'Rejected', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (594, 548, 1.98538, 1585873834000, 0, N'Finished', N'Biorad', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (595, 415, 2.74312, 1596927044000, 0, N'Finished', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (596, 323, 1.37275, 1591079079000, 1, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (597, 797, 2.45547, 1590655601000, 0, N'Finished', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (598, 176, 0.06332, 1580421047000, 0, N'Finished', N'Biorad', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (599, 311, 2.25644, 1569232216000, 0, N'Rejected', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (600, 797, 0.99956, 1592421217000, 1, N'Rejected', N'Ledetect', 89)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (601, 323, 1.97997, 1577131876000, 1, N'Rejected', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (602, 797, 0.62586, 1591812705000, 0, N'Rejected', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (603, 311, 2.50936, 1578016123000, 1, N'Finished', N'Biorad', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (604, 229, 0.42118, 1576418474000, 0, N'Rejected', N'Biorad', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (605, 323, 1.66008, 1577343171000, 1, N'Finished', N'Biorad', 3)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (606, 311, 1.28661, 1572936572000, 0, N'Finished', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (607, 855, 2.53665, 1596668177000, 0, N'Rejected', N'Ledetect', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (608, 229, 1.86181, 1578884364000, 0, N'Rejected', N'Biorad', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (609, 797, 2.08961, 1579361253000, 1, N'Rejected', N'Ledetect', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (610, 229, 1.75727, 1580300243000, 1, N'Finished', N'Biorad', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (611, 855, 2.33901, 1596787744000, 1, N'Finished', N'Biorad', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (612, 855, 1.58911, 1569950765000, 1, N'Rejected', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (613, 415, 0.74357, 1597001737000, 1, N'Rejected', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (614, 548, 0.52296, 1576757777000, 1, N'Rejected', N'Biorad', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (615, 415, 2.0293, 1594361455000, 1, N'Finished', N'Biorad', 3)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (616, 176, 1.76644, 1595893264000, 0, N'Finished', N'Ledetect', 74)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (617, 415, 0.34187, 1590265337000, 1, N'Finished', N'Biorad', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (619, 287, 2.69895, 1581863890000, 0, N'Rejected', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (621, 415, 1.98651, 1594223371000, 1, N'Rejected', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (622, 855, 0.61537, 1590555423000, 0, N'Rejected', N'Biorad', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (623, 176, 1.49506, 1585123124000, 1, N'Finished', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (624, 323, 2.49659, 1592143993000, 1, N'Rejected', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (625, 311, 1.03783, 1579254566000, 1, N'Rejected', N'Biorad', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (626, 797, 0.56864, 1579879982000, 0, N'Rejected', N'Biorad', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (627, 855, 2.1726, 1579722111000, 0, N'Finished', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (628, 229, 1.43787, 1572700336000, 0, N'Finished', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (629, 323, 0.76371, 1576504489000, 1, N'Rejected', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (630, 176, 1.92317, 1579639211000, 0, N'Rejected', N'Biorad', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (631, 176, 0.12716, 1598679918000, 0, N'Finished', N'Ledetect', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (632, 797, 1.1244, 1570872505000, 1, N'Finished', N'Ledetect', 47)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (633, 855, 1.06763, 1583524926000, 0, N'Finished', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (634, 415, 0.28188, 1595304224000, 0, N'Rejected', N'Biorad', 32)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (635, 311, 0.13942, 1586774402000, 1, N'Finished', N'Biorad', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (636, 229, 1.88847, 1585950523000, 0, N'Finished', N'Ledetect', 3)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (637, 229, 1.88651, 1591869309000, 0, N'Rejected', N'Biorad', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (638, 855, 0.80647, 1571958584000, 1, N'Finished', N'Biorad', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (639, 258, 1.93792, 1574608932000, 1, N'Finished', N'Biorad', 57)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (640, 229, 1.20247, 1576635646000, 0, N'Finished', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (641, 323, 2.64429, 1596451118000, 1, N'Rejected', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (642, 176, 1.26459, 1572667045000, 0, N'Finished', N'Biorad', 59)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (643, 548, 2.46307, 1588923823000, 1, N'Rejected', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (644, 311, 2.72639, 1598020141000, 1, N'Finished', N'Ledetect', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (646, 548, 1.99343, 1595542223000, 1, N'Finished', N'Ledetect', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (647, 323, 2.18859, 1590494752000, 0, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (648, 176, 2.51641, 1580787337000, 0, N'Finished', N'Ledetect', 74)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (649, 855, 0.15631, 1576181833000, 1, N'Rejected', N'Ledetect', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (650, 855, 2.13622, 1572770327000, 1, N'Finished', N'Biorad', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (651, 548, 0.65959, 1591176214000, 1, N'Rejected', N'Ledetect', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (652, 287, 0.82385, 1597310801000, 1, N'Finished', N'Biorad', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (653, 797, 0.08578, 1582411398000, 1, N'Rejected', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (654, 855, 0.86251, 1575269366000, 1, N'Finished', N'Biorad', 36)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (655, 311, 2.81639, 1573084566000, 1, N'Rejected', N'Ledetect', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (656, 229, 1.23186, 1596846303000, 0, N'Rejected', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (657, 415, 2.94831, 1578486970000, 0, N'Rejected', N'Biorad', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (658, 415, 0.67448, 1574205575000, 1, N'Rejected', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (659, 855, 2.87521, 1583991553000, 0, N'Rejected', N'Ledetect', 33)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (660, 855, 2.89405, 1581282978000, 1, N'Finished', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (661, 548, 0.6669, 1580387299000, 1, N'Finished', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (662, 323, 1.12045, 1578452951000, 0, N'Finished', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (663, 855, 0.63391, 1575627090000, 1, N'Finished', N'Ledetect', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (664, 229, 0.8041, 1576886750000, 0, N'Rejected', N'Biorad', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (665, 176, 1.39983, 1580867363000, 1, N'Rejected', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (666, 323, 1.08035, 1599930572000, 0, N'Rejected', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (667, 229, 0.51353, 1568855649000, 0, N'Finished', N'Biorad', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (668, 311, 0.5161, 1579407816000, 1, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (669, 258, 1.54576, 1594636344000, 1, N'Finished', N'Biorad', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (670, 176, 0.29065, 1595639455000, 0, N'Finished', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (671, 287, 0.16852, 1582605220000, 1, N'Finished', N'Ledetect', 78)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (672, 287, 1.59455, 1584328973000, 0, N'Finished', N'Ledetect', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (673, 258, 1.99005, 1591667257000, 1, N'Rejected', N'Ledetect', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (674, 797, 2.47252, 1596084570000, 1, N'Finished', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (675, 855, 2.10862, 1575317881000, 1, N'Rejected', N'Biorad', 61)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (676, 415, 0.60164, 1576798268000, 0, N'Rejected', N'Biorad', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (677, 176, 2.59211, 1589367151000, 0, N'Finished', N'Biorad', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (678, 258, 0.53433, 1586952649000, 0, N'Finished', N'Ledetect', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (679, 311, 2.67632, 1596743265000, 0, N'Finished', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (680, 176, 0.05412, 1584784874000, 0, N'Rejected', N'Biorad', 10)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (681, 176, 1.28803, 1577171684000, 0, N'Rejected', N'Ledetect', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (682, 176, 0.54364, 1596999165000, 0, N'Rejected', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (683, 229, 0.10601, 1584728578000, 1, N'Rejected', N'Biorad', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (684, 797, 1.58026, 1588383056000, 1, N'Rejected', N'Biorad', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (686, 176, 1.98056, 1575840226000, 0, N'Rejected', N'Ledetect', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (687, 229, 1.69325, 1579835096000, 1, N'Rejected', N'Ledetect', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (688, 229, 1.06345, 1590008613000, 0, N'Rejected', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (689, 311, 2.0473, 1571512996000, 0, N'Finished', N'Ledetect', 78)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (690, 287, 1.97022, 1582320983000, 1, N'Finished', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (692, 176, 1.19701, 1590167889000, 1, N'Rejected', N'Biorad', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (694, 797, 1.69183, 1581245496000, 1, N'Finished', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (695, 258, 1.802, 1582762918000, 1, N'Rejected', N'Biorad', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (696, 229, 2.13759, 1577056991000, 1, N'Finished', N'Ledetect', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (697, 415, 0.10253, 1575557750000, 0, N'Finished', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (698, 258, 1.23299, 1576493110000, 1, N'Finished', N'Biorad', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (699, 415, 0.00434, 1594857897000, 1, N'Rejected', N'Ledetect', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (700, 258, 1.25579, 1591219272000, 1, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (701, 855, 0.28457, 1579120548000, 1, N'Finished', N'Ledetect', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (702, 287, 2.62738, 1592314598000, 1, N'Rejected', N'Ledetect', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (703, 258, 1.94033, 1583157517000, 0, N'Finished', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (704, 323, 1.05271, 1576467658000, 1, N'Finished', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (705, 797, 1.08193, 1585417076000, 0, N'Finished', N'Biorad', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (706, 855, 0.70149, 1571142754000, 0, N'Rejected', N'Ledetect', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (707, 548, 0.21615, 1592026770000, 1, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (708, 258, 1.93572, 1569698491000, 1, N'Finished', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (709, 548, 0.80837, 1589071062000, 1, N'Rejected', N'Ledetect', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (710, 258, 2.55405, 1591549116000, 0, N'Rejected', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (712, 548, 0.20818, 1590587868000, 0, N'Rejected', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (713, 311, 0.40765, 1596905567000, 1, N'Finished', N'Ledetect', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (714, 323, 0.31461, 1573497826000, 1, N'Finished', N'Biorad', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (715, 258, 2.35953, 1583586440000, 1, N'Rejected', N'Ledetect', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (716, 229, 1.83452, 1572023723000, 0, N'Finished', N'Biorad', 61)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (717, 855, 2.74615, 1591163700000, 1, N'Finished', N'Biorad', 5)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (718, 797, 2.46202, 1597581185000, 0, N'Finished', N'Ledetect', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (719, 229, 1.91684, 1587172607000, 0, N'Finished', N'Ledetect', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (720, 311, 2.02138, 1597011859000, 1, N'Finished', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (721, 229, 1.67165, 1594538212000, 1, N'Finished', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (722, 548, 2.24494, 1571188100000, 0, N'Rejected', N'Ledetect', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (723, 323, 0.07958, 1576024276000, 0, N'Rejected', N'Biorad', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (725, 229, 0.48411, 1573945567000, 0, N'Rejected', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (726, 176, 0.61771, 1568368054000, 0, N'Rejected', N'Biorad', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (727, 415, 1.70152, 1572120213000, 1, N'Finished', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (728, 176, 1.87947, 1576442895000, 1, N'Finished', N'Ledetect', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (729, 311, 2.35935, 1583563608000, 1, N'Rejected', N'Ledetect', 21)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (730, 287, 0.32387, 1589800191000, 0, N'Rejected', N'Biorad', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (732, 287, 0.35227, 1598981535000, 0, N'Rejected', N'Biorad', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (733, 797, 1.49282, 1589590473000, 1, N'Rejected', N'Ledetect', 78)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (734, 323, 1.47678, 1571458828000, 0, N'Rejected', N'Biorad', 94)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (735, 323, 0.63891, 1590133073000, 1, N'Rejected', N'Ledetect', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (736, 855, 0.22816, 1580683084000, 1, N'Finished', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (737, 258, 1.15971, 1572474590000, 0, N'Finished', N'Ledetect', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (738, 797, 2.40651, 1589049527000, 1, N'Rejected', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (739, 287, 2.24137, 1598290376000, 1, N'Rejected', N'Ledetect', 20)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (740, 855, 0.06387, 1585842331000, 0, N'Rejected', N'Ledetect', 59)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (741, 287, 1.78253, 1577375928000, 0, N'Finished', N'Biorad', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (742, 548, 0.61556, 1587110833000, 1, N'Finished', N'Ledetect', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (743, 797, 0.79233, 1570211520000, 1, N'Finished', N'Biorad', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (744, 415, 2.74649, 1577743967000, 0, N'Rejected', N'Biorad', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (745, 855, 1.20551, 1592083537000, 0, N'Rejected', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (746, 548, 2.51248, 1579216357000, 1, N'Finished', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (747, 229, 1.39324, 1573858051000, 0, N'Finished', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (748, 229, 2.23894, 1579063416000, 1, N'Rejected', N'Ledetect', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (749, 797, 2.21678, 1598478384000, 1, N'Rejected', N'Ledetect', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (750, 415, 2.27146, 1570356380000, 1, N'Finished', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (751, 548, 2.05213, 1596740568000, 1, N'Finished', N'Ledetect', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (753, 548, 1.91599, 1582811578000, 1, N'Rejected', N'Biorad', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (754, 855, 1.44473, 1598946586000, 1, N'Finished', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (755, 287, 0.02131, 1580092500000, 0, N'Rejected', N'Ledetect', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (756, 855, 0.98537, 1577554993000, 0, N'Rejected', N'Ledetect', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (758, 415, 0.51072, 1597139132000, 0, N'Rejected', N'Biorad', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (759, 323, 0.7553, 1599520307000, 1, N'Rejected', N'Ledetect', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (760, 855, 2.61943, 1586896060000, 1, N'Finished', N'Ledetect', 71)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (761, 311, 1.76903, 1583681545000, 1, N'Rejected', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (762, 229, 0.60488, 1585481607000, 0, N'Finished', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (763, 176, 1.97719, 1569653646000, 1, N'Finished', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (764, 323, 1.391, 1568943068000, 0, N'Rejected', N'Biorad', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (765, 311, 1.96395, 1591990993000, 1, N'Finished', N'Biorad', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (766, 229, 2.03343, 1584870747000, 1, N'Rejected', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (767, 229, 1.76449, 1572965340000, 1, N'Rejected', N'Biorad', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (768, 258, 2.57927, 1574419497000, 0, N'Finished', N'Biorad', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (769, 176, 0.63848, 1595737655000, 1, N'Rejected', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (770, 415, 2.342, 1574778252000, 1, N'Rejected', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (771, 323, 2.37697, 1598026480000, 0, N'Finished', N'Ledetect', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (772, 258, 0.55111, 1576948320000, 0, N'Finished', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (773, 176, 1.00535, 1572786228000, 1, N'Finished', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (774, 323, 1.49149, 1582305975000, 1, N'Rejected', N'Ledetect', 100)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (775, 548, 2.08736, 1578999406000, 0, N'Finished', N'Biorad', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (776, 229, 2.40679, 1587828423000, 1, N'Finished', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (777, 548, 0.46186, 1593220044000, 0, N'Finished', N'Biorad', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (778, 176, 2.72041, 1595052690000, 1, N'Rejected', N'Biorad', 78)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (779, 797, 1.04187, 1586000872000, 0, N'Rejected', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (780, 229, 2.39947, 1579693289000, 1, N'Finished', N'Ledetect', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (781, 176, 2.29182, 1589214084000, 1, N'Finished', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (782, 176, 0.47844, 1591935064000, 1, N'Rejected', N'Ledetect', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (783, 415, 1.09916, 1599047278000, 0, N'Rejected', N'Ledetect', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (784, 415, 2.29475, 1581736907000, 1, N'Rejected', N'Biorad', 100)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (785, 229, 2.26981, 1573624850000, 0, N'Rejected', N'Ledetect', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (786, 176, 2.86649, 1597034233000, 1, N'Rejected', N'Ledetect', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (787, 229, 2.34015, 1588324779000, 0, N'Rejected', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (788, 323, 2.59154, 1577877745000, 1, N'Finished', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (789, 855, 1.69462, 1597231027000, 0, N'Finished', N'Ledetect', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (790, 258, 0.20462, 1582691079000, 0, N'Rejected', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (791, 855, 2.72937, 1586049376000, 0, N'Rejected', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (792, 548, 0.51686, 1580624531000, 1, N'Finished', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (793, 229, 0.36286, 1584056165000, 0, N'Finished', N'Ledetect', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (794, 176, 0.33332, 1592538237000, 1, N'Finished', N'Ledetect', 70)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (795, 797, 1.99265, 1587820551000, 1, N'Finished', N'Ledetect', 95)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (797, 258, 0.19771, 1587562956000, 1, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (798, 323, 0.47916, 1579499840000, 0, N'Finished', N'Biorad', 61)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (799, 287, 2.23048, 1585417930000, 1, N'Finished', N'Biorad', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (800, 176, 1.32718, 1584393975000, 1, N'Rejected', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (801, 415, 2.97655, 1575626202000, 0, N'Rejected', N'Ledetect', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (802, 258, 0.05993, 1580338585000, 1, N'Rejected', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (803, 176, 0.16855, 1598761152000, 0, N'Rejected', N'Biorad', 57)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (804, 855, 0.73257, 1581841095000, 0, N'Finished', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (805, 548, 2.92464, 1570751383000, 1, N'Finished', N'Ledetect', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (806, 548, 0.54148, 1576227451000, 0, N'Rejected', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (807, 229, 2.72432, 1589212010000, 1, N'Finished', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (808, 176, 1.51331, 1590397735000, 0, N'Finished', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (809, 258, 1.51457, 1592550362000, 0, N'Rejected', N'Ledetect', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (811, 797, 0.88406, 1569054688000, 1, N'Rejected', N'Ledetect', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (812, 287, 0.33026, 1584766972000, 1, N'Rejected', N'Ledetect', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (813, 258, 2.98852, 1582754714000, 0, N'Finished', N'Biorad', 74)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (814, 855, 1.68717, 1569451633000, 0, N'Rejected', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (815, 311, 0.621, 1577687907000, 1, N'Rejected', N'Biorad', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (816, 287, 0.11063, 1575974597000, 0, N'Finished', N'Biorad', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (817, 258, 1.67357, 1594664062000, 1, N'Finished', N'Biorad', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (818, 311, 2.99967, 1594699480000, 0, N'Rejected', N'Biorad', 53)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (819, 548, 0.9905, 1581923117000, 0, N'Finished', N'Biorad', 39)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (820, 176, 2.67893, 1584834959000, 1, N'Rejected', N'Ledetect', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (821, 311, 1.94393, 1592937434000, 0, N'Rejected', N'Ledetect', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (822, 311, 1.18194, 1597083109000, 0, N'Rejected', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (823, 855, 0.6751, 1584246666000, 1, N'Finished', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (824, 258, 1.67042, 1585945331000, 1, N'Rejected', N'Ledetect', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (825, 415, 0.04467, 1598232759000, 0, N'Finished', N'Ledetect', 19)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (826, 176, 0.69979, 1573808226000, 1, N'Finished', N'Ledetect', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (827, 287, 2.20209, 1597348562000, 0, N'Rejected', N'Biorad', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (828, 548, 1.55759, 1586984601000, 1, N'Rejected', N'Biorad', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (829, 855, 2.78338, 1575648363000, 0, N'Finished', N'Ledetect', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (830, 176, 0.64063, 1576633703000, 0, N'Finished', N'Ledetect', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (831, 258, 2.41099, 1576158075000, 1, N'Rejected', N'Ledetect', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (832, 797, 2.39875, 1594886780000, 1, N'Finished', N'Ledetect', 93)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (833, 176, 2.88206, 1592629374000, 0, N'Rejected', N'Ledetect', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (834, 176, 0.42467, 1579421906000, 0, N'Rejected', N'Biorad', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (835, 548, 2.00767, 1576925694000, 1, N'Finished', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (836, 287, 2.50833, 1588787941000, 1, N'Finished', N'Ledetect', 15)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (837, 287, 0.31815, 1593946779000, 1, N'Rejected', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (838, 797, 0.94348, 1583752501000, 1, N'Rejected', N'Biorad', 32)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (839, 287, 2.88224, 1580191393000, 0, N'Finished', N'Biorad', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (840, 548, 2.67492, 1582168847000, 1, N'Finished', N'Ledetect', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (841, 229, 0.38793, 1597337463000, 0, N'Finished', N'Biorad', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (842, 229, 2.41925, 1569743921000, 0, N'Finished', N'Ledetect', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (843, 229, 1.66177, 1589974336000, 0, N'Finished', N'Ledetect', 47)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (844, 855, 0.00517, 1597182509000, 0, N'Rejected', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (846, 258, 1.57244, 1593576215000, 0, N'Rejected', N'Ledetect', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (847, 797, 0.04181, 1591845852000, 0, N'Finished', N'Biorad', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (848, 415, 1.68581, 1580327060000, 1, N'Rejected', N'Ledetect', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (849, 415, 1.15888, 1578237227000, 1, N'Rejected', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (850, 176, 1.92604, 1598545918000, 1, N'Rejected', N'Ledetect', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (851, 311, 0.38419, 1594558546000, 0, N'Finished', N'Biorad', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (852, 797, 2.26792, 1584308903000, 0, N'Finished', N'Ledetect', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (853, 855, 2.31562, 1596751937000, 1, N'Rejected', N'Biorad', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (854, 311, 1.88904, 1574437935000, 1, N'Rejected', N'Ledetect', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (856, 548, 2.10837, 1584653027000, 0, N'Rejected', N'Ledetect', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (857, 176, 2.28724, 1574022553000, 1, N'Rejected', N'Biorad', 43)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (858, 797, 2.07073, 1586489919000, 1, N'Finished', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (859, 258, 2.92172, 1587957252000, 1, N'Rejected', N'Biorad', 54)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (860, 855, 0.95175, 1578044346000, 1, N'Rejected', N'Ledetect', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (861, 229, 2.32424, 1579234562000, 0, N'Finished', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (862, 258, 2.56028, 1570624450000, 0, N'Finished', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (863, 258, 0.24588, 1572498567000, 1, N'Rejected', N'Biorad', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (864, 323, 0.93734, 1594993217000, 1, N'Finished', N'Ledetect', 55)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (865, 229, 0.57861, 1594055878000, 1, N'Rejected', N'Biorad', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (866, 311, 1.60416, 1580661181000, 1, N'Finished', N'Biorad', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (867, 415, 0.78626, 1592013908000, 1, N'Finished', N'Biorad', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (868, 258, 2.03746, 1587382368000, 1, N'Finished', N'Biorad', 1)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (869, 176, 0.92357, 1574987970000, 0, N'Finished', N'Ledetect', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (870, 258, 2.54627, 1575768984000, 0, N'Finished', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (871, 797, 0.64564, 1596366830000, 0, N'Rejected', N'Ledetect', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (872, 176, 1.14216, 1594623458000, 0, N'Rejected', N'Biorad', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (873, 415, 1.83664, 1569391708000, 1, N'Finished', N'Ledetect', 36)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (874, 855, 1.98912, 1593297141000, 1, N'Rejected', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (875, 258, 0.78598, 1576258728000, 0, N'Finished', N'Ledetect', 49)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (876, 229, 1.83732, 1599883930000, 0, N'Finished', N'Biorad', 38)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (878, 797, 2.86909, 1590564149000, 1, N'Rejected', N'Ledetect', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (880, 258, 2.11784, 1587456969000, 1, N'Finished', N'Ledetect', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (881, 311, 2.16208, 1594783786000, 0, N'Finished', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (882, 229, 1.30874, 1599572445000, 1, N'Rejected', N'Biorad', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (883, 323, 1.22324, 1584177780000, 1, N'Finished', N'Ledetect', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (884, 258, 0.65303, 1598847926000, 1, N'Finished', N'Biorad', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (885, 311, 2.76341, 1576416013000, 0, N'Finished', N'Ledetect', 20)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (887, 797, 1.56811, 1599512410000, 1, N'Rejected', N'Biorad', 40)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (888, 176, 2.66716, 1595738682000, 0, N'Finished', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (889, 548, 0.95317, 1592732091000, 0, N'Rejected', N'Ledetect', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (890, 797, 0.34999, 1579799947000, 1, N'Rejected', N'Biorad', 97)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (891, 548, 1.10429, 1568673237000, 1, N'Finished', N'Ledetect', 84)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (892, 287, 0.38761, 1582475498000, 1, N'Rejected', N'Biorad', 18)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (893, 855, 1.88221, 1593975756000, 0, N'Finished', N'Biorad', 47)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (894, 258, 0.05991, 1587914503000, 0, N'Finished', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (895, 855, 0.45292, 1568881010000, 0, N'Rejected', N'Ledetect', 14)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (896, 287, 2.72028, 1597677644000, 1, N'Rejected', N'Ledetect', 6)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (897, 797, 0.97872, 1594721317000, 1, N'Finished', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (898, 229, 0.54685, 1593670034000, 1, N'Rejected', N'Biorad', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (899, 855, 2.28879, 1598332113000, 1, N'Rejected', N'Ledetect', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (900, 855, 2.00395, 1572784899000, 1, N'Finished', N'Biorad', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (901, 229, 2.57325, 1577754185000, 0, N'Finished', N'Ledetect', 32)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (902, 855, 2.34517, 1596207988000, 1, N'Rejected', N'Biorad', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (903, 287, 2.55098, 1583435244000, 0, N'Rejected', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (904, 287, 2.61454, 1588814541000, 0, N'Finished', N'Biorad', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (905, 323, 2.52642, 1583959432000, 0, N'Rejected', N'Biorad', 4)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (906, 229, 2.74034, 1577029400000, 0, N'Finished', N'Biorad', 30)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (907, 548, 0.19043, 1588269928000, 0, N'Finished', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (908, 415, 0.79444, 1582250429000, 0, N'Rejected', N'Biorad', 34)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (909, 176, 0.04361, 1577094305000, 1, N'Finished', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (912, 311, 1.80796, 1573169600000, 0, N'Finished', N'Biorad', 31)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (913, 797, 1.39975, 1587749145000, 0, N'Rejected', N'Ledetect', 13)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (914, 258, 2.89007, 1591941649000, 0, N'Rejected', N'Ledetect', 45)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (915, 176, 2.27406, 1585815902000, 0, N'Rejected', N'Ledetect', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (916, 797, 2.27446, 1591999055000, 0, N'Finished', N'Biorad', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (917, 287, 2.22018, 1577584522000, 0, N'Finished', N'Biorad', 46)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (918, 176, 0.98408, 1587592446000, 0, N'Finished', N'Ledetect', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (919, 176, 1.22482, 1582253121000, 1, N'Rejected', N'Biorad', 72)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (920, 855, 2.56313, 1585157220000, 1, N'Finished', N'Ledetect', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (921, 797, 2.79332, 1576629441000, 1, N'Rejected', N'Biorad', 65)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (922, 287, 2.151, 1576248499000, 1, N'Rejected', N'Biorad', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (923, 229, 2.37398, 1570626031000, 0, N'Finished', N'Biorad', 29)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (924, 311, 2.39032, 1599081356000, 0, N'Finished', N'Biorad', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (925, 176, 1.25713, 1580017205000, 0, N'Rejected', N'Biorad', 50)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (926, 855, 2.89631, 1578063622000, 1, N'Rejected', N'Ledetect', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (927, 229, 2.66204, 1576346100000, 0, N'Rejected', N'Biorad', 62)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (928, 176, 1.44107, 1577073755000, 0, N'Finished', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (929, 323, 1.17674, 1594441524000, 0, N'Rejected', N'Biorad', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (930, 176, 1.77887, 1589091157000, 0, N'Rejected', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (931, 415, 1.28869, 1579888081000, 0, N'Finished', N'Ledetect', 90)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (932, 415, 0.94022, 1573048517000, 0, N'Finished', N'Biorad', 46)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (933, 855, 2.53205, 1569466449000, 0, N'Rejected', N'Ledetect', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (934, 258, 2.33835, 1570521026000, 0, N'Rejected', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (935, 311, 1.29957, 1585362228000, 0, N'Rejected', N'Biorad', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (936, 548, 1.89778, 1585773155000, 0, N'Finished', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (937, 258, 2.48546, 1584780423000, 0, N'Finished', N'Biorad', 81)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (938, 176, 1.35848, 1571495552000, 1, N'Rejected', N'Ledetect', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (939, 323, 0.59267, 1582485553000, 0, N'Rejected', N'Biorad', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (940, 548, 2.56853, 1571497859000, 1, N'Rejected', N'Ledetect', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (941, 323, 2.16969, 1575365406000, 1, N'Finished', N'Ledetect', 37)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (942, 548, 1.44098, 1581954599000, 1, N'Finished', N'Ledetect', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (943, 548, 2.1735, 1586145636000, 1, N'Finished', N'Ledetect', 92)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (944, 797, 1.67998, 1595483394000, 1, N'Finished', N'Biorad', 75)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (945, 797, 0.72967, 1575046615000, 1, N'Finished', N'Biorad', 67)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (946, 287, 0.86584, 1586838606000, 1, N'Rejected', N'Ledetect', 44)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (947, 229, 1.95004, 1579966485000, 1, N'Finished', N'Ledetect', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (948, 311, 2.15454, 1575740674000, 1, N'Rejected', N'Ledetect', 7)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (949, 797, 1.32718, 1585441087000, 1, N'Rejected', N'Biorad', 42)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (950, 548, 2.52058, 1580465314000, 1, N'Rejected', N'Ledetect', 78)
GO
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (951, 258, 0.50977, 1569948738000, 0, N'Rejected', N'Ledetect', 98)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (952, 287, 2.86394, 1583147305000, 0, N'Rejected', N'Ledetect', 12)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (953, 287, 1.88672, 1593910211000, 1, N'Finished', N'Ledetect', 58)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (954, 229, 1.14841, 1582802174000, 1, N'Finished', N'Ledetect', 100)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (955, 258, 2.36985, 1588918765000, 1, N'Rejected', N'Biorad', 88)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (956, 176, 2.10877, 1598356477000, 0, N'Rejected', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (957, 323, 0.66284, 1592698574000, 1, N'Rejected', N'Ledetect', 11)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (958, 287, 0.47762, 1598256833000, 1, N'Finished', N'Biorad', 2)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (959, 176, 1.24062, 1581395055000, 0, N'Finished', N'Ledetect', 26)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (960, 176, 1.01635, 1598121597000, 1, N'Rejected', N'Biorad', 85)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (961, 176, 0.51514, 1584009285000, 1, N'Rejected', N'Ledetect', 83)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (962, 797, 0.46285, 1569726877000, 0, N'Finished', N'Biorad', 68)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (963, 229, 2.61791, 1595919425000, 1, N'Finished', N'Biorad', 66)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (964, 229, 0.39139, 1583141515000, 0, N'Rejected', N'Ledetect', 87)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (965, 229, 2.24952, 1580641640000, 1, N'Finished', N'Biorad', 24)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (966, 855, 2.48204, 1588881260000, 1, N'Rejected', N'Ledetect', 52)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (967, 548, 1.23915, 1575178872000, 1, N'Finished', N'Ledetect', 91)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (968, 855, 1.07976, 1578744105000, 1, N'Finished', N'Biorad', 76)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (969, 311, 0.71851, 1592700919000, 1, N'Finished', N'Ledetect', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (970, 287, 1.12659, 1572126684000, 0, N'Rejected', N'Ledetect', 69)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (971, 323, 2.59748, 1582996126000, 0, N'Rejected', N'Biorad', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (972, 229, 2.26297, 1596408887000, 0, N'Finished', N'Biorad', 41)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (973, 258, 0.85414, 1587909259000, 1, N'Finished', N'Ledetect', 8)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (974, 311, 0.90251, 1595954343000, 1, N'Finished', N'Ledetect', 63)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (975, 287, 2.34217, 1582712527000, 0, N'Rejected', N'Biorad', 27)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (976, 797, 1.59181, 1598625840000, 1, N'Rejected', N'Biorad', 35)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (977, 311, 2.87534, 1584613601000, 0, N'Finished', N'Ledetect', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (978, 323, 0.2032, 1594919807000, 1, N'Rejected', N'Biorad', 82)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (979, 797, 0.12144, 1597333300000, 0, N'Rejected', N'Ledetect', 74)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (980, 176, 0.44702, 1599368268000, 1, N'Finished', N'Biorad', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (981, 548, 1.62146, 1569484284000, 1, N'Finished', N'Ledetect', 64)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (982, 323, 1.86352, 1582255001000, 0, N'Rejected', N'Biorad', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (983, 311, 0.73433, 1579182490000, 0, N'Rejected', N'Ledetect', 56)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (984, 415, 1.52292, 1583022588000, 0, N'Finished', N'Biorad', 96)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (985, 855, 1.02167, 1588187780000, 1, N'Finished', N'Ledetect', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (986, 548, 0.0769, 1593197234000, 1, N'Rejected', N'Ledetect', 16)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (987, 415, 1.12897, 1583608286000, 0, N'Rejected', N'Biorad', 28)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (988, 323, 0.47339, 1576630000000, 1, N'Rejected', N'Biorad', 79)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (989, 229, 0.44165, 1570461516000, 0, N'Rejected', N'Biorad', 60)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (990, 855, 1.36699, 1583924657000, 1, N'Rejected', N'Ledetect', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (991, 855, 1.46556, 1568908775000, 1, N'Finished', N'Biorad', 48)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (992, 797, 1.59544, 1590793950000, 0, N'Rejected', N'Ledetect', 51)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (993, 176, 1.57788, 1570819239000, 0, N'Finished', N'Biorad', 80)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (994, 415, 1.55141, 1573336739000, 0, N'Finished', N'Biorad', 86)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (995, 311, 2.67874, 1576600935000, 1, N'Rejected', N'Ledetect', 25)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (996, 287, 1.55363, 1570234635000, 1, N'Rejected', N'Biorad', 77)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (997, 229, 1.33259, 1583460294000, 0, N'Rejected', N'Biorad', 22)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (998, 797, 0.07774, 1569755774000, 0, N'Finished', N'Biorad', 99)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (999, 176, 2.01524, 1589331641000, 1, N'Rejected', N'Ledetect', 9)
INSERT [dbo].[blood_services] ([id], [service], [result], [finished], [accepted], [status], [analyzer], [user]) VALUES (1000, 287, 1.43944, 1586575249000, 1, N'Rejected', N'Ledetect', 69)
INSERT [dbo].[bloode] ([id], [patient], [barcode], [date]) VALUES (1, 792, 7270614, 1593529155000)
INSERT [dbo].[bloode] ([id], [patient], [barcode], [date]) VALUES (479, 555, 6622244, 1588333758000)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id_role], [Title]) VALUES (1, N'Лаборант')
INSERT [dbo].[Role] ([id_role], [Title]) VALUES (2, N'Лборант-исследователь')
INSERT [dbo].[Role] ([id_role], [Title]) VALUES (3, N'Бухгалтер')
INSERT [dbo].[Role] ([id_role], [Title]) VALUES (4, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (1, N'Clareta
', N'Hacking
', N'1', N'147.231.50.234
', N'1', CAST(N'2020-10-02' AS Date), N'[{"code":557},{"code":836},{"code":287}]
', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (2, N'Northrop', N'Mably', N'2', N'22.32.15.211', N'2', NULL, N'[{"code":855},{"code":619},{"code":557},{"code":83', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (3, N'Fabian', N'Rolf', N'frolf2', N'113.92.142.29', N'7QpCwac0yi', NULL, N'[{"code":543},{"code":836}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (4, N'Lauree', N'Raden', N'lraden3', N'39.24.146.52', N'5Ydp2mz', NULL, N'[{"code":855},{"code":258}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (5, N'Barby', N'Follos', N'bfollos4', N'87.232.97.3', N'ckmAJPQV', NULL, N'[{"code":543},{"code":415},{"code":619},{"code":55', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (6, N'Mile', N'Enterle', N'menterle5', N'85.121.209.6', N'0PRom6i', CAST(N'2020-04-07' AS Date), N'[{"code":557},{"code":836},{"code":229}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (7, N'Midge', N'Peaker', N'mpeaker6', N'196.39.132.128', N'0Tc5oRc', CAST(N'2020-03-09' AS Date), N'[{"code":287},{"code":619},{"code":548},{"code":34', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (8, N'Manon', N'Robichon', N'mrobichon7', N'143.159.207.105', N'LEwEjMlmE5X', NULL, N'[{"code":415},{"code":311},{"code":176},{"code":85', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (9, N'Stavro', N'Robken', N'3', N'12.154.73.196', N'3', NULL, N'[{"code":323},{"code":548},{"code":346}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (10, N'Bryan', N'Tidmas', N'btidmas9', N'24.42.134.21', N'dYDHbBQfK', CAST(N'2020-06-06' AS Date), N'[{"code":229},{"code":346},{"code":501},{"code":54', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (11, N'Jeannette', N'Fussie', N'jfussiea', N'98.194.112.137', N'EGxXuLQ9', NULL, N'[{"code":287}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (12, N'Stephen', N'Antonacci', N'santonaccib', N'198.146.255.15', N'YcXAhY3Pja', CAST(N'2019-03-10' AS Date), N'[{"code":619},{"code":258},{"code":229},{"code":55', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (13, N'Niccolo', N'Bountiff', N'nbountiffc', N'231.78.246.229', N'5xfyjS9ZULGA', NULL, N'[{"code":323},{"code":311},{"code":557}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (14, N'Clemente', N'Benjefield', N'cbenjefieldd', N'88.126.93.246', N'tQOsP0ei9TuD', CAST(N'2020-09-07' AS Date), N'[{"code":855},{"code":176},{"code":176},{"code":85', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (15, N'Orlan', N'Corbyn', N'ocorbyne', N'232.175.48.179', N'bG1ZIzwIoU', NULL, N'[{"code":229},{"code":836},{"code":287},{"code":61', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (16, N'Coreen', N'Stickins', N'cstickinsf', N'64.30.175.158', N'QRYADbgNj', NULL, N'[{"code":557}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (17, N'Daveta', N'Clarage', N'dclarageg', N'139.88.229.111', N'Yp59ZIDnWe', CAST(N'2020-09-06' AS Date), N'[{"code":346},{"code":836},{"code":346}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (18, N'Javier', N'McCawley', N'jmccawleyh', N'14.199.67.32', N'g58zLcmCYON', NULL, N'[{"code":619},{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (19, N'Daile', N'Band', N'dbandi', N'206.105.148.56', N'yFAaYuVW', CAST(N'2019-02-12' AS Date), N'[{"code":176},{"code":543},{"code":855},{"code":25', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (20, N'Angil', N'Buttery', N'abutteryj', N'192.158.7.138', N'ttOFbWWGtD', NULL, N'[{"code":323},{"code":855},{"code":659},{"code":28', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (21, N'Kyla', N'Kinman', N'kkinmank', N'134.99.243.113', N'qUr6fdWP6L5G', CAST(N'2019-08-01' AS Date), N'[{"code":346},{"code":855},{"code":323},{"code":55', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (22, N'Selena', N'Skepper', N'sskepperl', N'52.90.89.126', N'jHYN0v3', NULL, N'[{"code":855},{"code":287}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (23, N'Alyson', N'Yeoland', N'ayeolandm', N'239.7.55.187', N'QQezRBV9', NULL, N'[{"code":836},{"code":836},{"code":229},{"code":25', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (24, N'Claudie', N'Speeding', N'cspeedingn', N'127.37.194.127', N'UCLYITfw2Vo', NULL, N'[{"code":548},{"code":557},{"code":176}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (25, N'Alaric', N'Scarisbrick', N'ascarisbricko', N'97.227.15.172', N'fzBcv6GbyCp', NULL, N'[{"code":543},{"code":836}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (26, N'Marie', N'Thurby', N'mthurbyp', N'94.70.148.135', N'wg0uIskqei', NULL, N'[{"code":548},{"code":855}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (27, N'Cloe', N'Roxbrough', N'croxbroughq', N'185.110.201.36', N'67CVVym', CAST(N'2020-01-01' AS Date), N'[{"code":501},{"code":797},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (28, N'Pegeen', N'McCotter', N'pmccotterr', N'22.179.187.229', N'QG5tdzRpGZJ2', NULL, N'[{"code":176},{"code":855}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (29, N'Iggie', N'Calleja', N'icallejas', N'67.237.123.227', N'aeDvZk8o9', NULL, N'[{"code":836},{"code":176},{"code":619},{"code":25', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (30, N'Nelle', N'Brosch', N'nbroscht', N'251.1.59.65', N'DmPJt2', NULL, N'[{"code":346}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (31, N'Shae', N'Allsepp', N'sallseppu', N'88.20.74.85', N't0ko0854Cpvv', CAST(N'2020-09-08' AS Date), N'[{"code":548},{"code":229},{"code":258},{"code":61', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (32, N'Eldridge', N'Abbatucci', N'eabbatucciv', N'52.44.134.126', N'gUtNdsDu', NULL, N'[{"code":836},{"code":836},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (33, N'Skip', N'Garnham', N'sgarnhamw', N'100.17.131.54', N'eml6RqbK', NULL, N'[{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (34, N'Ric', N'Kitchenside', N'rkitchensidex', N'29.100.76.146', N'xaa7miQ7yB', NULL, N'[{"code":501},{"code":258},{"code":659},{"code":50', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (35, N'Urbanus', N'Di Meo', N'udiy', N'90.30.250.200', N'dHqu78cU6NOP', NULL, N'[{"code":797},{"code":287},{"code":855},{"code":34', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (36, N'Monty', N'Beidebeke', N'mbeidebekez', N'3.32.202.92', N'F5T5spAU9A4O', CAST(N'2020-05-02' AS Date), N'[{"code":415},{"code":543},{"code":836}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (37, N'Byrann', N'Savins', N'bsavins10', N'123.187.14.103', N'l6sYf29NLN', NULL, N'[{"code":836}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (38, N'Sonnie', N'Riby', N'sriby11', N'16.81.16.23', N'Va34LYqFh', NULL, N'[{"code":501}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (39, N'Sherill', N'Birney', N'sbirney12', N'144.76.193.237', N'Ggygo2ePsETs', NULL, N'[{"code":836},{"code":258},{"code":619}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (40, N'Indira', N'Kleanthous', N'ikleanthous13', N'169.108.108.88', N'3H0GS7a', NULL, N'[{"code":797},{"code":346},{"code":543},{"code":50', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (41, N'Maison', N'Skerme', N'mskerme14', N'143.177.136.232', N'wy1HWA', CAST(N'2020-10-02' AS Date), N'[{"code":176},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (42, N'Hanan', N'Cahey', N'hcahey15', N'18.127.87.158', N'NSXcG9khd', NULL, N'[{"code":501},{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (43, N'Tore', N'Rusling', N'trusling16', N'142.216.95.251', N'abol9dYC8e', NULL, N'[{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (44, N'Jeddy', N'De Souza', N'jde17', N'29.14.2005', N'gK6Hsl8Q', NULL, N'[{"code":415},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (45, N'Flossi', N'McLeoid', N'fmcleoid18', N'90.207.38.179', N'B9zr0N7cJw', NULL, N'[{"code":543}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (46, N'Nikoletta', N'Megainey', N'nmegainey19', N'172.249.218.50', N'gph7QurFf', NULL, N'[{"code":415}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (47, N'Adan', N'Bliven', N'abliven1a', N'49.101.94.118', N'vVxlf94KpeX', NULL, N'[{"code":323},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (48, N'Mohandis', N'Rossoni', N'mrossoni1b', N'161.5.132.42', N'nLXj2lS', NULL, N'[{"code":176},{"code":659},{"code":287}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (49, N'Nappie', N'Redington', N'nredington1c', N'174.42.8.3', N'DCbOb1SX', CAST(N'2020-06-05' AS Date), N'[{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (50, N'Lenka', N'Francie', N'lfrancie1d', N'182.2.128.34', N'DoGeHWuAAM', NULL, N'[{"code":659},{"code":501},{"code":415}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (51, N'Ashley', N'Blowin', N'ablowin1e', N'73.212.243.168', N'aQygVtMjN', NULL, N'[{"code":176},{"code":311},{"code":855},{"code":17', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (52, N'Vale', N'Goroni', N'vgoroni1f', N'93.126.120.134', N'bWr0QU', NULL, N'[{"code":287},{"code":287},{"code":659}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (53, N'Suki', N'Grafom', N'sgrafom1g', N'9.26.5.107', N'JcNcVDAouYzA', NULL, N'[{"code":797},{"code":323},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (54, N'Justis', N'Gianneschi', N'jgianneschi1h', N'139.241.156.87', N'oieX5u3sUfpD', NULL, N'[{"code":836},{"code":543},{"code":548},{"code":31', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (55, N'Emilie', N'Collett', N'ecollett1i', N'47.0.240.7', N'Y0uMyKB0W', CAST(N'2019-07-10' AS Date), N'[{"code":543},{"code":287},{"code":258}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (56, N'Byrom', N'Terrell', N'bterrell1j', N'157.21.33.53', N'hswseW', NULL, N'[{"code":287},{"code":557},{"code":543}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (57, N'Daphne', N'Bifield', N'dbifield1k', N'24.185.229.169', N'oYAQ4URihIA', NULL, N'[{"code":619},{"code":323},{"code":855},{"code":22', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (58, N'Blanca', N'Staig', N'bstaig1l', N'171.78.28.229', N'MygqEtjMtUbC', NULL, N'[{"code":176},{"code":855}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (59, N'Adriaens', N'Kennsley', N'akennsley1m', N'208.81.128.179', N'CTUdBfJsy6qF', NULL, N'[{"code":836},{"code":548}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (60, N'Emlyn', N'Bartak', N'ebartak1n', N'130.247.20.138', N'y3t4H1', NULL, N'[{"code":543}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (61, N'Victoria', N'Willshire', N'vwillshire1o', N'243.230.165.161', N'VFSLc2t', CAST(N'2020-03-09' AS Date), N'[{"code":557},{"code":287},{"code":836},{"code":28', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (62, N'Egon', N'Savin', N'esavin1p', N'40.140.160.210', N'axnJY9s', NULL, N'[{"code":346},{"code":258},{"code":543},{"code":32', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (63, N'Phillie', N'Elsom', N'pelsom1q', N'253.7.8.82', N'OXzMECG', CAST(N'2020-01-01' AS Date), N'[{"code":323},{"code":501},{"code":501}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (64, N'Adan', N'Semaine', N'asemaine1r', N'76.252.15.218', N'MdJRkHor5SP', CAST(N'2019-05-10' AS Date), N'[{"code":258}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (65, N'Constantino', N'Northrop', N'cnorthrop1s', N'119.130.24.85', N'UIwCvTA7MRS0', CAST(N'2019-12-10' AS Date), N'[{"code":176},{"code":229}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (66, N'Rodie', N'Easson', N'reasson1t', N'212.248.119.232', N'3J0jgg9RWlXs', NULL, N'[{"code":855},{"code":287},{"code":797}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (67, N'Alida', N'Boleyn', N'aboleyn1u', N'181.14.56.184', N'3q2mQdDRmtr', NULL, N'[{"code":229},{"code":323},{"code":501},{"code":25', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (68, N'Hill', N'Scholfield', N'hscholfield1v', N'15.7.205.224', N'1Pbs3K6qXYB', NULL, N'[{"code":619},{"code":258},{"code":501},{"code":28', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (69, N'Cordell', N'Cowpe', N'ccowpe1w', N'237.236.173.63', N'VHr417Ft0', NULL, N'[{"code":346},{"code":311},{"code":346},{"code":17', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (70, N'Alexandro', N'Eldon', N'aeldon1x', N'4.174.11.210', N'rrywOQRmFKyh', CAST(N'2019-04-12' AS Date), N'[{"code":836},{"code":346},{"code":836}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (71, N'Kayle', N'Collin', N'kcollin1y', N'52.19.142.168', N'Q0ZV21vew0', NULL, N'[{"code":346}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (72, N'Inesita', N'Larkins', N'ilarkins1z', N'3.26.42.188', N'DEFNpHtU', CAST(N'2019-05-12' AS Date), N'[{"code":548},{"code":258},{"code":311},{"code":22', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (73, N'Waylin', N'Lound', N'wlound20', N'31.243.68.215', N'a2G4Ihh2o', NULL, N'[{"code":619},{"code":659},{"code":346}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (74, N'Mechelle', N'Gillogley', N'mgillogley21', N'79.38.53.53', N'EjUHfCUFqF', CAST(N'2020-01-05' AS Date), N'[{"code":346},{"code":176},{"code":176},{"code":41', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (75, N'Donal', N'Muccino', N'dmuccino22', N'109.138.101.234', N'E4okVgx', CAST(N'2020-02-04' AS Date), N'[{"code":176},{"code":619},{"code":287},{"code":31', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (76, N'Joye', N'Leadbetter', N'jleadbetter23', N'51.245.190.167', N'ZNsaKdgb', CAST(N'2020-02-05' AS Date), N'[{"code":548},{"code":543},{"code":548},{"code":85', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (77, N'Gianina', N'Trump', N'gtrump24', N'11.191.37.17', N'6XXY7IS26Ci', CAST(N'2020-03-08' AS Date), N'[{"code":258}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (78, N'Read', N'LeEstut', N'rleestut25', N'119.247.100.162', N'zq3C4rUR', CAST(N'2020-01-09' AS Date), N'[{"code":323},{"code":287},{"code":659},{"code":17', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (79, N'Jill', N'Anscott', N'janscott26', N'104.85.178.46', N'5maCRrCZLu', NULL, N'[{"code":287}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (80, N'Bud', N'Douch', N'bdouch27', N'72.132.101.188', N'KAkwrli', CAST(N'2020-06-02' AS Date), N'[{"code":287}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (81, N'Cicily', N'Ossenna', N'cossenna28', N'230.85.180.186', N'vfKJkCeohOzZ', CAST(N'2020-06-01' AS Date), N'[{"code":501},{"code":176},{"code":176}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (82, N'Hew', N'Izzat', N'hizzat29', N'143.246.125.169', N'Uifdtu', NULL, N'[{"code":287},{"code":501},{"code":287},{"code":31', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (83, N'Eddie', N'Gimeno', N'egimeno2a', N'60.57.115.125', N'oF1hbmKlZ', NULL, N'[{"code":659},{"code":543},{"code":501},{"code":65', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (84, N'Sybyl', N'Fierro', N'sfierro2b', N'250.233.247.215', N'VjUrQ2', NULL, N'[{"code":415},{"code":323},{"code":346},{"code":31', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (85, N'Nicol', N'Troup', N'ntroup2c', N'121.7.142.165', N'KmDDYf1Pu', NULL, N'[{"code":415},{"code":176},{"code":836},{"code":28', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (86, N'Bondy', N'Pattenden', N'bpattenden2d', N'45.121.26.90', N'IOUkHpOn', NULL, N'[{"code":836},{"code":229},{"code":346},{"code":34', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (87, N'Angus', N'Cockman', N'acockman2e', N'167.9.255.77', N'fDKhK7OK', CAST(N'2020-06-01' AS Date), N'[{"code":323},{"code":229},{"code":258},{"code":25', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (88, N'Mord', N'Hanscome', N'mhanscome2f', N'121.181.10.230', N'xBHzpa7eP0u', CAST(N'2020-10-07' AS Date), N'[{"code":346},{"code":548},{"code":548}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (89, N'Susy', N'Leblanc', N'sleblanc2g', N'118.164.120.202', N'T2et1U5M', NULL, N'[{"code":855},{"code":619}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (90, N'Gerard', N'Ciccoloi', N'gciccoloi2h', N'71.235.27.27', N'w4dZ3hxiCiAg', CAST(N'2020-03-02' AS Date), N'[{"code":548},{"code":311},{"code":346},{"code":31', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (91, N'Seamus', N'Sayburn', N'ssayburn2i', N'75.194.92.114', N'1hTM7EVKaS', NULL, N'[{"code":557},{"code":548},{"code":557},{"code":32', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (92, N'Washington', N'Gentiry', N'wgentiry2j', N'188.49.78.185', N'z2X9UH5', CAST(N'2020-10-04' AS Date), N'[{"code":323},{"code":855},{"code":229}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (93, N'Rebekkah', N'Westall', N'rwestall2k', N'212.150.81.93', N'xLgunbO9x6', CAST(N'2020-02-02' AS Date), N'[{"code":501},{"code":501},{"code":855},{"code":79', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (94, N'Court', N'Kulic', N'ckulic2l', N'154.121.193.131', N'FLHYRN', NULL, N'[{"code":323}]', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (95, N'Lorilee', N'Roux', N'lroux2m', N'229.187.60.106', N'98cCxHeeK31', CAST(N'2020-12-06' AS Date), N'[{"code":415},{"code":543}]', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (96, N'Modestine', N'Rolinson', N'mrolinson2n', N'9.203.185.188', N'faGzyW8hEca', NULL, N'[{"code":311},{"code":855},{"code":797},{"code":85', 1)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (97, N'Shelbi', N'Ellgood', N'sellgood2o', N'199.226.26.7', N'3do5MME', NULL, N'[{"code":176},{"code":836},{"code":346},{"code":50', 3)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (98, N'Barbabra', N'Retchless', N'bretchless2p', N'86.66.23.203', N'WraGihh', CAST(N'2019-09-01' AS Date), N'[{"code":229},{"code":415},{"code":258},{"code":61', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (99, N'Robinetta', N'Jerzak', N'rjerzak2q', N'205.158.144.210', N'hAp8jki', CAST(N'2019-01-12' AS Date), N'[{"code":659}]', 2)
INSERT [dbo].[users] ([id], [name], [surname], [login], [ip], [password], [lastenter], [services], [role]) VALUES (100, N'Vance', N'Boots', N'vboots2r', N'91.73.40.29', N'bgJfSDEVEQm6', CAST(N'2020-07-09' AS Date), N'[{"code":548},{"code":346},{"code":311}]', 2)
GO
INSERT [dbo].[Выставленые счета страховой компании] ([id], [insurance_company], [cost], [start_date], [end_date]) VALUES (333, 3, 53632.0000, CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Выставленые счета страховой компании] ([id], [insurance_company], [cost], [start_date], [end_date]) VALUES (792, 1, 50000.0000, CAST(N'2024-01-09' AS Date), CAST(N'2024-04-15' AS Date))
SET IDENTITY_INSERT [dbo].[Данные анализатора] ON 

INSERT [dbo].[Данные анализатора] ([id], [Title], [date_time_order], [date_time_servise]) VALUES (1, N'Слуховой', CAST(N'2024-01-01 00:00:00.000' AS DateTime), CAST(N'2024-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Данные анализатора] ([id], [Title], [date_time_order], [date_time_servise]) VALUES (3, N'Слуховой', CAST(N'2023-01-01 00:00:00.000' AS DateTime), CAST(N'2024-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Данные анализатора] OFF
SET IDENTITY_INSERT [dbo].[ДанныеСтраховыхКомпаний] ON 

INSERT [dbo].[ДанныеСтраховыхКомпаний] ([id], [Title], [Address], [INN], [p/c], [BIK]) VALUES (1, N'StrahovkaBest', N'г. Москва, ул.Кирова кв.14', 123456789, 1234, 1234567891)
INSERT [dbo].[ДанныеСтраховыхКомпаний] ([id], [Title], [Address], [INN], [p/c], [BIK]) VALUES (3, N'VTB', N'г. Москва, ул.Кирова кв.14', 123456789, 1234, 1234567891)
SET IDENTITY_INSERT [dbo].[ДанныеСтраховыхКомпаний] OFF
SET IDENTITY_INSERT [dbo].[Заказ] ON 

INSERT [dbo].[Заказ] ([id], [date], [service], [status_order], [services_rendered], [finished], [patient], [status_service]) VALUES (1, CAST(N'2024-09-02' AS Date), 176, N'В обработке', 2, CAST(N'2024-10-04' AS Date), 792, N'не выполнена')
INSERT [dbo].[Заказ] ([id], [date], [service], [status_order], [services_rendered], [finished], [patient], [status_service]) VALUES (2, NULL, 229, N'В обработке', 7, NULL, 555, N'не выполнена')
SET IDENTITY_INSERT [dbo].[Заказ] OFF
SET IDENTITY_INSERT [dbo].[ОказаннаяУслуга] ON 

INSERT [dbo].[ОказаннаяУслуга] ([id], [date_result], [user], [analyzer], [result]) VALUES (2, CAST(N'2024-04-09' AS Date), 77, 1, 5)
INSERT [dbo].[ОказаннаяУслуга] ([id], [date_result], [user], [analyzer], [result]) VALUES (7, CAST(N'2024-01-01' AS Date), 78, 3, 2)
SET IDENTITY_INSERT [dbo].[ОказаннаяУслуга] OFF
INSERT [dbo].[Пациент] ([id], [Name], [Surname], [login], [password], [birthday], [pasport_s], [pasport_n], [phone], [email], [number_polis], [type_polis], [страховая компания]) VALUES (555, N'Антон', N'Сидоров', N'Grut', N'Grut123', CAST(N'2007-02-12' AS Date), 3320, 628292, N'79229377990', N'Grut@mail.ru', 12345678, N'Детский', 3)
INSERT [dbo].[Пациент] ([id], [Name], [Surname], [login], [password], [birthday], [pasport_s], [pasport_n], [phone], [email], [number_polis], [type_polis], [страховая компания]) VALUES (792, N'Александр', N'Куклин', N'Grut', N'Grut123', CAST(N'2007-02-12' AS Date), 3320, 628292, N'79229377990', N'Grut@mail.ru', 12345678, N'Детский', 1)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (176, N'Билирубин общий', 102.8500, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (229, N'СПИД', 341.7800, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (258, N'Креатинин', 143.2200, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (287, N'Волчаночный антикоагулянт', 290.1100, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (311, N'Амилаза', 361.8800, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (323, N'Глюкоза', 447.6500, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (346, N'Общий белок', 396.0300, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (415, N'Кальций общий', 419.9000, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (501, N'Гепатит В', 176.8300, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (543, N'Гепатит С', 289.9900, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (548, N'Альбумин', 234.0900, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (557, N'ВИЧ', 490.7700, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (619, N'TSH', 262.7100, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (659, N'Сифилис RPR', 443.6600, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (797, N'АТ и АГ к ВИЧ 1/2', 370.6200, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (836, N'Железо', 105.3200, NULL)
INSERT [dbo].[Услуги_лаборатории] ([id], [Title], [cost], [deviation]) VALUES (855, N'Ковид IgM', 209.7800, NULL)
ALTER TABLE [dbo].[blood_services]  WITH CHECK ADD  CONSTRAINT [FK_blood_services_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[blood_services] CHECK CONSTRAINT [FK_blood_services_users]
GO
ALTER TABLE [dbo].[blood_services]  WITH CHECK ADD  CONSTRAINT [FK_blood_services_Услуги_лаборатории] FOREIGN KEY([service])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[blood_services] CHECK CONSTRAINT [FK_blood_services_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[bloode]  WITH CHECK ADD  CONSTRAINT [FK_bloode_Пациент] FOREIGN KEY([patient])
REFERENCES [dbo].[Пациент] ([id])
GO
ALTER TABLE [dbo].[bloode] CHECK CONSTRAINT [FK_bloode_Пациент]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([id_role])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_Role]
GO
ALTER TABLE [dbo].[Бухгалтер]  WITH CHECK ADD  CONSTRAINT [FK_Бухгалтер_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Бухгалтер] CHECK CONSTRAINT [FK_Бухгалтер_users]
GO
ALTER TABLE [dbo].[Бухгалтер]  WITH CHECK ADD  CONSTRAINT [FK_Бухгалтер_Выставленые счета страховой компании] FOREIGN KEY([expense_company])
REFERENCES [dbo].[Выставленые счета страховой компании] ([id])
GO
ALTER TABLE [dbo].[Бухгалтер] CHECK CONSTRAINT [FK_Бухгалтер_Выставленые счета страховой компании]
GO
ALTER TABLE [dbo].[Бухгалтер]  WITH CHECK ADD  CONSTRAINT [FK_Бухгалтер_Услуги_лаборатории] FOREIGN KEY([services])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[Бухгалтер] CHECK CONSTRAINT [FK_Бухгалтер_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[Выставленые счета страховой компании]  WITH CHECK ADD  CONSTRAINT [FK_Выставленые счета страховой компании_ДанныеСтраховыхКомпаний] FOREIGN KEY([insurance_company])
REFERENCES [dbo].[ДанныеСтраховыхКомпаний] ([id])
GO
ALTER TABLE [dbo].[Выставленые счета страховой компании] CHECK CONSTRAINT [FK_Выставленые счета страховой компании_ДанныеСтраховыхКомпаний]
GO
ALTER TABLE [dbo].[Данные лаборантов]  WITH CHECK ADD  CONSTRAINT [FK_Данные лаборантов_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Данные лаборантов] CHECK CONSTRAINT [FK_Данные лаборантов_users]
GO
ALTER TABLE [dbo].[Данные лаборантов]  WITH CHECK ADD  CONSTRAINT [FK_Данные лаборантов_Услуги_лаборатории] FOREIGN KEY([servaces])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[Данные лаборантов] CHECK CONSTRAINT [FK_Данные лаборантов_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_ОказаннаяУслуга] FOREIGN KEY([services_rendered])
REFERENCES [dbo].[ОказаннаяУслуга] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_ОказаннаяУслуга]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пациент] FOREIGN KEY([patient])
REFERENCES [dbo].[Пациент] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пациент]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Услуги_лаборатории] FOREIGN KEY([service])
REFERENCES [dbo].[Услуги_лаборатории] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Услуги_лаборатории]
GO
ALTER TABLE [dbo].[ОказаннаяУслуга]  WITH CHECK ADD  CONSTRAINT [FK_ОказаннаяУслуга_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[ОказаннаяУслуга] CHECK CONSTRAINT [FK_ОказаннаяУслуга_users]
GO
ALTER TABLE [dbo].[ОказаннаяУслуга]  WITH CHECK ADD  CONSTRAINT [FK_ОказаннаяУслуга_Данные анализатора] FOREIGN KEY([analyzer])
REFERENCES [dbo].[Данные анализатора] ([id])
GO
ALTER TABLE [dbo].[ОказаннаяУслуга] CHECK CONSTRAINT [FK_ОказаннаяУслуга_Данные анализатора]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_ДанныеСтраховыхКомпаний] FOREIGN KEY([страховая компания])
REFERENCES [dbo].[ДанныеСтраховыхКомпаний] ([id])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_ДанныеСтраховыхКомпаний]
GO
USE [master]
GO
ALTER DATABASE [Медицинская лаборатория] SET  READ_WRITE 
GO
