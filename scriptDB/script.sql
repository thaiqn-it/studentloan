USE [master]
GO
/****** Object:  Database [StudentLoan]    Script Date: 5/9/2022 1:13:08 AM ******/
CREATE DATABASE [StudentLoan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'studentloan', FILENAME = N'E:\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\studentloan.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'studentloan_log', FILENAME = N'E:\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\studentloan_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentLoan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentLoan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentLoan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentLoan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentLoan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentLoan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentLoan] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentLoan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentLoan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentLoan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentLoan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentLoan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentLoan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentLoan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentLoan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentLoan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentLoan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentLoan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentLoan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentLoan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentLoan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentLoan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentLoan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentLoan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentLoan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentLoan] SET  MULTI_USER 
GO
ALTER DATABASE [StudentLoan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentLoan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentLoan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentLoan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StudentLoan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentLoan', N'ON'
GO
USE [StudentLoan]
GO
/****** Object:  Table [dbo].[Archievement]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Archievement](
	[id] [char](36) NOT NULL,
	[studentId] [char](36) NOT NULL,
	[description] [nvarchar](255) NULL,
	[imageUrl] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract](
	[id] [char](36) NOT NULL,
	[investmentId] [char](36) NULL,
	[status] [nvarchar](255) NULL,
	[contractUrl] [nvarchar](255) NULL,
	[contractCode] [nvarchar](8) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Investment]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Investment](
	[id] [char](36) NOT NULL,
	[investorId] [char](36) NULL,
	[status] [nvarchar](255) NOT NULL,
	[total] [bigint] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[loanId] [char](36) NULL,
	[transactionId] [char](36) NULL,
	[percent] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Investor]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Investor](
	[id] [char](36) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[parentId] [char](36) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[userId] [char](36) NULL,
	[citizenId] [nvarchar](20) NULL,
	[citizenCardCreatedDate] [datetimeoffset](7) NULL,
	[citizenCardCreatedPlace] [nvarchar](max) NULL,
	[frontCitizenCardImageUrl] [nvarchar](255) NULL,
	[backCitizenCardImageUrl] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loan](
	[id] [char](36) NOT NULL,
	[totalMoney] [bigint] NOT NULL,
	[interest] [float] NOT NULL,
	[description] [nvarchar](max) NULL,
	[duration] [int] NOT NULL,
	[loanStartAt] [datetimeoffset](7) NULL,
	[loanEndAt] [datetimeoffset](7) NULL,
	[postCreatedAt] [datetimeoffset](7) NOT NULL,
	[postExpireAt] [datetimeoffset](7) NOT NULL,
	[studentId] [char](36) NULL,
	[title] [nvarchar](max) NULL,
	[expectedGraduationTime] [int] NOT NULL,
	[expectedMoney] [bigint] NULL,
	[fixedMoney] [bigint] NULL,
	[penaltyFee] [float] NULL,
 CONSTRAINT [PK__Loan__3213E83F73E828CE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanHistory]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanHistory](
	[id] [char](36) NOT NULL,
	[loanId] [char](36) NOT NULL,
	[adminId] [char](36) NULL,
	[type] [nvarchar](255) NOT NULL,
	[isActive] [bit] NOT NULL,
	[description] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanHistoryImage]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanHistoryImage](
	[id] [char](36) NOT NULL,
	[loanHistoryId] [char](36) NOT NULL,
	[imageUrl] [nvarchar](255) NULL,
	[status] [nvarchar](255) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanMedia]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanMedia](
	[id] [char](36) NOT NULL,
	[loanId] [char](36) NOT NULL,
	[description] [nvarchar](255) NULL,
	[imageUrl] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanSchedule]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanSchedule](
	[id] [char](36) NOT NULL,
	[money] [bigint] NOT NULL,
	[startAt] [datetimeoffset](7) NOT NULL,
	[endAt] [datetimeoffset](7) NOT NULL,
	[type] [nvarchar](255) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[loanId] [char](36) NOT NULL,
	[penaltyMoney] [bigint] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanScheduleTransaction]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanScheduleTransaction](
	[id] [char](36) NOT NULL,
	[transactionId] [char](36) NOT NULL,
	[loanScheduleId] [char](36) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Major]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Major](
	[id] [char](36) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [char](36) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[redirectUrl] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[userId] [char](36) NOT NULL,
	[isRead] [bit] NULL,
	[type] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[School]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[School](
	[id] [char](36) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[city] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[status] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolMajor]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolMajor](
	[majorId] [char](36) NOT NULL,
	[schoolId] [char](36) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[id] [char](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[id] [char](36) NOT NULL,
	[studentCardId] [nvarchar](50) NULL,
	[frontCitizenCardImageUrl] [nvarchar](255) NULL,
	[backCitizenCardImageUrl] [nvarchar](255) NULL,
	[frontStudentCardImageUrl] [nvarchar](255) NULL,
	[backStudentCardImageUrl] [nvarchar](255) NULL,
	[citizenId] [nvarchar](20) NULL,
	[citizenCardCreatedDate] [datetimeoffset](7) NULL,
	[citizenCardCreatedPlace] [nvarchar](max) NULL,
	[parentId] [char](36) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[userId] [char](36) NOT NULL,
	[schoolMajorId] [char](36) NULL,
	[status] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[id] [char](36) NOT NULL,
	[status] [bit] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[interest] [float] NULL,
	[fixedMoney] [int] NULL,
	[transactionFee] [float] NULL,
	[penaltyFee] [float] NULL,
	[minRaiseMoney] [int] NULL,
	[maxRaiseMoney] [int] NULL,
	[minDuration] [int] NULL,
	[maxDuration] [int] NULL,
	[postExpireTime] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction](
	[id] [char](36) NOT NULL,
	[money] [bigint] NOT NULL,
	[type] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[transactionFee] [bigint] NOT NULL,
	[recipientId] [char](36) NULL,
	[recipientName] [nvarchar](max) NOT NULL,
	[senderId] [char](36) NULL,
	[senderName] [nvarchar](max) NOT NULL,
	[paypalTransaction] [nvarchar](max) NULL,
	[walletId] [char](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tutor](
	[id] [char](36) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[citizenId] [nvarchar](20) NULL,
	[citizenCardCreatedDate] [datetimeoffset](7) NULL,
	[citizenCardCreatedPlace] [nvarchar](max) NULL,
	[frontCitizenCardImageUrl] [nvarchar](255) NULL,
	[backCitizenCardImageUrl] [nvarchar](255) NULL,
	[portraitUrl] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[birthday] [datetimeoffset](7) NULL,
	[address] [nvarchar](255) NULL,
	[relation] [nvarchar](255) NULL,
	[studentId] [char](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [char](36) NOT NULL,
	[phoneNumber] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[oAuthId] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[reason] [nvarchar](255) NULL,
	[firstName] [nvarchar](70) NULL,
	[lastName] [nvarchar](70) NULL,
	[status] [nvarchar](255) NULL,
	[profileUrl] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[birthDate] [datetimeoffset](7) NULL,
	[pushToken] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 5/9/2022 1:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Wallet](
	[id] [char](36) NOT NULL,
	[userId] [char](36) NOT NULL,
	[money] [bigint] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Archievement] ([id], [studentId], [description], [imageUrl], [status], [createdAt], [updatedAt]) VALUES (N'2s8bf97z-7332-15bc-8c9e-d28c32cb7557', N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', N'Đạt giải cóc vàng FPT', N'https://i.chungta.vn/2018/10/12/cap-doi-coc-vang-dh-fpt-lung-linh-trong-le-ton-vinh-ky-summer-2018-1539326650.jpg', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[Archievement] ([id], [studentId], [description], [imageUrl], [status], [createdAt], [updatedAt]) VALUES (N'7w2bs97w-7388-15bc-8c9e-d28c32jk7557', N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', N'Năm 2019 tham gia cuộc thi FPT Hackathon đạt giải khuyến khích', N'https://daihoc.fpt.edu.vn/media/2021/01/MG_1197-910x607.jpg', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[Archievement] ([id], [studentId], [description], [imageUrl], [status], [createdAt], [updatedAt]) VALUES (N'afe058f6-0c85-40fb-a813-e970dd8b4cf9', N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', N'Năm 2019 tham gia cuộc thi FPT Hackathon đạt giải khuyến khích', N'https://daihoc.fpt.edu.vn/media/2021/01/MG_1197-910x607.jpg', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[Archievement] ([id], [studentId], [description], [imageUrl], [status], [createdAt], [updatedAt]) VALUES (N'c3f48a07-80e5-4238-9876-88a79a348d52', N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', N'Đạt giải cóc vàng FPT', N'https://i.chungta.vn/2018/10/12/cap-doi-coc-vang-dh-fpt-lung-linh-trong-le-ton-vinh-ky-summer-2018-1539326650.jpg
', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'3fbd87ef-1a3c-4b70-b6ec-174967397c85', N'05c07616-ecd4-4092-9ce0-6c65b8817d01', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1650030622/pdf/qzldvp0gvolejiuinufs.pdf', N'RVH20942', CAST(N'2022-04-15T20:50:23.4440000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T20:50:23.4440000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'833e2f91-4340-4ef0-b703-763eff86bd23', N'ww241125-8708-400e-9edd-02e487548125', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1651479998/pdf/srbc5ip69gw3l85smnnn.pdf', N'OZL31011', CAST(N'2022-05-02T15:26:42.3270000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:26:42.3270000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'88ca680d-30a9-4603-a091-54fd902bb629', N'6d77a0ce-3dc8-4ac9-9f00-31eadbd9ff7e', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1651479843/pdf/s9p0bbgivtovr4qinhx1.pdf', N'ZHM00656', CAST(N'2022-05-02T15:24:07.4250000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:24:07.4250000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'c0c35c33-ac73-4816-8221-5b5ba533363c', N'ww241125-8708-400e-9edd-02e487548125', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1651480325/pdf/ddsj58btkwbh9nwvqajs.pdf', N'GAJ01809', CAST(N'2022-05-02T15:32:09.4400000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:09.4400000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'c46e954f-72a5-4d73-95ad-9e2875760018', N'c757767a-da3e-4015-9deb-3080614e6ab5', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1650024382/pdf/xsyxp4flcvokvkduo6zj.pdf', N'WTC20834', CAST(N'2022-04-15T19:06:22.9290000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T19:06:22.9290000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'd64c7dec-34df-4890-8217-8eed726bf42b', N'c757767a-da3e-4015-9deb-3080614e6ab5', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1650027033/pdf/y7c58rihvixjflt3p67j.pdf', N'QGF31590', CAST(N'2022-04-15T19:50:33.6160000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T19:50:33.6160000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'db3f1684-e5cb-4d8c-bd33-bfe97a7046bc', N'6d77a0ce-3dc8-4ac9-9f00-31eadbd9ff7e', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1651480322/pdf/dgqa30wun7ee4wnp6r3b.pdf', N'UPT01540', CAST(N'2022-05-02T15:32:06.2740000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:06.2740000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'f24b6fdb-160b-4bb8-ab3d-301479d4555d', N'ww241125-8708-400e-9edd-02e487548125', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1651479841/pdf/gfq7liptjez6ccgva92j.pdf', N'CRW01080', CAST(N'2022-05-02T15:24:05.2200000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:24:05.2200000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'f698d2d9-6979-473d-8cac-f55d987b0085', N'6d77a0ce-3dc8-4ac9-9f00-31eadbd9ff7e', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1650912511/pdf/wwmlx95fwvyss090wkhe.pdf', N'YTI30497', CAST(N'2022-04-26T01:48:32.5670000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T01:48:32.5670000+07:00' AS DateTimeOffset))
INSERT [dbo].[Contract] ([id], [investmentId], [status], [contractUrl], [contractCode], [createdAt], [updatedAt]) VALUES (N'fbfe850b-a824-4925-b05a-b009dac0be40', N'6d77a0ce-3dc8-4ac9-9f00-31eadbd9ff7e', N'ACTIVE', N'https://res.cloudinary.com/larrytran/image/upload/v1651479990/pdf/knjebmwnbvvsyrefltls.pdf', N'UOK30724', CAST(N'2022-05-02T15:26:34.7170000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:26:34.7170000+07:00' AS DateTimeOffset))
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'05c07616-ecd4-4092-9ce0-6c65b8817d01', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'INVESTED', 20000000, CAST(N'2022-04-15T20:50:18.5850000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T20:50:20.8990000+07:00' AS DateTimeOffset), N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', N'99aa6486-6059-4fd0-8998-465775d071be', 1)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'0c424176-852a-4f72-b99f-41782fab4dcd', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 100000, CAST(N'2022-04-26T00:36:41.3140000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T00:37:17.9570000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0025)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'11648733-cf4e-4711-9b12-975f5d9b523c', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 1000000, CAST(N'2022-04-26T10:47:27.3560000+07:00' AS DateTimeOffset), CAST(N'2022-05-03T22:35:48.4630000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.025)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'27d4ff53-6c4c-4c19-a898-000f29476f78', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 100000, CAST(N'2022-04-26T00:28:24.6950000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T00:36:33.1270000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0025)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'3499a164-89db-4522-8a1a-efe7119653ab', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T14:03:23.2250000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T14:03:26.4520000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'35a5dd2c-40b9-411e-9a9c-ced594a5dc53', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'INVESTED', 1000000, CAST(N'2022-05-04T01:02:09.4670000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4670000+07:00' AS DateTimeOffset), N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', NULL, 1)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'5735b2a6-c6c2-47fd-b223-1b1a69517532', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'INVESTED', 1000000, CAST(N'2022-05-04T22:54:51.7620000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7620000+07:00' AS DateTimeOffset), N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', NULL, 1)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'61400fdd-8b1f-4e51-b897-9008617a3dea', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 1000000, CAST(N'2022-05-04T13:12:42.9200000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T14:02:56.9450000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.025)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'6d77a0ce-3dc8-4ac9-9f00-31eadbd9ff7e', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'INVESTED', 70000000, CAST(N'2022-04-24T21:49:31.6960000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T01:48:30.3780000+07:00' AS DateTimeOffset), N'22874fd0-4ebf-48b2-a33a-43843d0fea23', N'0247983f-9770-4ae3-a478-d492187f5de4', 1)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'7357ffc0-f9bf-42b7-b021-c8a1cfc4309d', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T12:57:29.9140000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T12:58:15.5250000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'93be9bd4-4ed7-42e1-9173-23383aabf823', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 1000000, CAST(N'2022-04-26T01:39:48.7620000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T10:24:51.1460000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.025)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'a4dcd677-650f-4e12-9ae9-a1a73b6efb49', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T13:00:10.1030000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T13:01:42.5640000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'a6eef0f2-d003-4ac6-a949-ba98a452e601', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T12:58:21.7190000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T12:59:08.1520000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'a883a67b-e2f9-4211-9039-8988f49d9b07', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T12:56:48.2470000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T12:57:23.9090000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'a8a663c3-a017-40c0-9058-2078692f6ddd', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T12:55:17.9670000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T12:56:40.4610000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'b595a526-df39-4986-ae51-fbdf38e320e6', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 1350000, CAST(N'2022-04-16T11:07:52.5900000+07:00' AS DateTimeOffset), CAST(N'2022-04-22T01:23:54.6610000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.03375)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'c757767a-da3e-4015-9deb-3080614e6ab5', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'INVESTED', 21000000, CAST(N'2022-04-15T18:50:29.2430000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T19:50:31.9640000+07:00' AS DateTimeOffset), N'1dw6s097-9dzf-4555-8249-6b0a98caf702', N'a6029d52-7afd-41ea-9553-399e3c858b29', 1)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'e2426375-95d6-4e79-8d36-a4b276fcc6eb', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 100000, CAST(N'2022-04-15T15:27:35.1060000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T18:50:13.6530000+07:00' AS DateTimeOffset), N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, 0.0047619047619047623)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'e8c41125-8708-400e-9edd-02e487548125', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 100000, CAST(N'2022-04-15T01:09:54.6260000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T15:27:05.6480000+07:00' AS DateTimeOffset), N'1dw6s097-9dzf-4555-8249-6b0a98caf702', N'05fd0756-8d46-44a0-8f2b-bd64f16c9a4c', 0.0047619047619047623)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'f353d398-e683-417e-b862-7c4b482a7f89', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T12:59:15.6820000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T12:59:41.1760000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'f6b44403-95dd-4eaa-9fba-b07af6e61b9c', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T12:59:47.3290000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T13:00:04.1680000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'ff464a49-3916-4ab1-ad39-d6a27fe0f0a7', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'CANCEL', 500000, CAST(N'2022-05-04T13:04:05.1620000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T13:12:28.1460000+07:00' AS DateTimeOffset), N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', NULL, 0.0125)
INSERT [dbo].[Investment] ([id], [investorId], [status], [total], [createdAt], [updatedAt], [loanId], [transactionId], [percent]) VALUES (N'ww241125-8708-400e-9edd-02e487548125', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'INVESTED', 6000000, CAST(N'2022-04-15T01:09:54.6260000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.2370000+07:00' AS DateTimeOffset), N'22874fd0-4ebf-48b2-a33a-43843d0fea23', N'e985e426-6281-4560-8815-569d77cd9431', 0.0047619047619047623)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'047cb36e-b896-4fd6-9f67-31cf1393065b', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-10T00:57:48.4010000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'092b4960-1814-410e-99c3-c50d17338d81', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-10T01:00:37.0020000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'1111', CAST(N'2022-04-10T00:59:23.5910000+07:00' AS DateTimeOffset), N'dddd', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'0ecfb4a1-ffcd-4243-94a1-b785a48d3e1d', N'ACTIVE', NULL, CAST(N'2022-04-24T21:25:09.8180000+07:00' AS DateTimeOffset), CAST(N'2022-04-24T21:25:09.8180000+07:00' AS DateTimeOffset), N'ec0bafb5-f73f-4527-9f63-ca8d58772c86', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'13fbcbc8-ca8b-4c24-bfe3-d3ab0a202c4a', N'ACTIVE', NULL, CAST(N'2022-04-16T00:04:56.5750000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:04:56.5750000+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'23cf1100-zsa3-4477-8d38-80d180588836', N'ACTIVE', N'27cf1100-zsa3-4477-8d38-80d180588836', CAST(N'2022-02-16T09:22:58.7640000+00:00' AS DateTimeOffset), CAST(N'2022-02-16T09:22:58.7640000+00:00' AS DateTimeOffset), N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'3123123123', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), N'Đồng Tháp', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'27cf1100-zsa3-4477-8d38-80d180588836', N'ACTIVE', NULL, CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'2e47c6f6-a44a-4c4e-a431-00bca3d121d7', N'ACTIVE', N'13fbcbc8-ca8b-4c24-bfe3-d3ab0a202c4a', CAST(N'2022-04-16T00:04:56.6030000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:04:56.6030000+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'2k9455x2-6y5f-4aaa-876b-e55e1f093023', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2021-10-19T08:11:53.5050000+00:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'123123123', CAST(N'2021-10-19T08:11:53.5050000+00:00' AS DateTimeOffset), N'Thanh Hóa', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'33ece53e-cc68-4459-8aa6-b02e73e98fc0', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-10T01:01:19.0580000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'11112', CAST(N'2022-04-10T01:01:04.2880000+07:00' AS DateTimeOffset), N'dddd2', N'http://res.cloudinary.com/larrytran/image/upload/v1649527277/file/1649527273734-7ec01a58-7bb6-4628-b259-e930c1ab02a3.jpg', N'http://res.cloudinary.com/larrytran/image/upload/v1649527275/file/1649527273638-ad40f6d6-bc55-4360-a89d-ce4c2a2cc75c.jpg')
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'437627dc-9885-4f85-b0aa-14783d190379', N'ACTIVE', NULL, CAST(N'2022-04-16T00:35:16.0700000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:35:16.0700000+07:00' AS DateTimeOffset), N'71fd0fe1-ce11-495e-8966-ab0a357b124c', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'5bb92641-0384-40a1-b77e-7283d5245772', N'ACTIVE', N'0ecfb4a1-ffcd-4243-94a1-b785a48d3e1d', CAST(N'2022-04-24T21:25:09.8470000+07:00' AS DateTimeOffset), CAST(N'2022-04-24T21:25:09.8470000+07:00' AS DateTimeOffset), N'ec0bafb5-f73f-4527-9f63-ca8d58772c86', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'64d7a5d8-7c60-482a-9b10-eadc773f8e0c', N'ACTIVE', NULL, CAST(N'2022-04-16T00:06:00.7010000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:06:00.7010000+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'71f6308e-a889-4bff-a7eb-fb0c59556916', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-09T22:20:33.5690000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'11111111111', NULL, N'Mỹ', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'865b6fd9-d33f-4a1d-a164-c231a205e388', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-10T01:03:09.6900000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'1111', CAST(N'2022-04-10T01:03:01.0200000+07:00' AS DateTimeOffset), N'dddd', N'http://res.cloudinary.com/larrytran/image/upload/v1649527386/file/1649527385852-7467bfcd-318a-40b7-b761-6e1ba08a9659.png', N'http://res.cloudinary.com/larrytran/image/upload/v1649527388/file/1649527384683-41cea10a-6e02-4d29-bff3-1986c2dbbb22.jpg')
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'8cdd7b9c-54a7-4129-ae0a-66f0f6f1eb64', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-10T00:59:10.7990000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', N'ACTIVE', NULL, CAST(N'2022-02-16T09:22:58.8810000+00:00' AS DateTimeOffset), CAST(N'2022-02-16T09:22:58.8810000+00:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'9s8nv100-zsa3-4477-8d38-80d180588836', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2021-10-19T08:11:53.5050000+00:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'213423123', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), N'Hà Nội', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'a04659c3-8606-4146-86fd-9b206c22879c', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-09T22:23:46.2740000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'1111111112', NULL, N'Mỹ', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'c0f89bac-6968-4473-9a3b-3a36b7597dd7', N'ACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-05-04T15:44:19.4540000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4540000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'', CAST(N'2022-05-04T15:44:06.7340000+07:00' AS DateTimeOffset), N'', N'http://res.cloudinary.com/larrytran/image/upload/v1651653857/file/1651653856962-f504c1d9-230f-4462-a0f4-47c11dd34101.jpg', N'http://res.cloudinary.com/larrytran/image/upload/v1651653857/file/1651653856954-5a917051-dcfb-4084-ba5e-77d674b221fa.jpg')
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'c1e8c998-2a2b-451d-9d4e-a5bfc8602d27', N'ACTIVE', N'64d7a5d8-7c60-482a-9b10-eadc773f8e0c', CAST(N'2022-04-16T00:06:00.7290000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:06:00.7290000+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'c563c8e4-cdb3-440a-a156-4a850797407f', N'ACTIVE', N'437627dc-9885-4f85-b0aa-14783d190379', CAST(N'2022-04-16T00:35:16.0980000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:35:16.0980000+07:00' AS DateTimeOffset), N'71fd0fe1-ce11-495e-8966-ab0a357b124c', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'c88590f9-ff2c-4d03-93aa-0fbed9a48f1e', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-09T22:26:07.6200000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'1111111112', NULL, N'Mỹ', NULL, NULL)
INSERT [dbo].[Investor] ([id], [status], [parentId], [createdAt], [updatedAt], [userId], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [frontCitizenCardImageUrl], [backCitizenCardImageUrl]) VALUES (N'cc5b352e-dbb4-4ec2-8370-3b6edcebdfba', N'INACTIVE', N'9c817f7d-b06d-42a7-b878-8eb72499f8e9', CAST(N'2022-04-10T01:00:10.9050000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4380000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'1111', CAST(N'2022-04-10T00:59:23.5910000+07:00' AS DateTimeOffset), N'dddd', NULL, NULL)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'1dw6s097-9dzf-4555-8249-6b0a98caf702', 21000000, 0.01, N'Tình hình dịch bệnh phức tạp ở Việt Nam hiện nay khiến cho kinh tế nhiều gia đình khó khăn và gia đình em cũng không ngoại lệ. Do đó em mong muốn kêu gọi sự đầu tư từ những nhà hảo tâm cho em xin được vay mượn số tiền 70 triệu đồng cho khoản học phí kỳ 8. Em xin vô cùng biết ơn và hứa sẽ hoàn thành tốt việc học và thanh toán khoản nợ trong thời gian sớm nhất.', 22, CAST(N'2022-04-15T19:50:31.3470000+07:00' AS DateTimeOffset), CAST(N'2024-02-15T19:50:31.3470000+07:00' AS DateTimeOffset), CAST(N'2022-04-10T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-05-18T08:13:12.0530000+00:00' AS DateTimeOffset), N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', N'Khoảng vay cho học phí kỳ 5', 6, 20000000, 200000, 0.05)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 10000000, 0.01, N'Tình hình dịch bệnh phức tạp ở Việt Nam hiện nay khiến cho kinh tế nhiều gia đình khó khăn và gia đình em cũng không ngoại lệ. Do đó em mong muốn kêu gọi sự đầu tư từ những nhà hảo tâm cho em xin được vay mượn số tiền 70 triệu đồng cho khoản học phí kỳ 8. Em xin vô cùng biết ơn và hứa sẽ hoàn thành tốt việc học và thanh toán khoản nợ trong thời gian sớm nhất.', 12, CAST(N'2022-04-15T07:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2023-04-15T07:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2022-03-15T07:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T07:00:00.0000000+07:00' AS DateTimeOffset), N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', N'Khoảng vay cho học phí kỳ 5', 6, 100000, 200000, 0.05)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'22874fd0-4ebf-48b2-a33a-43843d0fea23', 6000000, 0.01, N'Tình hình dịch bệnh phức tạp ở Việt Nam hiện nay khiến cho kinh tế nhiều gia đình khó khăn và gia đình em cũng không ngoại lệ. Do đó em mong muốn kêu gọi sự đầu tư từ những nhà hảo tâm cho em xin được vay mượn số tiền 70 triệu đồng cho khoản học phí kỳ 8. Em xin vô cùng biết ơn và hứa sẽ hoàn thành tốt việc học và thanh toán khoản nợ trong thời gian sớm nhất.', 24, CAST(N'2022-05-02T15:32:01.0690000+07:00' AS DateTimeOffset), CAST(N'2024-05-02T15:32:01.0690000+07:00' AS DateTimeOffset), CAST(N'2022-04-10T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-05-10T08:13:12.0530000+00:00' AS DateTimeOffset), N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', N'Khoảng vay cho học phí kỳ 8', 12, 20000000, 200000, 0.05)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', 40000000, 0.01, N'Tình hình dịch bệnh phức tạp ở Việt Nam hiện nay khiến cho kinh tế nhiều gia đình khó khăn và gia đình em cũng không ngoại lệ. Do đó em mong muốn kêu gọi sự đầu tư từ những nhà hảo tâm cho em xin được vay mượn số tiền 70 triệu đồng cho khoản học phí kỳ 8. Em xin vô cùng biết ơn và hứa sẽ hoàn thành tốt việc học và thanh toán khoản nợ trong thời gian sớm nhất.', 24, NULL, NULL, CAST(N'2022-04-10T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-05-10T08:13:12.0530000+00:00' AS DateTimeOffset), N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', N'Khoảng vay đóng học phí kì 8', 12, 20000000, 200000, 0.05)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 10000000, 0.01, N'Tình hình dịch bệnh phức tạp ở Việt Nam hiện nay khiến cho kinh tế nhiều gia đình khó khăn và gia đình em cũng không ngoại lệ. Do đó em mong muốn kêu gọi sự đầu tư từ những nhà hảo tâm cho em xin được vay mượn số tiền 70 triệu đồng cho khoản học phí kỳ 8. Em xin vô cùng biết ơn và hứa sẽ hoàn thành tốt việc học và thanh toán khoản nợ trong thời gian sớm nhất.', 12, CAST(N'2022-04-15T07:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2023-04-15T07:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2022-03-15T07:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T07:00:00.0000000+07:00' AS DateTimeOffset), N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', N'Khoảng vay cho học phí kỳ 5', 6, 100000, 200000, 0.05)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', 20000000, 0.01, N'Tình hình', 20, CAST(N'2022-04-15T20:50:20.8660000+07:00' AS DateTimeOffset), CAST(N'2023-12-15T20:50:20.8660000+07:00' AS DateTimeOffset), CAST(N'2022-04-10T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-05-10T08:13:12.0530000+00:00' AS DateTimeOffset), N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', N'Khoản vay', 10, 20000000, 200000, 0.05)
INSERT [dbo].[Loan] ([id], [totalMoney], [interest], [description], [duration], [loanStartAt], [loanEndAt], [postCreatedAt], [postExpireAt], [studentId], [title], [expectedGraduationTime], [expectedMoney], [fixedMoney], [penaltyFee]) VALUES (N'dfde2405-4572-4c96-a8e6-e8d2173527cb', 23123, 0.01, NULL, 123, NULL, NULL, CAST(N'2022-04-21T15:14:42.5160000+07:00' AS DateTimeOffset), CAST(N'2022-05-08T07:00:00.0000000+07:00' AS DateTimeOffset), N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', NULL, 14, NULL, 200000, 0.02)
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'024115bc-dff4-4120-b26f-f5c5e1a453e9', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-05-02T15:14:20.2140000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'0631d60c-7f35-4487-96d4-387c5d5f3c58', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:10:30.8710000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'0b5f34f8-1bf2-4d68-9f4f-ec6c3118bdfe', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-20T00:23:00.5790000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'0ll6s866-0dzf-4525-8149-6j0a9ncaf702', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', N'FUNDING', 0, N'Đã xác nhận bởi Đinh Phú Cường', CAST(N'2022-03-01T14:15:07.6530000+00:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'133997e2-625f-451b-88a4-8e63197379cb', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:21:40.9430000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'18b81e4c-89d6-4d6d-90e5-df6d6a9d785b', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-15T21:16:20.8150000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'1b5f02ac-3f65-41df-9f22-daebf119dfc9', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'FINISH', 1, NULL, CAST(N'2022-05-02T15:05:40.9980000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9980000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'1eb2491c-1f02-4d23-843f-d198f0710d75', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-15T21:15:10.7240000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'2334260f-47ac-4117-b6ba-c7c54aba34d4', N'dfde2405-4572-4c96-a8e6-e8d2173527cb', NULL, N'DRAFT', 1, NULL, CAST(N'2022-04-21T15:14:42.7830000+07:00' AS DateTimeOffset), CAST(N'2022-04-21T15:14:42.7830000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'251281f3-64fc-4c5d-891c-cb362e951cbb', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-15T21:18:20.0890000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'2e546be5-49b1-48d0-9934-526b85d6f106', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-05-02T15:23:20.0940000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'3c00ffc5-e664-495a-ba05-40d1155e830d', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FUNDING', 0, NULL, CAST(N'2022-04-15T18:53:41.0880000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'40483666-9a80-4733-bae4-7fea6d429018', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-05-02T15:12:50.5200000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'41c7a5a3-ebd2-4912-a5c3-7b07b3c48e34', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-15T20:50:20.8900000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'46c8e5e6-dd2d-45d0-8753-54dabaefe453', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', N'FUNDING', 0, N'Đã xác nhận bởi Đinh Phú Cường', CAST(N'2022-04-15T00:36:00.9480000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'63c7df88-7252-4aec-af11-08ed2aa7456d', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-04-26T01:48:30.3940000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'698346e0-c24a-4bdf-9811-2d2cb3a47b80', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-15T19:50:31.3640000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'6e11ea51-041f-4f24-902f-8295496e8701', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-15T21:19:20.4570000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'77d6s0ss-0dzf-4525-8149-6j0a9ncaf702', N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', N'FUNDING', 1, N'Đã xác nhận bởi Đinh Phú Cường', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-04-14T00:30:30.4940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'8463340c-421e-4cd5-9cad-91f7888c3e0f', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', NULL, N'ONGOING', 0, NULL, CAST(N'2022-04-19T22:53:10.5680000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:05:40.9660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'91c4a697-416f-41bf-9ae2-488380dabfe2', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FUNDING', 0, NULL, CAST(N'2022-04-15T19:05:31.1310000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'a4cc315e-9cb2-4366-9323-6e583e93c326', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:24:00.4920000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'a5601e09-3634-45da-ad7c-bc8554c0df27', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FUNDING', 0, NULL, CAST(N'2022-04-15T19:08:01.0050000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'ac9f4aef-ea5b-458f-b339-47e95901d68b', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FINISH', 1, NULL, CAST(N'2022-04-19T22:52:50.4960000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.4960000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'b3162748-f1bf-4dcf-afd0-35ad387ca3f5', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', NULL, N'ONGOING', 1, NULL, CAST(N'2022-05-04T22:54:51.7230000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7300000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'b9410a69-f655-4b0b-9a4d-6dd601292023', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', NULL, N'ONGOING', 1, NULL, CAST(N'2022-05-04T01:02:09.4400000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4480000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'ba5985bc-b03b-4596-ae6f-8f70f35326a9', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:32:01.1050000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'bbf8a861-5e98-43af-8412-00660abb49eb', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-05-02T15:26:30.5870000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'bf5b6125-9680-422e-9a51-d9fe24c3c2fc', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:26:20.5730000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'c310f284-9899-48f8-bfa2-1e63be520fe8', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FUNDING', 0, NULL, CAST(N'2022-04-15T19:06:20.6870000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'c8c9abbc-8bee-4e56-84a0-5ef07454673c', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FINISH', 1, NULL, CAST(N'2022-05-02T15:40:01.0140000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:01.0140000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'ce7341b0-f8f7-4d43-a0f8-fceff9e4107e', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', N'FUNDING', 0, N'Đã xác nhận bởi Đinh Phú Cường', CAST(N'2022-04-14T00:22:34.2640000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'e0b80c34-74fb-4f63-ba6e-526e5e1999ac', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FUNDING', 0, NULL, CAST(N'2022-04-15T18:55:10.2340000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'f381f699-f242-4b13-952c-ebad780fd0dc', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:13:30.8800000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'f77a0cf1-707c-4823-b132-8e84f1d58ba4', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-05-02T15:09:40.6720000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'f827bc9d-0845-4a45-b0f1-ef0e66c6c2f6', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', NULL, N'FINISH', 0, NULL, CAST(N'2022-04-15T21:15:10.7290000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T22:52:50.3940000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'f8c37710-d5eb-4363-be16-97bf790334a4', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'FUNDING', 0, NULL, CAST(N'2022-05-02T15:25:20.0440000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistory] ([id], [loanId], [adminId], [type], [isActive], [description], [createdAt], [updatedAt]) VALUES (N'fc7dcecb-87b9-4cb8-9e3a-5aeec5b7396d', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ONGOING', 0, NULL, CAST(N'2022-05-02T15:07:30.8010000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:40:00.9890000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistoryImage] ([id], [loanHistoryId], [imageUrl], [status], [createdAt], [updatedAt]) VALUES (N'27j6sfbs-0dzf-4525-8149-6j0a9ncaf702', N'77d6s0ss-0dzf-4525-8149-6j0a9ncaf702', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'ACTIVE', CAST(N'2024-05-20T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2024-05-20T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanHistoryImage] ([id], [loanHistoryId], [imageUrl], [status], [createdAt], [updatedAt]) VALUES (N'j8h7b1b0-f8f7-4d43-a0f8-fceff9e4107e', N'ce7341b0-f8f7-4d43-a0f8-fceff9e4107e', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'ACTIVE', CAST(N'2022-04-15T00:36:00.9480000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T00:36:00.9480000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'126awjd0-4ebf-48b2-a33a-43843d0fea23', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'DEMANDNOTE', N'ACTIVE', CAST(N'2022-01-20T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-01-20T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'24774ad0-4ebf-48b2-a33a-43843d0fea23', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', N'Video giới thiệu bản thân', N'AVAc1gYLZK0', N'VIDEO', N'ACTIVE', CAST(N'2022-01-28T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-01-28T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'2hn6s7h3-0dzf-4525-8149-6j0a9ncaf702', N'1dw6s097-9dzf-4555-8249-6b0a98caf702', N'Giấy báo học phí 3', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'DEMANDNOTE', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'3f88c592-55bd-47e5-85b0-7ba763cf7e45', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'TRANSCRIPT', N'ACTIVE', CAST(N'2022-05-04T01:02:09.4630000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4630000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'8c6b25dd-b189-4f68-bcde-16f8c2e93686', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'STUDENTCERT', N'ACTIVE', CAST(N'2022-05-04T22:54:51.7490000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7490000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'ace05c0f-176f-4016-9b8b-ddc5d7fd2b0d', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'TRANSCRIPT', N'ACTIVE', CAST(N'2022-05-04T22:54:51.7560000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7560000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'b1bdf4b9-ecde-4270-8706-5fc16377bcf9', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'STUDENTCERT', N'ACTIVE', CAST(N'2022-05-04T01:02:09.4570000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4570000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'd0337029-ff06-4df2-8a59-006dfb5d2c59', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'DEMANDNOTE', N'ACTIVE', CAST(N'2022-05-04T22:54:51.7400000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7400000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'e6acabdf-249c-452f-9e1e-e2f58112aad4', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', N'Giấy báo học phí', N'https://res.cloudinary.com/larrytran/image/upload/v1649607121/file/scan0244_v1fnpw.jpg', N'DEMANDNOTE', N'ACTIVE', CAST(N'2022-05-04T01:02:09.4520000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4520000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'ioa74f20-4ebf-48b2-a33a-43843d0fea23', N'22874fd0-4ebf-48b2-a33a-43843d0fea23', N'Giấy xác nhận sinh viên', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'STUDENTCERT', N'ACTIVE', CAST(N'2024-05-20T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2024-05-20T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'j89ss7h3-jizf-4525-8149-6j0a9ncaf702', N'9oz6s888-0dzf-4525-8149-6j0a9ncaf702', N'Giấy báo học phí 1', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'DEMANDNOTE', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'sm88s0a7-0wzf-4525-8149-6j0a9ncaf702', N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', N'Bảng điểm', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'TRANSCRIPT', N'ACTIVE', CAST(N'2023-12-15T20:50:20.8660000+07:00' AS DateTimeOffset), CAST(N'2023-12-15T20:50:20.8660000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanMedia] ([id], [loanId], [description], [imageUrl], [type], [status], [createdAt], [updatedAt]) VALUES (N'snj6s023-0dzf-4525-8149-6j0a9ncaf702', N'3sz6s097-0dzf-4525-8149-6j0a9ncaf702', N'Giấy báo học phí 2', N'https://nctu.edu.vn/uploads/student/2021_08/huongdan-mau-vayvon.png', N'DEMANDNOTE', N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'0c7fe331-9611-49a8-b0f0-11b12e49f541', 1666667, CAST(N'2022-12-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2023-01-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'13bf1234-815c-4a41-bee0-43eaff1c4528', 1666667, CAST(N'2022-11-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-12-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'167297b1-19d2-4a05-8eda-910861c67844', 200000, CAST(N'2022-04-04T22:55:51.7760000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:51.7760000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 10000, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:56:00.3390000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'249ea5e9-d286-4e6a-aff1-b612c2626a2b', 200000, CAST(N'2022-03-04T22:55:51.7760000+07:00' AS DateTimeOffset), CAST(N'2022-04-04T22:55:51.7760000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 10000, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8400000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'45f46fdc-927a-4ae7-adb8-af1c77141650', 1666667, CAST(N'2022-09-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2022-10-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'4b9844a2-6950-4fd0-a235-8b3a09ad5be3', 200000, CAST(N'2022-01-04T01:03:09.4710000+07:00' AS DateTimeOffset), CAST(N'2022-02-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 10000, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:10.6500000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'4c9c0538-6d18-4b40-b82c-5bdf78a24e7b', 1666667, CAST(N'2022-07-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-08-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'4ebab96b-7683-42df-a88d-192d61e331cf', 1666667, CAST(N'2022-10-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2022-11-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'5ed86367-daf0-4b9d-a231-2b51747383b0', 200000, CAST(N'2022-05-04T22:55:51.7760000+07:00' AS DateTimeOffset), CAST(N'2022-06-04T22:55:51.7760000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'627926d4-5539-42b5-8fcf-fccaa40c29e5', 200000, CAST(N'2022-06-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-07-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'745dd7ba-38ef-41b9-93ca-f5f88c03de47', 200000, CAST(N'2022-03-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-04-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 10000, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:10.6520000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'764e8633-c200-4bbf-b4bd-353888f2d312', 200000, CAST(N'2022-01-04T22:55:51.7750000+07:00' AS DateTimeOffset), CAST(N'2022-02-04T22:55:51.7760000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 10000, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8410000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'9b2d99a3-a059-4f8b-bffa-469bc8f3e6f4', 1666667, CAST(N'2022-08-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2022-09-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'9f57a53e-d535-4ba6-8d0e-d3e6d51f36fe', 200000, CAST(N'2022-02-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-03-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 10000, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:10.6530000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'aa77882f-d4e6-4cec-bbbc-4e2ae749f52c', 1666667, CAST(N'2022-08-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-09-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'b0d0e2e1-71e1-4f83-bd99-3a2fc117a16c', 200000, CAST(N'2022-06-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2022-07-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'b6b79fe4-54b5-43da-9e79-580b4743159c', 1666667, CAST(N'2022-11-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2022-12-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'b7b35846-b48b-4d7e-baf3-25710950628f', 1666667, CAST(N'2022-09-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-10-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'c721df8e-dd20-46a2-aca9-30a91927c777', 200000, CAST(N'2022-02-04T22:55:51.7760000+07:00' AS DateTimeOffset), CAST(N'2022-03-04T22:55:51.7760000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 10000, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8410000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'dd2fb081-2bac-4364-a4f9-0296494ad266', 200000, CAST(N'2022-05-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-06-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'e345bf45-063a-4261-8c73-9544dec90bb2', 1666667, CAST(N'2022-10-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-11-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'e655a534-a6a8-4518-8369-201d6ea2a41d', 1666667, CAST(N'2022-12-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2023-01-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 0, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'e807a8dc-c778-4e61-9b66-c45df1f08886', 1666667, CAST(N'2022-07-04T22:55:51.7770000+07:00' AS DateTimeOffset), CAST(N'2022-08-04T22:55:51.7770000+07:00' AS DateTimeOffset), N'GRADUATED_PAID', N'ONGOING', N'4bf8105e-3e1a-4d98-a849-c7d081e9774f', 0, CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:54:51.7780000+07:00' AS DateTimeOffset))
INSERT [dbo].[LoanSchedule] ([id], [money], [startAt], [endAt], [type], [status], [loanId], [penaltyMoney], [createdAt], [updatedAt]) VALUES (N'ec7be40e-0360-43f8-9097-03b858e191f5', 200000, CAST(N'2022-04-04T01:03:09.4720000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:03:09.4720000+07:00' AS DateTimeOffset), N'STUDYING_PAID', N'INCOMPLETE', N'1e4e60dd-d490-49a7-a9f8-05aedcafff9d', 10000, CAST(N'2022-05-04T01:02:09.4730000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T01:03:10.1350000+07:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'11cdqweb-0aef-4r13-9ec6-7c69beac2452', N'Công nghệ thông tin', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:13:03.9820000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'15aw2eew-0aef-4r13-9ec6-7a63skec2494', N'Trí tuệ nhân tạo', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'1613b1c6-ec66-4801-85c3-992c26276112', N'Điện tử', N'ACTIVE', CAST(N'2022-04-05T08:21:48.0790000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:56:58.9320000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'315a6cc8-4264-43af-9745-9d61ec63ff79', N'Đánh', N'INACTIVE', CAST(N'2022-04-05T10:01:37.0470000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:01:39.3360000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'33cd2web-0aef-4r13-9ec6-7a69bexc2454', N'Kỹ thuật phần mềm', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'41cdqssb-0aef-4r13-9ec6-7c69bzzc2452', N'Thiết kế đồ họa', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:56:46.8890000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'6ac8f737-f09a-4df0-a8ae-368c7c29c3a9', N'Nhảy', N'INACTIVE', CAST(N'2022-04-05T09:11:40.4780000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:30:20.4630000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'6d500d24-9768-448e-9049-a57b4f267490', N'Nhảy 2', N'INACTIVE', CAST(N'2022-04-05T09:44:43.6160000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:00:08.3720000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'81cd2web-0aef-4r13-9ec6-7a69bexc2454', N'Kinh doanh quốc tế', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:01:27.1650000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'843b9efb-e67f-4676-adb1-56ba8974b585', N'Haha hi hi', N'INACTIVE', CAST(N'2022-04-05T10:13:11.5060000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:13:11.5060000+00:00' AS DateTimeOffset))
INSERT [dbo].[Major] ([id], [name], [status], [createdAt], [updatedAt]) VALUES (N'e2c3e538-936e-46b4-9cee-8227ee650f38', N'Bay', N'INACTIVE', CAST(N'2022-04-05T09:06:09.4930000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:30:03.0740000+00:00' AS DateTimeOffset))
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'010f230f-7ca0-427c-b17a-5399353d4c76', N'ACTIVE', N'myapp://investmentDetail/5735b2a6-c6c2-47fd-b223-1b1a69517532', N'Khoản thanh toán vay bị trễ hạn', CAST(N'2022-05-04T22:55:00.8790000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8790000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'1fb1a2cc-544c-49d9-b8c7-26c20bc8065a', N'ACTIVE', N'https://studentloanfpt.ddns.net/trang-chu/ho-so/xem/undefined', N'Bạn đã không hoàn thành khoản thanh toán vay đúng hạn. Khoản vay sẽ được áp dụng phí phạt như trong điểu khoản.', CAST(N'2022-05-04T22:56:00.3390000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:56:00.3390000+07:00' AS DateTimeOffset), N'2de6b097-9ddf-4596-8249-6b0a98caf758', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'29730ec8-02c5-4646-939a-2d783a745442', N'ACTIVE', N'myapp://investmentDetail/oo92sfd0-49bf-48b2-a33a-43843d0fea23', N'Sinh viên không thanh toán kỳ hạn nhiều hơn 3 lần.', CAST(N'2022-05-04T22:56:00.3590000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:56:00.3590000+07:00' AS DateTimeOffset), N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'62e7e9f1-5906-4d2b-a686-872443383bd3', N'ACTIVE', N'https://studentloanfpt.ddns.net/trang-chu/ho-so/xem/undefined', N'Bạn đã không hoàn thành khoản thanh toán vay đúng hạn. Khoản vay sẽ được áp dụng phí phạt như trong điểu khoản.', CAST(N'2022-05-04T22:55:00.8400000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8400000+07:00' AS DateTimeOffset), N'2de6b097-9ddf-4596-8249-6b0a98caf758', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'68eac81a-d80a-4d2e-be51-c1b5519ecadc', N'ACTIVE', N'https://studentloanfpt.ddns.net/trang-chu/ho-so/xem/undefined', N'Bạn đã không hoàn thành khoản thanh toán vay đúng hạn. Khoản vay sẽ được áp dụng phí phạt như trong điểu khoản.', CAST(N'2022-05-04T22:55:00.8410000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8410000+07:00' AS DateTimeOffset), N'2de6b097-9ddf-4596-8249-6b0a98caf758', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'9aff8be9-911a-4483-8dfa-a7f73679f211', N'ACTIVE', N'myapp://investmentDetail/5735b2a6-c6c2-47fd-b223-1b1a69517532', N'Khoản thanh toán vay bị trễ hạn', CAST(N'2022-05-04T22:56:00.3470000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:56:00.3470000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'9ff4f033-5cd2-469d-a95b-edb5cb206b70', N'ACTIVE', N'https://studentloanfpt.ddns.net/trang-chu/ho-so/xem/undefined', N'Bạn đã không hoàn thành khoản thanh toán vay đúng hạn. Khoản vay sẽ được áp dụng phí phạt như trong điểu khoản.', CAST(N'2022-05-04T22:55:00.8420000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8420000+07:00' AS DateTimeOffset), N'2de6b097-9ddf-4596-8249-6b0a98caf758', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'b8dd443d-b700-4c37-8e3e-c23417d71df3', N'ACTIVE', N'myapp://investmentDetail/5735b2a6-c6c2-47fd-b223-1b1a69517532', N'Khoản thanh toán vay bị trễ hạn', CAST(N'2022-05-04T22:55:00.8620000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8620000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', 0, N'LOAN')
INSERT [dbo].[Notification] ([id], [status], [redirectUrl], [description], [createdAt], [updatedAt], [userId], [isRead], [type]) VALUES (N'f1b48035-3a19-4ff3-894c-48107c6b7613', N'ACTIVE', N'myapp://investmentDetail/5735b2a6-c6c2-47fd-b223-1b1a69517532', N'Khoản thanh toán vay bị trễ hạn', CAST(N'2022-05-04T22:55:00.8720000+07:00' AS DateTimeOffset), CAST(N'2022-05-04T22:55:00.8720000+07:00' AS DateTimeOffset), N'0c945982-6e5f-4aaa-876b-e55e1f093023', 0, N'LOAN')
INSERT [dbo].[School] ([id], [name], [city], [district], [status], [createdAt], [updatedAt]) VALUES (N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'Trường đại học FPT', N'HCM', N'District 9', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset))
INSERT [dbo].[School] ([id], [name], [city], [district], [status], [createdAt], [updatedAt]) VALUES (N'90hdzmki-0wwf-6r13-9ec6-7c69beac2452', N'Trường công nghệ thông tin', N'Đà Nẵng', N'District 10', N'ACTIVE', CAST(N'2022-04-05T10:13:03.9820000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:13:03.9820000+00:00' AS DateTimeOffset))
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'e2c3e538-936e-46b4-9cee-8227ee650f38', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'INACTIVE', CAST(N'2022-04-05T09:06:09.4930000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:30:03.1500000+00:00' AS DateTimeOffset), N'179767f4-3001-4e5c-af72-46a29c12bb9b')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'6d500d24-9768-448e-9049-a57b4f267490', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'INACTIVE', CAST(N'2022-04-05T09:44:43.6170000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:00:08.3790000+00:00' AS DateTimeOffset), N'2080d729-1577-4a81-b014-3a609d60018d')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'81cd2web-0aef-4r13-9ec6-7a69bexc2454', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:01:27.1830000+00:00' AS DateTimeOffset), N'25sw7jut-0aef-4c1-9ec6-7a69bexc2454 ')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'843b9efb-e67f-4676-adb1-56ba8974b585', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'ACTIVE', CAST(N'2022-04-05T10:13:11.5060000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:13:11.5060000+00:00' AS DateTimeOffset), N'2a81c187-ed6f-4a7f-86d9-133f40214302')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'1613b1c6-ec66-4801-85c3-992c26276112', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'ACTIVE', CAST(N'2022-04-05T08:21:48.0800000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:56:58.9390000+00:00' AS DateTimeOffset), N'2acc72a2-e796-4424-86b2-999cc04720b2')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'315a6cc8-4264-43af-9745-9d61ec63ff79', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'INACTIVE', CAST(N'2022-04-05T10:01:37.0480000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T10:01:39.3390000+00:00' AS DateTimeOffset), N'5f91b6f2-4617-44ab-9903-011ea7a4f919')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'41cdqssb-0aef-4r13-9ec6-7c69bzzc2452', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:56:46.8980000+00:00' AS DateTimeOffset), N'77csdaxb-0izf-6r17-9fc6-7z69beac2452')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'11cdqweb-0aef-4r13-9ec6-7c69beac2452', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T07:34:32.9670000+00:00' AS DateTimeOffset), N'90cmzaxb-0iof-6r17-9fc6-7z69beac2452')
INSERT [dbo].[SchoolMajor] ([majorId], [schoolId], [status], [createdAt], [updatedAt], [id]) VALUES (N'6ac8f737-f09a-4df0-a8ae-368c7c29c3a9', N'36cdzaeb-0wwf-6r13-9ec6-7c69beac2452', N'INACTIVE', CAST(N'2022-04-05T09:11:40.4780000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T09:30:20.4670000+00:00' AS DateTimeOffset), N'ba187a4c-a1f7-4a54-9608-c01f388b8c83')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), N'2de6b097-9ddf-4596-8249-6b0a98caf758', NULL, N'ACTIVE')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-19T08:13:12.0980000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0980000+00:00' AS DateTimeOffset), N'84874fd0-4ebf-48b2-a33a-43843d0fea23', NULL, N'ACTIVE')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'987s4mm0-4ebf-48b2-a33a-43843d0fea23', N'SE192237', NULL, NULL, NULL, NULL, N'231231242', CAST(N'2022-01-28T08:13:12.0530000+00:00' AS DateTimeOffset), N'TPHCM', N'0f5bf97b-7365-43bc-8c9e-d28c32cb7557', CAST(N'2022-01-28T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2022-01-28T08:13:12.0530000+00:00' AS DateTimeOffset), N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'90cmzaxb-0iof-6r17-9fc6-7z69beac2452', N'ACTIVE')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'i9o9sui0-46cf-48b2-a33a-43843d0fea23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-19T12:18:43.3910000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T12:18:43.3910000+00:00' AS DateTimeOffset), N'hj20sui0-46cf-48b2-a33a-43843d0fea23', NULL, N'ACTIVE')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'ii22s220-zzbf-48b2-a33a-43843d0fea23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', NULL, N'ACTIVE')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'sdo8sud0-46cf-48b2-a33a-43843d0fea23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'i9o9sui0-46cf-48b2-a33a-43843d0fea23', CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), N'hj20sui0-46cf-48b2-a33a-43843d0fea23', NULL, N'ACTIVE')
INSERT [dbo].[Student] ([id], [studentCardId], [frontCitizenCardImageUrl], [backCitizenCardImageUrl], [frontStudentCardImageUrl], [backStudentCardImageUrl], [citizenId], [citizenCardCreatedDate], [citizenCardCreatedPlace], [parentId], [createdAt], [updatedAt], [userId], [schoolMajorId], [status]) VALUES (N'z22i4kk0-4ebf-48b2-a33a-43843d0fea23', NULL, NULL, NULL, NULL, NULL, N'121312452', CAST(N'2021-04-05T12:18:43.6890000+00:00' AS DateTimeOffset), N'Đà nẵng', N'41cdafeb-0aef-4c17-9ec6-7c69beac2452', CAST(N'2021-04-05T12:18:43.6890000+00:00' AS DateTimeOffset), CAST(N'2021-04-05T12:18:43.6890000+00:00' AS DateTimeOffset), N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'77csdaxb-0izf-6r17-9fc6-7z69beac2452', N'ACTIVE')
INSERT [dbo].[SystemConfig] ([id], [status], [createdAt], [updatedAt], [interest], [fixedMoney], [transactionFee], [penaltyFee], [minRaiseMoney], [maxRaiseMoney], [minDuration], [maxDuration], [postExpireTime]) VALUES (N'12c5qzeb-6wef-4r13-9ec6-7c69bklc2052', 0, CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T07:54:30.3200000+00:00' AS DateTimeOffset), 0.01, 200000, 0.02, 0.02, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemConfig] ([id], [status], [createdAt], [updatedAt], [interest], [fixedMoney], [transactionFee], [penaltyFee], [minRaiseMoney], [maxRaiseMoney], [minDuration], [maxDuration], [postExpireTime]) VALUES (N'44c5qzeb-6wef-4r13-9ec6-7c69bklc2052', 0, CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), 0.04, 200000, 0.06, 0.02, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemConfig] ([id], [status], [createdAt], [updatedAt], [interest], [fixedMoney], [transactionFee], [penaltyFee], [minRaiseMoney], [maxRaiseMoney], [minDuration], [maxDuration], [postExpireTime]) VALUES (N'c64b87ff-456c-42e4-bb3b-c0c7ee1a9aab', 1, CAST(N'2022-04-05T07:54:30.3320000+00:00' AS DateTimeOffset), CAST(N'2022-04-05T07:54:30.3320000+00:00' AS DateTimeOffset), 0.01, 200000, 0.02, 0.02, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'00540e84-84ff-4e26-ad93-9396beeeba20', 50000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-03-21T17:54:39.1360000+00:00' AS DateTimeOffset), CAST(N'2022-03-21T17:54:39.1360000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MI4LXNA7TS38502021869520', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'0247983f-9770-4ae3-a478-d492187f5de4', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-26T01:48:30.3300000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T01:48:30.3300000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'02e31999-3f55-41d3-b7e1-d5b257da5662', 200000, N'RECEIVE', N'TháiNguyễn_thanh toán kỳ hạn_04/2022', N'SUCCESS', CAST(N'2022-04-19T23:43:28.2330000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T23:43:28.2330000+07:00' AS DateTimeOffset), 0, N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'05265438-2bbe-4920-b42b-fa197aeeb04a', 100000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-03-26T08:25:18.7370000+00:00' AS DateTimeOffset), CAST(N'2022-03-26T08:25:18.7370000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MI7M3SI21G491600C829890G', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'05fd0756-8d46-44a0-8f2b-bd64f16c9a4c', 11000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-12T18:29:57.3540000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:29:57.3540000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'0708145a-a5b0-4b62-bc73-f367c635e8ac', 11000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái 4 Nguyễn', N'SUCCESS', CAST(N'2022-04-12T18:42:29.4550000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:42:29.4550000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'0c178c1e-f80e-4445-b2cc-158f2a8cfa6d', 20000000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-04-15T00:29:23.0060000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T00:29:23.0060000+07:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MJMFTQA8VH990033A7865621', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'0fd00de1-80e6-4991-af24-ed59a0b4ee3b', 48500, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-15T16:42:13.2130000+00:00' AS DateTimeOffset), CAST(N'2022-03-15T16:42:13.2130000+00:00' AS DateTimeOffset), 1500, NULL, N'Paypal', NULL, N'Ví của tôi', N'5ABJ6AUEB5AEA', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'12f3b2c1-5633-44bd-97f3-35bc2253c7bb', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-12T18:29:57.3470000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:29:57.3470000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'134d930b-5ed0-4924-955b-efb5b90e34c9', 2000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:10:30.8680000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:10:30.8680000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'13c958b5-d0f1-40d1-b985-fd86b204036c', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-12T18:26:51.1830000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:26:51.1830000+07:00' AS DateTimeOffset), 0, NULL, N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'18e4e641-2d72-440f-9588-75719017cb93', 40000000, N'TRANSFER', N'Chuyển tiền đến Thái Nguyễn', N'SUCCESS', CAST(N'2022-04-13T17:43:10.4200000+07:00' AS DateTimeOffset), CAST(N'2022-04-13T17:43:10.4200000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'1bbeb95c-db63-4e5f-b358-ea307f0c32a9', 48500, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-15T16:40:10.1140000+00:00' AS DateTimeOffset), CAST(N'2022-03-15T16:40:10.1140000+00:00' AS DateTimeOffset), 1500, NULL, N'Paypal', NULL, N'Ví của tôi', N'CEX9GNZL98GS6', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'1f873e23-3ae8-4023-b9af-10de413a119f', 200000, N'TRANSFER', N'Thanh toán kỳ hạn_05/2022', N'SUCCESS', CAST(N'2022-04-19T23:56:36.7430000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T23:56:36.7430000+07:00' AS DateTimeOffset), 0, NULL, N'Các nhà đầu tư', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'22a5358a-3be0-4b71-a24d-0f97e64daff4', 2000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:24:00.4790000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:24:00.4790000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'27223595-2f1c-4da8-8f51-3db1a9fa8288', 2000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:13:30.8990000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:13:30.8990000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'280d88d4-e29d-47a6-b3c3-8266467221ab', 200000, N'RECEIVE', N'TháiNguyễn_thanh toán kỳ hạn_05/2022', N'SUCCESS', CAST(N'2022-04-19T23:56:36.7790000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T23:56:36.7790000+07:00' AS DateTimeOffset), 0, N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'2b1cdf83-4f84-4686-95b1-d53d0d8bf67f', 10000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái Nguyễn', N'SUCCESS', CAST(N'2022-04-02T16:20:46.1750000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:20:46.1750000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái Nguyễn', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'2e6905d2-7ef6-4700-8e37-f4fa56f66895', 2000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:07:30.7850000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:07:30.7850000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'2f086da6-6e98-49a0-91a0-8695c121f6a5', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:10:30.9570000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:10:30.9570000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'311f34f8-995e-4487-a6cc-42677c3bba89', 2000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-05-02T15:24:00.5840000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:24:00.5840000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'320cd1e4-da3d-4e0b-851c-f5592ddd170e', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:10:30.8630000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:10:30.8630000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'3aadb752-fb30-4d43-bf35-50d8154719df', 500000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-03-13T10:28:22.0440000+00:00' AS DateTimeOffset), CAST(N'2022-03-13T10:28:22.0440000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIW4OHQ6WG155695E540611B', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'41895213-be84-439a-a5cf-6f3788997b91', 6000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:26:20.6600000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:26:20.6600000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'44bc82ba-04de-49b4-8b79-6d762cb33c01', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:12:31.0590000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:12:31.0590000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'574334c3-e72e-4a93-98c1-7398ca132255', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-03-26T08:30:02.4450000+00:00' AS DateTimeOffset), CAST(N'2022-03-26T08:30:02.4450000+00:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'K6UW6FXRCSP4W', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'57f6c5e7-04e0-4c14-a7ba-7635388ff4a0', 10000000, N'RECEIVE', N'Nhận tiền từ Thái Quốc', N'SUCCESS', CAST(N'2022-04-12T18:42:28.9540000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:42:28.9540000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'5d2b23d6-8e66-42b6-9550-129bdfff876c', 1000000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-26T12:14:54.1150000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T12:14:54.1150000+07:00' AS DateTimeOffset), 20000, NULL, N'Paypal', NULL, N'Ví của tôi', N'SVHUSNS9NLFLW', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'5ff81eb5-0426-45cd-b838-933b4a021490', 11000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái 4 Nguyễn', N'SUCCESS', CAST(N'2022-04-12T18:29:57.4050000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:29:57.4050000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'6afd2d82-3195-4de2-9409-84b666bacb74', 6000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-05-02T15:26:20.8600000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:26:20.8600000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'6b54d7eb-2fa1-4282-ab0e-2c7a3e2689bc', 50000, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-19T15:44:14.6620000+00:00' AS DateTimeOffset), CAST(N'2022-03-19T15:44:14.6620000+00:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'4GEF6CVXXKU7L', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'6bbe5203-4dd2-4918-83b6-2f1875ae9af8', 100000, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-16T15:39:48.9510000+00:00' AS DateTimeOffset), CAST(N'2022-03-16T15:39:48.9510000+00:00' AS DateTimeOffset), 5000, NULL, N'Paypal', NULL, N'Ví của tôi', N'L5279HXQWQ5VN', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'6d96aed7-2d49-4747-9067-7ac8079c55a7', 500000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-03-11T16:33:13.1960000+00:00' AS DateTimeOffset), CAST(N'2022-03-11T16:33:13.1960000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIVXTPQ75M679394A169331K', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'71d3f7a6-37cf-4d29-abc6-a11e15b26909', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:07:30.8130000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:07:30.8130000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'740afa57-9568-4546-937f-24d85d4fe7ab', 10000000, N'RECEIVE', N'Nhận tiền từ Thái Quốc', N'SUCCESS', CAST(N'2022-04-12T18:29:57.3750000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:29:57.3750000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'76754c2d-a870-4182-844e-93929a14dbfb', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-12T02:35:21.8410000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T02:35:21.8410000+07:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'A2GWNWDUHH4K2', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'76aeb41e-9361-475a-b49b-91f1ca53151a', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:10:30.9490000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:10:30.9490000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'78b14853-7d05-41d8-8c93-35875a907c10', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-11T22:29:37.5570000+07:00' AS DateTimeOffset), CAST(N'2022-04-11T22:29:37.5570000+07:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'CCXMN752JRT78', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'79422e69-d0de-4304-b135-88db008fda0c', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-11T22:28:52.3830000+07:00' AS DateTimeOffset), CAST(N'2022-04-11T22:28:52.3830000+07:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'XXFH4FHL9BQ5N', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'7bc5aeb3-20ba-4d6a-bc96-3aefd1f6ddf9', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-11T22:29:17.9490000+07:00' AS DateTimeOffset), CAST(N'2022-04-11T22:29:17.9490000+07:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'NTBXU5BVBUAPL', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'7bd99da7-8a21-49da-96cc-4f1493607209', 1000000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-03-14T16:34:48.2450000+00:00' AS DateTimeOffset), CAST(N'2022-03-11T16:34:48.2450000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIVXUHI9A372701NB856020B', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'7eac015d-46d7-4d89-8229-7db03d46ed3f', 97000, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-15T16:35:52.8950000+00:00' AS DateTimeOffset), CAST(N'2022-03-15T16:35:52.8950000+00:00' AS DateTimeOffset), 3000, NULL, N'Paypal', NULL, N'Ví của tôi', N'CA947RDLW8XP2', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'80aa7003-f6c1-44e3-bb78-4c33bb60638d', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:04:16.2330000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:04:16.2330000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'85d52bd5-9228-4fa1-a21a-56b5d874de22', 95000, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-16T15:38:07.6440000+00:00' AS DateTimeOffset), CAST(N'2022-03-16T15:38:07.6440000+00:00' AS DateTimeOffset), 5000, NULL, N'Paypal', NULL, N'Ví của tôi', N'E9BQ5WUVXFTCE', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'8885d737-6593-4c98-a989-6c7b8cd8646d', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:13:30.9070000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:13:30.9070000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'89c89474-a915-480b-b541-ab9b3e9e96a2', 70000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-05-02T15:24:00.5870000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:24:00.5870000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'8c19ed11-0af6-447f-b2ac-a0f81e7701d9', 11000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-12T18:26:51.1870000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:26:51.1870000+07:00' AS DateTimeOffset), 0, NULL, N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'8fedc002-2909-4f55-8e8d-3712801fc40a', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:04:16.2380000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:04:16.2380000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'91391e78-6804-4408-b0dc-6e40b1fdf950', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-11T22:27:24.0690000+07:00' AS DateTimeOffset), CAST(N'2022-04-11T22:27:24.0690000+07:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'SZKS9GV5H7CUL', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'92482d58-e39a-4a34-9001-15a9b8e1e9f7', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:26:20.6510000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:26:20.6510000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'968a93d1-e8e2-41e7-b0f4-9153a8f9f24d', 70000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-05-02T15:26:20.8820000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:26:20.8820000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'9900b5ff-dad2-4845-a980-73049ff11566', 48500, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-15T16:37:09.0900000+00:00' AS DateTimeOffset), CAST(N'2022-03-15T16:37:09.0900000+00:00' AS DateTimeOffset), 1500, NULL, N'Paypal', NULL, N'Ví của tôi', N'JZYJYA97J8VPS', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'99aa6486-6059-4fd0-8998-465775d071be', 20000000, N'TRANSFER', N'Chuyển tiền đến Thái Nguyễn', N'SUCCESS', CAST(N'2022-04-15T20:50:20.8860000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T20:50:20.8860000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'9c15cf25-a1d2-45cd-9cc0-c17e36b85651', 70000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-05-02T15:32:01.3050000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.3050000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'9c48903d-d647-4506-bd65-e21939371baa', 100000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-01-12T16:56:15.5150000+00:00' AS DateTimeOffset), CAST(N'2022-03-11T16:56:15.5150000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIVX6JI09W36450C94088649', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'9ef11a47-d623-412f-b199-f297bc0343ca', 200000, N'RECEIVE', N'TháiNguyễn_thanh toán kỳ hạn_06/2022', N'SUCCESS', CAST(N'2022-04-19T23:59:34.1600000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T23:59:34.1600000+07:00' AS DateTimeOffset), 0, N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'a498cc8e-9502-441c-9e9c-be581f432ceb', 2000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:21:40.9300000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:21:40.9300000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'a6029d52-7afd-41ea-9553-399e3c858b29', 21000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-15T19:50:31.3730000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T19:50:31.3730000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'a6bd871e-6010-402a-a904-87164cb8c7ab', 50000, N'WITHDRAW', N'Chuyển tiền vào ví paypal', N'SUCCESS', CAST(N'2022-04-11T22:26:54.0020000+07:00' AS DateTimeOffset), CAST(N'2022-04-11T22:26:54.0020000+07:00' AS DateTimeOffset), 1000, NULL, N'Paypal', NULL, N'Ví của tôi', N'3D3U734GSPKBU', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'ac1f2a95-c819-4725-b356-8b35e203d44e', 40000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái 4 Nguyễn', N'SUCCESS', CAST(N'2022-04-14T00:30:31.1320000+07:00' AS DateTimeOffset), CAST(N'2022-04-14T00:30:31.1320000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'b355eca1-7ee2-4ec8-9665-5a5c68ff9b1a', 200000, N'TRANSFER', N'Thanh toán kỳ hạn_06/2022', N'SUCCESS', CAST(N'2022-04-19T23:59:34.1160000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T23:59:34.1160000+07:00' AS DateTimeOffset), 0, NULL, N'Các nhà đầu tư', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'b50452c8-1705-4bf9-ae52-592fa148f5e7', 40000000, N'TRANSFER', N'Chuyển tiền đến Thái Nguyễn', N'SUCCESS', CAST(N'2022-04-13T17:46:30.3170000+07:00' AS DateTimeOffset), CAST(N'2022-04-13T17:46:30.3170000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'b6d2078f-a136-4a0f-9278-78774d2228ff', 40000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái 4 Nguyễn', N'SUCCESS', CAST(N'2022-04-13T17:46:30.3680000+07:00' AS DateTimeOffset), CAST(N'2022-04-13T17:46:30.3680000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'b8ded16e-4fd6-42ea-b092-0ebeb8c27941', 40000000, N'TRANSFER', N'Chuyển tiền đến Thái Nguyễn', N'SUCCESS', CAST(N'2022-04-14T00:30:30.5340000+07:00' AS DateTimeOffset), CAST(N'2022-04-14T00:30:30.5340000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'be0613ef-7f09-4d41-be6d-94bd515fa34a', 200000, N'TRANSFER', N'Thanh toán kỳ hạn_04/2022', N'SUCCESS', CAST(N'2022-04-19T23:43:27.8300000+07:00' AS DateTimeOffset), CAST(N'2022-04-19T23:43:27.8300000+07:00' AS DateTimeOffset), 0, NULL, N'Các nhà đầu tư', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'be697738-6897-410f-81f3-d6c2b7eaa167', 100000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-02-09T09:49:14.1440000+00:00' AS DateTimeOffset), CAST(N'2022-03-09T09:49:14.1440000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'23123123123', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'bf0c6440-a8ca-44b4-bee3-0637a6372e44', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:20:46.0780000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:20:46.0780000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'c272ba20-035d-4c38-a62c-5eef6efe0288', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:12:31.1980000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:12:31.1980000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'cac4d006-9982-464f-bb55-d77be201225b', 6000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-05-02T15:32:01.2930000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.2930000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'caf57037-2fc5-4567-8f94-d7da3a9cd260', 100000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-04-11T22:31:26.5080000+07:00' AS DateTimeOffset), CAST(N'2022-04-11T22:31:26.5080000+07:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MJKETKI1V587206CH9118729', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'cbceaf1a-3cf3-434c-ae09-ee47722cca84', 1000000, N'type', N'Rút tiền sang ví paypal', N'SUCCESS', CAST(N'2022-04-21T15:17:24.5660000+07:00' AS DateTimeOffset), CAST(N'2022-04-21T15:17:24.5660000+07:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', N'                                    ', N'Paypal', N'SWDQ8PPCMEYFN', N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'cfac399f-3298-41b1-99ea-2da6a1203622', 23400000, N'TRANSFER', N'Thanh toán hoàn toàn khoản nợ', N'SUCCESS', CAST(N'2022-04-20T00:22:53.5110000+07:00' AS DateTimeOffset), CAST(N'2022-04-20T00:22:53.5110000+07:00' AS DateTimeOffset), 0, NULL, N'Các nhà đầu tư', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'd30aa08c-7872-4972-bf2a-c75cf52aba60', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:32:01.1150000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.1150000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'd6182120-adb9-447c-9750-83611c675422', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-02T16:20:46.0740000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:20:46.0740000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'd688f590-87c7-4215-8565-4cf62bf67f11', 21000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái 4 Nguyễn', N'SUCCESS', CAST(N'2022-04-15T19:50:31.9920000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T19:50:31.9920000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'd7299e49-9f2f-4537-9e1b-f321b77edb86', 70000000, N'RECEIVE', N'Nhận tiền từ Nguyễn Quốc Thái', N'SUCCESS', CAST(N'2022-04-26T01:48:30.3910000+07:00' AS DateTimeOffset), CAST(N'2022-04-26T01:48:30.3910000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'd75ea2bf-ebe6-4f8f-a37e-dffb7ceca6c7', 20000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái 4 Nguyễn', N'SUCCESS', CAST(N'2022-04-15T20:50:21.7240000+07:00' AS DateTimeOffset), CAST(N'2022-04-15T20:50:21.7240000+07:00' AS DateTimeOffset), 0, N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'd8f26634-9e49-4799-9db2-cfd885fcd74c', 11000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-12T18:42:28.9130000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:42:28.9130000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'db3ee2d5-209c-4c43-b6ed-b2dd2a5e85ea', 23400000, N'RECEIVE', N'Thanh toán hoàn toàn khoản nợ', N'SUCCESS', CAST(N'2022-04-20T00:22:53.6530000+07:00' AS DateTimeOffset), CAST(N'2022-04-20T00:22:53.6530000+07:00' AS DateTimeOffset), 0, N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái 4 Nguyễn', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'Thái Nguyễn', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'dea97af9-a65d-4d34-9596-db888f619575', 10000000, N'RECEIVE', N'Nhận tiền từ Thái Quốc', N'SUCCESS', CAST(N'2022-04-02T16:04:16.2530000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:04:16.2530000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'e33de675-4721-4bb0-b901-0487d3fa180d', 100000, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-17T04:46:25.8010000+00:00' AS DateTimeOffset), CAST(N'2022-03-17T04:46:25.8010000+00:00' AS DateTimeOffset), 2000, NULL, N'Paypal', NULL, N'Ví của tôi', N'2KXVC69CDBLBL', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'e7bad3df-776a-44ae-a19f-010d890747a8', 10000000, N'RECEIVE', N'Nhận tiền từ Quốc Thái Nguyễn', N'SUCCESS', CAST(N'2022-04-02T16:04:16.2510000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:04:16.2510000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Quốc Thái Nguyễn', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'e985e426-6281-4560-8815-569d77cd9431', 6000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:32:01.1170000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.1170000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'eb21b495-6fee-426d-a969-d0e239c1a519', 200000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2023-06-11T16:56:43.0910000+00:00' AS DateTimeOffset), CAST(N'2022-03-11T16:56:43.0910000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIVX6QI26545525TT637653A', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'f20323c8-7c31-4a6d-b07f-d271a316a1d5', 100000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2022-03-18T16:54:48.1010000+00:00' AS DateTimeOffset), CAST(N'2022-03-11T16:54:48.1010000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIVX5PA4H828213PR136161W', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'f4ac9ede-d0ce-4e22-9652-7152ee3d771a', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:24:00.5700000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:24:00.5700000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'f4e12bac-79bd-429f-ada6-89e21fef581f', 70000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-05-02T15:21:40.9270000+07:00' AS DateTimeOffset), CAST(N'2022-05-02T15:21:40.9270000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'Nguyễn Quốc Thái', NULL, N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'f6cf4538-2570-4895-8f5a-0917789517f7', 97000, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-15T16:37:48.7450000+00:00' AS DateTimeOffset), CAST(N'2022-03-15T16:37:48.7450000+00:00' AS DateTimeOffset), 3000, NULL, N'Paypal', NULL, N'Ví của tôi', N'VGRWUCSJ8NV9Q', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'f75e7617-f134-4f53-98cb-62de32ea5325', 10000000, N'RECEIVE', N'Nhận tiền từ Thái Quốc', N'SUCCESS', CAST(N'2022-04-02T16:20:46.1790000+00:00' AS DateTimeOffset), CAST(N'2022-04-02T16:20:46.1790000+00:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'0le7b097-9ddf-4596-8249-6b0a98caf758')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'f9983eb1-28d8-4338-8f31-0cd5d59963f8', 500000, N'TOPUP', N'Nạp tiền vào ví', N'SUCCESS', CAST(N'2023-03-11T16:35:46.0920000+00:00' AS DateTimeOffset), CAST(N'2022-03-11T16:35:46.0920000+00:00' AS DateTimeOffset), 0, NULL, N'Ví của tôi', NULL, N'Paypal', N'PAYID-MIVXUWA9AB01970VA695400S', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'fd0c9b12-0bc8-468f-bded-13b0587e2aae', 10000000, N'TRANSFER', N'Chuyển tiền đến Nguyen Quoc Thai (K14 HCM)', N'SUCCESS', CAST(N'2022-04-12T18:42:28.9110000+07:00' AS DateTimeOffset), CAST(N'2022-04-12T18:42:28.9110000+07:00' AS DateTimeOffset), 0, N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'Nguyen Quoc Thai (K14 HCM)', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'Thái Quốc', NULL, N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'fdc13040-d9c7-4673-908e-08db9c9b2e00', 48500, N'WITHDRAW', N'Rút tiền về ví paypal', N'SUCCESS', CAST(N'2022-03-15T16:39:52.2090000+00:00' AS DateTimeOffset), CAST(N'2022-03-15T16:39:52.2090000+00:00' AS DateTimeOffset), 1500, NULL, N'Paypal', NULL, N'Ví của tôi', N'76S2C9NDJHQNG', N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8')
INSERT [dbo].[Transaction] ([id], [money], [type], [description], [status], [createdAt], [updatedAt], [transactionFee], [recipientId], [recipientName], [senderId], [senderName], [paypalTransaction], [walletId]) VALUES (N'fddf13a9-8ef9-44f0-889d-a322124a5d96', 2000000, N'WITHDRAW', N'Rút tiền sang ví paypal', N'SUCCESS', CAST(N'2022-04-21T15:21:15.0410000+07:00' AS DateTimeOffset), CAST(N'2022-04-21T15:21:15.0410000+07:00' AS DateTimeOffset), 0, NULL, N'Paypal', N'                                    ', N'Ví của tôi', N'BNTSWKUFBM3XN', N'22d74f95-4kjf-48b2-a33a-43843d0fea23')
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'0c945982-6e5f-4aaa-876b-e55e1f093023', N'+84945492733', N'$2b$12$x5urdnAgfLNhpb.fGSKHLuAfccaa0MBD4cN3Etqjie9Di.3ZiKYj.', N'INVESTOR', N'qthai20102000@gmail.com', N'101475571240379965782', CAST(N'2022-02-16T09:22:58.7640000+00:00' AS DateTimeOffset), CAST(N'2022-05-04T15:44:19.4680000+07:00' AS DateTimeOffset), NULL, N'Nguyễn Quốc', N'Thái', N'UNVERIFIED', N'http://res.cloudinary.com/larrytran/image/upload/v1649497779/file/1649497779312-3103a250-8b72-4fce-a17e-a9e78bab3818.png', N'TP.HCM', CAST(N'2022-04-23T16:47:54.1960000+07:00' AS DateTimeOffset), N'c3UBLgFERy-aOIK00_Z9kM:APA91bH_txVssevIqu-ArWaf89bD16k_DSTs3TcJqTGUj0bvcmPXtGDq9yiLAcVLv5XtOyX8nCM7BJaIk_2ycB_eMnC2jIezszs7V7mBjhia2C5086h1r8R8M0GiZFWlhs7binC76_kv')
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'2de6b097-9ddf-4596-8249-6b0a98caf758', N'+840945492733', N'$2b$12$2tNIhdfadbPYQzb8sIqvUeY5SXF9etOOHiZEzp8KxxqrX./IRSI7e', N'STUDENT', N'thainqse141062@fpt.edu.vn', N'110870204141700177797', CAST(N'2021-10-19T12:18:43.3910000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T12:18:43.3910000+00:00' AS DateTimeOffset), NULL, N'Nguyen Quoc Thai', N'(K14 HCM)', N'VERIFIED', N'https://lh3.googleusercontent.com/a/AATXAJyr53x4lJhfoHppMFLUxxf1AiMv1oHQz3hmMqDq=s96-c', N'Đà Nẵng', CAST(N'1999-03-18T09:22:58.7640000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'71fd0fe1-ce11-495e-8966-ab0a357b124c', N'0945492733', N'$2b$12$xtxfjpwUPcgM0NhjBl69M.skgPxvTMG9RLSVQLf248DW69rxs/SB.', N'INVESTOR', N'thai_dtm2@yahoo.com.vn', NULL, CAST(N'2022-04-16T00:35:16.0320000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:35:16.0320000+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'UNVERIFIED', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'84874fd0-4ebf-48b2-a33a-43843d0fea23', N'+840945492733', N'$2b$12$BSiOPdErW8Lks0rcZPe1O.JSu9Kb8R/iVwvVV0qrN.z7TL5roaG2u', N'STUDENT', N'thai_dtm@yahoo.com.vn', N'3007073306172694', CAST(N'2021-10-19T15:13:12.0530000+07:00' AS DateTimeOffset), CAST(N'2022-04-23T01:14:17.1850000+07:00' AS DateTimeOffset), NULL, N'Thái', N'Nguyễn', N'UNVERIFIED', N'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?size=626&ext=jpg&ga=GA1.2.1411842976.1640908800', N'Vĩnh Long', CAST(N'2002-09-16T16:22:58.7640000+07:00' AS DateTimeOffset), NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', N'+840945492733', N'$2b$12$OZ/H0B4oZg69Rz6cGkHiJet/oFQHQX4L1JbXQvT4XHw5gXxijr4DG', N'INVESTOR', N'qthai201020002@gmail.com', NULL, CAST(N'2021-10-19T08:11:53.5050000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:11:53.5050000+00:00' AS DateTimeOffset), NULL, N'Thái', N'Quốc', N'VERIFIED', NULL, N'Đồng Tháp', CAST(N'2001-01-26T09:22:58.7640000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'ec0bafb5-f73f-4527-9f63-ca8d58772c86', N'0945492733', N'$2b$12$1P6Whl2Y50oeHZoT10iGX.x.XraEXj/LSwM45SQ0X82KG7fxKqlsy', N'INVESTOR', N'thai_dtm5@yahoo.com.vn', NULL, CAST(N'2022-04-24T21:25:09.6860000+07:00' AS DateTimeOffset), CAST(N'2022-04-24T21:25:09.6860000+07:00' AS DateTimeOffset), NULL, N'Minh', N'Long', N'UNVERIFIED', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'h0j72ld0-gebf-48b2-a33a-43843d0fea23', N'+84288888123', N'$2b$12$cWe4Gi8Ymes/n/N5KyBOb.SBe7CpEPmY5cbqKM2e6H2SXc/yOZGlu', N'STUDENT', N'student2@gmail.com', NULL, CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), NULL, N'Đinh', N'Phú Cường', N'UNVERIFIED', N'https://lh3.googleusercontent.com/a/AATXAJyr53x4lJhfoHppMFLUxxf1AiMv1oHQz3hmMqDq=s96-c', N'Bình Thuận', CAST(N'2001-01-26T09:22:58.7640000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'hj20sui0-46cf-48b2-a33a-43843d0fea23', N'+84231233232', N'$2b$12$cWe4Gi8Ymes/n/N5KyBOb.SBe7CpEPmY5cbqKM2e6H2SXc/yOZGlu', N'STUDENT', N'student@gmail.com', NULL, CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), NULL, N'Trần', N'Long', N'UNVERIFIED', N'https://lh3.googleusercontent.com/a/AATXAJyr53x4lJhfoHppMFLUxxf1AiMv1oHQz3hmMqDq=s96-c', N'TP.HCM', CAST(N'2001-01-26T09:22:58.7640000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[User] ([id], [phoneNumber], [password], [type], [email], [oAuthId], [createdAt], [updatedAt], [reason], [firstName], [lastName], [status], [profileUrl], [address], [birthDate], [pushToken]) VALUES (N'oo92sfd0-49bf-48b2-a33a-43843d0fea23', N'+8423123123', N'$2b$12$OZ/H0B4oZg69Rz6cGkHiJet/oFQHQX4L1JbXQvT4XHw5gXxijr4DG', N'ADMIN', N'admin@gmail.com', NULL, CAST(N'2022-03-01T14:15:07.6530000+00:00' AS DateTimeOffset), CAST(N'2022-03-01T14:15:07.6530000+00:00' AS DateTimeOffset), NULL, N'Nguyễn', N'Trường Phi', N'VERIFIED', N'https://lh3.googleusercontent.com/a/AATXAJyr53x4lJhfoHppMFLUxxf1AiMv1oHQz3hmMqDq=s96-c', N'TP.HCM', CAST(N'2001-01-26T09:22:58.7640000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'0le7b097-9ddf-4596-8249-6b0a98caf758', N'2de6b097-9ddf-4596-8249-6b0a98caf758', 369050000, N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.2840000+07:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'1b35837f-d224-47f7-a0f1-5f41dcf97cf8', N'0c945982-6e5f-4aaa-876b-e55e1f093023', 420000000, N'ACTIVE', CAST(N'2022-02-16T09:22:58.7890000+00:00' AS DateTimeOffset), CAST(N'2022-05-02T15:32:01.1020000+07:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'22d74f95-4kjf-48b2-a33a-43843d0fea23', N'84874fd0-4ebf-48b2-a33a-43843d0fea23', 173000000, N'ACTIVE', CAST(N'2021-10-19T12:18:43.3910000+00:00' AS DateTimeOffset), CAST(N'2022-04-21T15:21:15.0920000+07:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'2fcc787e-8fe9-46a1-b904-206efc3f3f08', N'71fd0fe1-ce11-495e-8966-ab0a357b124c', 0, N'ACTIVE', CAST(N'2022-04-16T00:35:16.0350000+07:00' AS DateTimeOffset), CAST(N'2022-04-16T00:35:16.0350000+07:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'6a8a6e74-99cd-4c47-8c59-061b262c971a', N'ec0bafb5-f73f-4527-9f63-ca8d58772c86', 0, N'ACTIVE', CAST(N'2022-04-24T21:25:09.7200000+07:00' AS DateTimeOffset), CAST(N'2022-04-24T21:25:09.7200000+07:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'k9b78yu0-gebf-48b2-a33a-43843d0fea23', N'h0j72ld0-gebf-48b2-a33a-43843d0fea23', 0, N'ACTIVE', CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset), CAST(N'2021-10-19T08:13:12.0530000+00:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'scr0sui0-464f-48b2-a33a-43843d0fea23', N'hj20sui0-46cf-48b2-a33a-43843d0fea23', 0, N'ACTIVE', CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset), CAST(N'2022-02-28T12:18:43.6890000+00:00' AS DateTimeOffset))
INSERT [dbo].[Wallet] ([id], [userId], [money], [status], [createdAt], [updatedAt]) VALUES (N'sz624-5g60-ndea-9bb3-ce21f65a5fac   ', N'b069acc4-5a68-4dea-9bb3-ce21f65a5fac', 40050000, N'ACTIVE', CAST(N'2021-10-19T08:11:53.6510000+00:00' AS DateTimeOffset), CAST(N'2022-04-12T18:42:28.9050000+07:00' AS DateTimeOffset))
ALTER TABLE [dbo].[Student] ADD  DEFAULT (N'INACTIVE') FOR [status]
GO
ALTER TABLE [dbo].[Archievement]  WITH CHECK ADD FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([investmentId])
REFERENCES [dbo].[Investment] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Investment]  WITH CHECK ADD FOREIGN KEY([investorId])
REFERENCES [dbo].[Investor] ([id])
GO
ALTER TABLE [dbo].[Investment]  WITH CHECK ADD FOREIGN KEY([loanId])
REFERENCES [dbo].[Loan] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Investment]  WITH CHECK ADD FOREIGN KEY([transactionId])
REFERENCES [dbo].[Transaction] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Investor]  WITH CHECK ADD FOREIGN KEY([parentId])
REFERENCES [dbo].[Investor] ([id])
GO
ALTER TABLE [dbo].[Investor]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[LoanHistory]  WITH CHECK ADD FOREIGN KEY([adminId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[LoanHistory]  WITH CHECK ADD FOREIGN KEY([loanId])
REFERENCES [dbo].[Loan] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoanHistoryImage]  WITH CHECK ADD FOREIGN KEY([loanHistoryId])
REFERENCES [dbo].[LoanHistory] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoanMedia]  WITH CHECK ADD FOREIGN KEY([loanId])
REFERENCES [dbo].[Loan] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoanSchedule]  WITH CHECK ADD FOREIGN KEY([loanId])
REFERENCES [dbo].[Loan] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoanScheduleTransaction]  WITH CHECK ADD FOREIGN KEY([loanScheduleId])
REFERENCES [dbo].[LoanSchedule] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoanScheduleTransaction]  WITH CHECK ADD FOREIGN KEY([transactionId])
REFERENCES [dbo].[Transaction] ([id])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[SchoolMajor]  WITH CHECK ADD FOREIGN KEY([majorId])
REFERENCES [dbo].[Major] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SchoolMajor]  WITH CHECK ADD FOREIGN KEY([schoolId])
REFERENCES [dbo].[School] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([parentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([schoolMajorId])
REFERENCES [dbo].[SchoolMajor] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([walletId])
REFERENCES [dbo].[Wallet] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [StudentLoan] SET  READ_WRITE 
GO
