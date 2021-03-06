USE [master]
GO
/****** Object:  Database [school]    Script Date: 2017/5/13 19:17:04 ******/
CREATE DATABASE [school]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'school', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\school.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'school_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\school_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [school] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [school].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [school] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [school] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [school] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [school] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [school] SET ARITHABORT OFF 
GO
ALTER DATABASE [school] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [school] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [school] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [school] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [school] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [school] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [school] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [school] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [school] SET  DISABLE_BROKER 
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [school] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [school] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [school] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [school] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [school] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [school] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [school] SET RECOVERY FULL 
GO
ALTER DATABASE [school] SET  MULTI_USER 
GO
ALTER DATABASE [school] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [school] SET DB_CHAINING OFF 
GO
ALTER DATABASE [school] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [school] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [school] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'school', N'ON'
GO
USE [school]
GO
/****** Object:  Table [dbo].[class]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[class](
	[class_id] [varchar](32) NOT NULL,
	[class_name] [varchar](32) NULL,
	[grade_id] [varchar](32) NULL,
	[class_dep] [varchar](32) NULL,
	[class_teacher] [varchar](32) NULL,
 CONSTRAINT [PK_CLASS] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[class_course]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[class_course](
	[class_course_id] [varchar](32) NOT NULL,
	[class_id] [varchar](32) NULL,
	[course_id] [varchar](32) NULL,
 CONSTRAINT [PK_CLASS_COURSE] PRIMARY KEY CLUSTERED 
(
	[class_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[course]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[course](
	[course_id] [varchar](32) NOT NULL,
	[course_name] [varchar](32) NULL,
	[course_num] [varchar](32) NULL,
	[course_time] [varchar](32) NULL,
 CONSTRAINT [PK_COURSE] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grade]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grade](
	[grade_id] [varchar](32) NOT NULL,
	[grade_name] [varchar](32) NULL,
 CONSTRAINT [PK_GRADE] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[msg]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[msg](
	[msg_id] [varchar](32) NOT NULL,
	[msg] [varchar](200) NULL,
	[user_id] [varchar](32) NULL,
	[pb_date] [date] NULL,
 CONSTRAINT [PK_msg] PRIMARY KEY CLUSTERED 
(
	[msg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [varchar](32) NOT NULL,
	[role_name] [varchar](32) NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[score]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[score](
	[score_id] [varchar](32) NOT NULL,
	[score] [varchar](32) NULL,
	[user_id] [varchar](32) NULL,
	[course_id] [varchar](32) NULL,
 CONSTRAINT [PK_SCORE] PRIMARY KEY CLUSTERED 
(
	[score_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_class]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_class](
	[user_class_id] [varchar](32) NOT NULL,
	[user_id] [varchar](32) NULL,
	[class_id] [varchar](32) NULL,
 CONSTRAINT [PK_USER_CLASS] PRIMARY KEY CLUSTERED 
(
	[user_class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_role](
	[user_role_id] [varchar](32) NOT NULL,
	[user_id] [varchar](32) NULL,
	[role_id] [varchar](32) NULL,
 CONSTRAINT [PK_USER_ROLE] PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 2017/5/13 19:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [varchar](32) NOT NULL,
	[user_account] [varchar](32) NULL,
	[user_passwd] [varchar](32) NULL,
	[user_name] [varchar](32) NULL,
	[user_tel] [varchar](32) NULL,
	[user_address] [varchar](32) NULL,
	[user_idcard] [varchar](32) NULL,
	[user_card] [varchar](32) NULL,
	[user_sex] [varchar](32) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[course] ([course_id], [course_name], [course_num], [course_time]) VALUES (N'402821825ba405c0015ba40d7ae60002', N'JS从入门到放弃', N'2', N'10')
INSERT [dbo].[course] ([course_id], [course_name], [course_num], [course_time]) VALUES (N'402821825ba4ac8f015ba4b0236b0001', N'HTML从入门到放弃', N'2', N'12')
INSERT [dbo].[course] ([course_id], [course_name], [course_num], [course_time]) VALUES (N'402821825baacdee015baacea5440001', N'JS从入门到放弃', N'2', N'12')
INSERT [dbo].[course] ([course_id], [course_name], [course_num], [course_time]) VALUES (N'402821825baacdee015baacec1c20003', N'HTML从入门到放弃', N'2', N'24')
INSERT [dbo].[grade] ([grade_id], [grade_name]) VALUES (N'1', N'13级')
INSERT [dbo].[grade] ([grade_id], [grade_name]) VALUES (N'2', N'14级')
INSERT [dbo].[grade] ([grade_id], [grade_name]) VALUES (N'3', N'15级')
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825bdd5077015bdd50e5650001', N'今天放假', NULL, CAST(N'2017-05-06' AS Date))
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825bdd5191015bdd522ab30002', N'今天放假', N'1', CAST(N'2017-05-06' AS Date))
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825bdd56bb015bdd57240e0001', N'今天放假', N'1', CAST(N'2017-05-06' AS Date))
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825bdd5c5e015bdd5cde070001', N'今天收假', N'1', CAST(N'2017-05-06' AS Date))
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825bdd5c5e015bdd5d37cf0002', N'今天放假', N'1', CAST(N'2017-05-06' AS Date))
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825bdd5c5e015bdd5d5b1c0003', N'今天收假', N'1', CAST(N'2017-05-06' AS Date))
INSERT [dbo].[msg] ([msg_id], [msg], [user_id], [pb_date]) VALUES (N'402821825be39150015be3933c820001', N'今天放假', N'1', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (N'admin', N'admin')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (N'student', N'student')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (N'teacher', N'teacher')
INSERT [dbo].[user_class] ([user_class_id], [user_id], [class_id]) VALUES (N'402821825bec581d015bec86c67a000f', N'402821825bec581d015bec86c67a000d', N'402821825bde6f16015bde76e2890001')
INSERT [dbo].[user_role] ([user_role_id], [user_id], [role_id]) VALUES (N'1', N'1', N'admin')
INSERT [dbo].[users] ([user_id], [user_account], [user_passwd], [user_name], [user_tel], [user_address], [user_idcard], [user_card], [user_sex]) VALUES (N'1', N'admin', N'admin', N'张大头', N'1111111', NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_CLASS_REFERENCE_GRADE] FOREIGN KEY([grade_id])
REFERENCES [dbo].[grade] ([grade_id])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_CLASS_REFERENCE_GRADE]
GO
ALTER TABLE [dbo].[class_course]  WITH CHECK ADD  CONSTRAINT [FK_CLASS_CO_REFERENCE_CLASS] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[class_course] CHECK CONSTRAINT [FK_CLASS_CO_REFERENCE_CLASS]
GO
ALTER TABLE [dbo].[class_course]  WITH CHECK ADD  CONSTRAINT [FK_CLASS_CO_REFERENCE_COURSE] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[class_course] CHECK CONSTRAINT [FK_CLASS_CO_REFERENCE_COURSE]
GO
ALTER TABLE [dbo].[msg]  WITH NOCHECK ADD  CONSTRAINT [FK_msg_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[msg] NOCHECK CONSTRAINT [FK_msg_users]
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [FK_SCORE_REFERENCE_COURSE] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [FK_SCORE_REFERENCE_COURSE]
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [FK_SCORE_REFERENCE_USERS] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [FK_SCORE_REFERENCE_USERS]
GO
ALTER TABLE [dbo].[user_class]  WITH CHECK ADD  CONSTRAINT [FK_USER_CLA_REFERENCE_CLASS] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[user_class] CHECK CONSTRAINT [FK_USER_CLA_REFERENCE_CLASS]
GO
ALTER TABLE [dbo].[user_class]  WITH CHECK ADD  CONSTRAINT [FK_USER_CLA_REFERENCE_USERS] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_class] CHECK CONSTRAINT [FK_USER_CLA_REFERENCE_USERS]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_USER_ROL_REFERENCE_ROLE] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_USER_ROL_REFERENCE_ROLE]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_USER_ROL_REFERENCE_USERS] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_USER_ROL_REFERENCE_USERS]
GO
USE [master]
GO
ALTER DATABASE [school] SET  READ_WRITE 
GO
