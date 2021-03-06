USE [master]
GO
/****** Object:  Database [EMS]    Script Date: 10-11-2016 11:48:14 AM ******/
CREATE DATABASE [EMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMS', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EMS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EMS_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EMS_log.ldf' , SIZE = 2112KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMS] SET RECOVERY FULL 
GO
ALTER DATABASE [EMS] SET  MULTI_USER 
GO
ALTER DATABASE [EMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EMS]
GO
/****** Object:  Schema [ASP]    Script Date: 10-11-2016 11:48:14 AM ******/
CREATE SCHEMA [ASP]
GO
/****** Object:  Table [ASP].[Announcement]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Announcement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DestinationId] [int] NULL,
	[CreatedById] [int] NULL,
	[AnnouncementType] [int] NULL,
	[Description] [varchar](max) NULL,
	[AnnounceDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[AnnouncementType]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[AnnouncementType](
	[A_Id] [int] IDENTITY(1,1) NOT NULL,
	[AName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MYEMS.AnnouncementType] PRIMARY KEY CLUSTERED 
(
	[A_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Assignment]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Assignment](
	[assignment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [int] NULL,
	[SchoolName] [varchar](500) NULL,
	[Location] [varchar](500) NULL,
	[ProfessorId] [int] NULL,
	[Course] [int] NULL,
	[StudentId] [int] NULL,
	[Year] [int] NULL,
	[AssignmentDate] [datetime] NULL,
	[Topic] [varchar](500) NULL,
	[AssignmentWork] [varchar](max) NULL,
	[createdDatetime] [datetime] NULL CONSTRAINT [DF_MYEMS.Assignment_createdDatetime]  DEFAULT (getdate()),
 CONSTRAINT [PK_MYEMS.Assignment] PRIMARY KEY CLUSTERED 
(
	[assignment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Course]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Course](
	[Course_Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MYEMS.Course] PRIMARY KEY CLUSTERED 
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Department]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Department](
	[Dept_Id] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Desc] [varchar](100) NULL,
 CONSTRAINT [PK_MYEMS.Department] PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Discussion]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Discussion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_id] [int] NULL,
	[Professor_Id] [int] NULL,
	[Discussion_topic] [varchar](500) NULL,
	[Discussion_msg] [varchar](5000) NULL,
	[Discussion_Ans] [varchar](500) NULL,
 CONSTRAINT [PK_MYEMS.Discussion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Marks]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Marks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[Professorid] [int] NULL,
	[createdDate] [datetime] NULL,
	[Subject6] [varchar](30) NULL,
	[Subject5] [varchar](30) NULL,
	[Subject4] [varchar](30) NULL,
	[Subject3] [varchar](30) NULL,
	[Subject2] [varchar](30) NULL,
	[Subject1] [varchar](30) NULL,
	[Marks6] [real] NULL,
	[Marks5] [real] NULL,
	[Marks4] [real] NULL,
	[Marks3] [real] NULL,
	[Marks2] [real] NULL,
	[Marks1] [real] NULL,
	[Grade6] [varchar](10) NULL,
	[Grade5] [varchar](10) NULL,
	[Grade4] [varchar](10) NULL,
	[Grade3] [varchar](10) NULL,
	[Grade2] [varchar](10) NULL,
	[Grade1] [varchar](10) NULL,
	[TotalMarks] [real] NULL,
	[FinalGrade] [varchar](10) NULL,
	[Percentage] [int] NULL,
 CONSTRAINT [PK_MYEMS.Mark] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Membership]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Membership](
	[membership_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[pwd] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MYEMS.Membership_IsActive]  DEFAULT ((1)),
	[createdDate] [datetime] NOT NULL CONSTRAINT [DF_MYEMS.Membership_createdDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MYEMS.Membership] PRIMARY KEY CLUSTERED 
(
	[membership_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[Role]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[Role](
	[role_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[role_Desc] [varchar](100) NULL,
 CONSTRAINT [PK_MYEMS_Role] PRIMARY KEY CLUSTERED 
(
	[role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ASP].[User]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ASP].[User](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[membership_id] [bigint] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[middleName] [varchar](100) NULL,
	[Role_Id] [smallint] NOT NULL CONSTRAINT [DF_MYEMS.User_Role_Id]  DEFAULT ((0)),
	[DOB] [datetime] NULL,
	[email] [varchar](100) NULL,
	[Phoneno] [varchar](100) NULL,
	[gender] [char](5) NOT NULL CONSTRAINT [DF_MYEMS.User_gender]  DEFAULT ('M'),
	[dateOfJoining] [datetime] NULL,
	[Course_Id] [smallint] NULL,
	[Dept_Id] [smallint] NULL,
	[Prof_Id] [bigint] NULL,
	[pic] [varbinary](max) NULL,
	[FatherName] [varchar](150) NULL,
	[MotherName] [varchar](150) NULL,
	[PresentAddress] [varchar](500) NULL,
	[PermanentAddress] [varchar](500) NULL,
	[ParentPhone] [varchar](15) NULL,
	[ParentEmail] [varchar](150) NULL,
	[SSCMarks] [varchar](10) NULL,
	[SSCPercentage] [varchar](10) NULL,
	[YearOfPassing] [varchar](50) NULL,
	[IntermediateMarks] [varchar](50) NULL,
	[IntermediatePercentage] [varchar](50) NULL,
 CONSTRAINT [PK_MYEMS.User] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contactUs]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactUs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[Email] [varchar](500) NULL,
	[PhoneNumber] [varchar](500) NULL,
	[Information] [varchar](500) NULL,
 CONSTRAINT [PK_contactUs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Enroll_Id] [int] IDENTITY(1,1) NOT NULL,
	[Studentid] [int] NULL,
	[CourseId] [int] NULL,
	[CourseType] [int] NULL,
	[SchoolName] [varchar](500) NULL,
	[LocationName] [varchar](500) NULL,
	[Professorid] [int] NULL,
	[createdDateTime] [datetime] NULL CONSTRAINT [DF_ASP.EnrollCourse_createdDateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_ASP.EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Enroll_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollSports]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollSports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SportsId] [int] NULL,
	[description] [varchar](500) NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_EnrollSports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SportsType]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportsType](
	[sports_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
 CONSTRAINT [PK_Sports] PRIMARY KEY CLUSTERED 
(
	[sports_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentFee]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentFee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[SchoolName] [varchar](500) NULL,
	[LocationName] [varchar](500) NULL,
	[ProfessorID] [int] NULL,
	[CourseID] [int] NULL,
	[AdmissionNumber] [varchar](500) NULL,
	[RollNumber] [varchar](50) NULL,
	[FeeReceiptNumber] [varchar](50) NULL,
	[PaymentDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [ASP].[ADD_ANNOUNCEMENT]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [ASP].[ADD_ANNOUNCEMENT] 
	(
	
	       @DestinationId   int , 
           @CreatedById   int , 
           @AnnouncementType   int , 
           @Description   varchar(max) , 
           @AnnounceDate   datetime , 
           @CreatedDate   datetime 
	)
AS
BEGIN	
	SET NOCOUNT ON;
INSERT INTO [ASP].[Announcement]
           ([DestinationId]
           ,[CreatedById]
           ,[AnnouncementType]
           ,[Description]
           ,[AnnounceDate]
           ,[CreatedDate])
     VALUES
          ( @DestinationId  ,
           @CreatedById     ,
           @AnnouncementType,
           @Description     , 
           @AnnounceDate    ,
           @CreatedDate     )
END



GO
/****** Object:  StoredProcedure [ASP].[Add_Assignment]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Add_Assignment] (
 @Userid INT
 ,@SchoolName VARCHAR(500) = NULL
 ,@Location VARCHAR(500) = NULL
 ,@ProfessorId INT = NULL
 ,@Course INT
 ,@StudentId INT
 ,@Year INT
 ,@AssignmentDate DATETIME
 ,@Topic VARCHAR(500)
 ,@AssignmentWork VARCHAR(max)
 ,@createdDatetime DATETIME
 )
AS
BEGIN
 INSERT INTO [ASP].[Assignment] (
  [Userid]
  ,[SchoolName]
  ,[Location]
  ,[ProfessorId]
  ,[Course]
  ,[StudentId]
  ,[Year]
  ,[AssignmentDate]
  ,[Topic]
  ,[AssignmentWork]
  ,[createdDatetime]
  )
 VALUES (
  @Userid
  ,@SchoolName
  ,@Location
  ,@ProfessorId
  ,@Course
  ,@StudentId
  ,@Year
  ,@AssignmentDate
  ,@Topic
  ,@AssignmentWork
  ,@createdDatetime
  )
END
GO
/****** Object:  StoredProcedure [ASP].[Add_Discussion_Profosser]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Add_Discussion_Profosser] (
	@Student_id INT
	,@Professor_Id INT
	,@Discussion_topic VARCHAR(500)
	,@Discussion_msg VARCHAR(5000)
	)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ASP].[Discussion]
	(student_id,Professor_Id,Discussion_topic,Discussion_msg )
	VALUES (
		@Student_id
		,@Professor_Id
		,@Discussion_topic
		,@Discussion_msg
		)
END



GO
/****** Object:  StoredProcedure [ASP].[Add_Student_Marks]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Add_Student_Marks]
(
	@StudentId   int   , 
           @Professorid   int   , 
           @createdDate   datetime   , 
           @Subject6   varchar(30)=NULL   , 
           @Subject5   varchar(30) =NULL   ,
           @Subject4   varchar(30) =NULL   ,
           @Subject3   varchar(30)   , 
           @Subject2   varchar(30)   , 
           @Subject1   varchar(30)   , 
           @Marks6   real  =NULL   ,
           @Marks5   real  =NULL   ,
           @Marks4   real  =NULL   ,
           @Marks3   real   , 
           @Marks2   real   , 
           @Marks1   real   , 
           @Grade6   varchar(10)  =NULL   ,
           @Grade5   varchar(10)   =NULL   ,
           @Grade4   varchar(10)  =NULL   ,
           @Grade3   varchar(10)   , 
           @Grade2   varchar(10)   , 
           @Grade1   varchar(10)  ,
		     @FinalGrade   varchar(10)  ,
			 @TotalMarks int,
			 @Percentage int 
		   )
AS
BEGIN
	INSERT INTO [ASP].[Marks]
           ([StudentId]
           ,[Professorid]
           ,[createdDate]
           ,[Subject6]
           ,[Subject5]
           ,[Subject4]
           ,[Subject3]
           ,[Subject2]
           ,[Subject1]
           ,[Marks6]
           ,[Marks5]
           ,[Marks4]
           ,[Marks3]
           ,[Marks2]
           ,[Marks1]
           ,[Grade6]
           ,[Grade5]
           ,[Grade4]
           ,[Grade3]
           ,[Grade2]
           ,[Grade1],
		   FinalGrade    ,
			 TotalMarks ,
			 Percentage  )
     VALUES
           (
		   @StudentId,
           @Professorid,
           @createdDate, 
           @Subject6, 
           @Subject5, 
           @Subject4,
           @Subject3,   
           @Subject2, 
           @Subject1,   
           @Marks6,  
           @Marks5,  
           @Marks4,  
           @Marks3,  
           @Marks2,  
           @Marks1,  
           @Grade6,  
           @Grade5,  
           @Grade4,  
           @Grade3,  
           @Grade2,  
           @Grade1,
		   @FinalGrade  ,
			 @TotalMarks ,
			 @Percentage  
		   )
END


GO
/****** Object:  StoredProcedure [ASP].[GET_DDL_Announcement]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[GET_DDL_Announcement]
AS
BEGIN
	SELECT [A_Id]
		,[AName]
	FROM [ASP].[AnnouncementType]
END

GO
/****** Object:  StoredProcedure [ASP].[Get_DDL_AnnouncementType]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [ASP].[Get_DDL_AnnouncementType]
AS
BEGIN
SELECT * FROM ASP.AnnouncementType 
END


GO
/****** Object:  StoredProcedure [ASP].[Get_DDL_Course]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Get_DDL_Course]
AS
BEGIN
	SELECT Course_Id
		,CourseName
	FROM [ASP].[Course]
END



GO
/****** Object:  StoredProcedure [ASP].[Get_DDL_Department]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Get_DDL_Department]
AS
BEGIN
	SELECT Dept_Id
		,Dept_Desc
	FROM [ASP].[Department]
END



GO
/****** Object:  StoredProcedure [ASP].[Get_DDL_Users]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [ASP].[Get_DDL_Users] (@role INT)

AS

BEGIN

	SELECT *

	FROM [ASP].[User]

	WHERE Role_Id = @role

END



GO
/****** Object:  StoredProcedure [ASP].[GET_DISCUSSION]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[GET_DISCUSSION] (
	@StudentID INT = NULL
	,@Type CHAR(2) = NULL
	)
AS
BEGIN
	IF (@Type = 'PR')
		SELECT Student_id
			,(ST.FirstName + ' ' + ST.LastName) AS StudentName
			,Professor_Id
			,(PR.FirstName + ' ' + PR.LastName) AS ProfessorName
			,Discussion_topic
			,Discussion_msg
			,Discussion_Ans
		FROM ASP.Discussion DI
		INNER JOIN ASP.[User] AS ST ON ST.userid = Student_id
		INNER JOIN ASP.[User] AS PR ON PR.userid = Professor_Id
	ELSE
		SELECT Student_id
			,(ST.FirstName + ' ' + ST.LastName) AS StudentName
			,Professor_Id
			,(PR.FirstName + ' ' + PR.LastName) AS ProfessorName
			,Discussion_topic
			,Discussion_msg
			,Discussion_Ans
		FROM ASP.Discussion DI
		INNER JOIN ASP.[User] AS ST ON ST.userid = Student_id
		INNER JOIN ASP.[User] AS PR ON PR.userid = Professor_Id
		WHERE DI.Student_id = @StudentID
END

GO
/****** Object:  StoredProcedure [ASP].[GET_RANKS]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [ASP].[GET_RANKS] 
AS
BEGIN
	/****** Script for SelectTopNRows command from SSMS  ******/
	SELECT rank() OVER (ORDER BY m.percentage desc) as rank, u.FirstName as StudentName, M.percentage,m.FinalGrade from [ASP].[Marks] M left outer join [asp].[user] u on u.userid=m.StudentId order by Percentage desc
END

GO
/****** Object:  StoredProcedure [ASP].[Get_Student_AssigmentWork]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [ASP].[Get_Student_AssigmentWork]
(
@StudentID INT = NULL
)
AS
BEGIN
Select assignment_id,AssignmentWork From ASP.Assignment Where StudentId = @StudentID
END
GO
/****** Object:  StoredProcedure [ASP].[Get_Student_Discussions]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Get_Student_Discussions] (@StudentID INT = NULL)
AS
BEGIN
	SELECT [id]
		,[Discussion_topic]
	FROM ASP.Discussion
	WHERE Student_id = @StudentID
END

GO
/****** Object:  StoredProcedure [ASP].[Get_Student_Topic]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [ASP].[Get_Student_Topic]
(
@StudentID INT = NULL
)
AS
BEGIN
Select assignment_id,Topic From ASP.Assignment Where StudentId = @StudentID
END
GO
/****** Object:  StoredProcedure [ASP].[Get_Students_Information]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Get_Students_Information] (@role INT)
AS
BEGIN
	SELECT *
	FROM [ASP].[User]
	WHERE Role_Id = @role
END



GO
/****** Object:  StoredProcedure [ASP].[Get_Students_Information_By_Prof]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Get_Students_Information_By_Prof] (
	@role INT = NULL
	,@ProfId INT = NULL
	)
AS
BEGIN
	SELECT *
	FROM [ASP].[User]
	WHERE Role_Id = @role
		AND Prof_Id = @ProfId
END

GO
/****** Object:  StoredProcedure [ASP].[Get_User_Details]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Get_User_Details] (
	@UserName VARCHAR(100) = NULL
	,@Password VARCHAR(100) = NULL
	)
AS
BEGIN
	SELECT M.membership_id
		,username
		,pwd
		,IsActive
		,createdDate
		,userid
		,FirstName
		,LastName
		,middleName
		,Role_Id
		,DOB
		,email
		,Phoneno
		,gender
		,dateOfJoining
		,Course_Id
		,Dept_Id
		,Prof_Id
	FROM [ASP].[Membership] AS M
	INNER JOIN [ASP].[User] AS U ON m.membership_id = u.membership_id
	WHERE m.username = @UserName
		AND m.pwd = @Password
END



GO
/****** Object:  StoredProcedure [ASP].[Get_User_Information_For_Edit]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Get_User_Information_For_Edit] (
	@UserID INT = NULL
	)
AS
BEGIN
	SELECT U.userid
		,U.membership_id
		,U.FirstName
		,U.LastName
		,U.middleName
		,U.Role_Id
		,U.DOB
		,U.email
		,U.Phoneno
		,U.gender
		,U.dateOfJoining
		,C.Course_Id
		,C.CourseName
		,D.Dept_Id
		,D.Dept_Desc
		,A.userid AS Prof_Id
		,(A.FirstName + ' ' + A.LastName) As ProfessorName
	FROM [ASP].[User] AS U
	LEFT JOIN ASP.Course AS C ON C.Course_Id = U.Course_Id
	LEFT JOIN ASP.Department AS D ON D.Dept_Id = U.Dept_Id
	LEFT JOIN ASP.[User] AS A ON U.Prof_Id = A.userid
	WHERE U.userid = @UserID
END



GO
/****** Object:  StoredProcedure [ASP].[Get_UsersInformation]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Get_UsersInformation] (@role INT)
AS
BEGIN
 SELECT U.userid
  ,U.membership_id
  ,U.FirstName
  ,U.LastName
  ,U.middleName
  ,U.Role_Id
  ,U.DOB
  ,U.email
  ,U.Phoneno
  ,U.gender
  ,U.dateOfJoining
  ,C.Course_Id
  ,C.CourseName
  ,D.Dept_Id
  ,D.Dept_Desc
  ,A.userid AS Prof_Id
  ,(A.FirstName + ' ' + A.LastName) AS ProfessorName
  ,ST.sports_Id
  ,S.[description] AS SportsDesc
 FROM [ASP].[User] AS U
 LEFT JOIN ASP.Course AS C ON C.Course_Id = U.Course_Id
 LEFT JOIN ASP.Department AS D ON D.Dept_Id = U.Dept_Id
 LEFT JOIN ASP.[User] AS A ON U.Prof_Id = A.userid 
 LEFT JOIN [dbo].[EnrollSports] AS S ON S.StudentId = U.userid
 LEFT JOIN [dbo].[SportsType] AS ST ON ST.sports_Id = S.SportsId
 WHERE U.Role_Id = @role
END
GO
/****** Object:  StoredProcedure [ASP].[Insert_Student_Fee]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Insert_Student_Fee] (
    @StudentID INT = NULL
	,@SchoolName VARCHAR(500) = NULL
	,@LocationName VARCHAR(500) = NULL
	,@ProfessorID INT = NULL
	,@CourseID INT = NULL
	,@AdmissionNumber VARCHAR(500) = NULL
	,@RollNumber VARCHAR(50) = NULL
	,@FeeReceiptNumber VARCHAR(50) = NULL
	,@PaymentDate DATETIME = NULL
	)
AS
BEGIN
	INSERT INTO [dbo].[StudentFee] (
	     [StudentID]
		,[SchoolName]
		,[LocationName]
		,[ProfessorID]
		,[CourseID]
		,[AdmissionNumber]
		,[RollNumber]
		,[FeeReceiptNumber]
		,[PaymentDate]
		)
	VALUES (
	     @StudentID
		,@SchoolName
		,@LocationName
		,@ProfessorID
		,@CourseID
		,@AdmissionNumber
		,@RollNumber
		,@FeeReceiptNumber
		,@PaymentDate
		)
END

GO
/****** Object:  StoredProcedure [ASP].[Insert_User_Details]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Insert_User_Details] (
	@username VARCHAR(100) = NULL
	,@pwd VARCHAR(100) = NULL
	,@FirstName VARCHAR(100) = NULL
	,@LastName VARCHAR(100) = NULL
	,@middleName VARCHAR(100) = NULL
	,@Role_Id SMALLINT = NULL
	,@DOB DATETIME = NULL
	,@email VARCHAR(100) = NULL
	,@Phoneno VARCHAR(100) = NULL
	,@gender CHAR(2) = NULL
	,@dateOfJoining DATETIME = NULL
	,@Course_Id SMALLINT = NULL
	,@Dept_Id SMALLINT = NULL
	,@Prof_Id BIGINT = NULL
	,@MembershipID INT OUTPUT
	)
AS
BEGIN
	INSERT INTO [ASP].[Membership] (
		[username]
		,[pwd]
		)
	VALUES (
		@username
		,@pwd
		)

	SET @MembershipID = SCOPE_IDENTITY()

	INSERT INTO [ASP].[User] (
		[membership_id]
		,[FirstName]
		,[LastName]
		,[middleName]
		,[Role_Id]
		,[DOB]
		,[email]
		,[Phoneno]
		,[gender]
		,[dateOfJoining]
		,[Course_Id]
		,[Dept_Id]
		,[Prof_Id]
		)
	VALUES (
		@MembershipID
		,@FirstName
		,@LastName
		,@middleName
		,@Role_Id
		,@DOB
		,@email
		,@Phoneno
		,@gender
		,GETDATE()
		,@Course_Id
		,@Dept_Id
		,@Prof_Id
		)
END



GO
/****** Object:  StoredProcedure [ASP].[UDATE_STUDENT_EDUCATION_INFO]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[UDATE_STUDENT_EDUCATION_INFO] (
	@UserID INT = NULL
	,@SSCMarks VARCHAR(10) = NULL
	,@SSCPercentage VARCHAR(10) = NULL
	,@YearOfPassing VARCHAR(50) = NULL
	,@IntermediateMarks VARCHAR(50) = NULL
	,@IntermediatePercentage VARCHAR(50) = NULL
	)
AS
BEGIN
	UPDATE ASP.[USER]
	SET [SSCMarks] = @SSCMarks
		,[SSCPercentage] = @SSCPercentage
		,[YearOfPassing] = @YearOfPassing
		,[IntermediateMarks] = @IntermediateMarks
		,[IntermediatePercentage] = @IntermediatePercentage
	WHERE UserID = @UserID
END


GO
/****** Object:  StoredProcedure [ASP].[UDATE_STUDENT_PARENT_INFO]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[UDATE_STUDENT_PARENT_INFO] (
	@UserID INT = NULL
	,@FatherName VARCHAR(150) = NULL
	,@MotherName VARCHAR(150) = NULL
	,@PresentAddress VARCHAR(500) = NULL
	,@PermanentAddress VARCHAR(500) = NULL
	,@ParentPhone VARCHAR(15) = NULL
	,@ParentEmail VARCHAR(150) = NULL
	)
AS
BEGIN
	UPDATE ASP.[USER]
	SET [FatherName] = @FatherName
		,[MotherName] = @MotherName
		,[PresentAddress] = @PresentAddress
		,[PermanentAddress] = @PermanentAddress
		,[ParentPhone] = @ParentPhone
		,[ParentEmail] = @ParentEmail
	WHERE UserID = @UserID
END


GO
/****** Object:  StoredProcedure [ASP].[Update_Professor_Details]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ASP].[Update_Professor_Details] (
	@FirstName VARCHAR(100) = NULL
	,@LastName VARCHAR(100) = NULL
	,@middleName VARCHAR(100) = NULL
	,@DOB DATETIME = NULL
	,@email VARCHAR(100) = NULL
	,@Phoneno VARCHAR(100) = NULL
	,@gender CHAR(2) = NULL
	,@dateOfJoining DATETIME = NULL
	,@Course_Id SMALLINT = NULL
	,@Dept_Id SMALLINT = NULL
	,@userid BIGINT = 3
	,@pic VARBINARY(max) = NULL
	)
AS
BEGIN
	UPDATE [ASP].[User]
	SET [FirstName] = @FirstName
		,[LastName] = @LastName
		,[middleName] = @middleName
		,[DOB] = @DOB
		,[email] = @email
		,[Phoneno] = @Phoneno
		,[gender] = @gender
		,[dateOfJoining] = @dateOfJoining
		,[Course_Id] = @Course_Id
		,[Dept_Id] = @Dept_Id
		,[pic] = @pic
	WHERE userid = @userid
END



GO
/****** Object:  StoredProcedure [ASP].[Update_Student_Discussions]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Update_Student_Discussions] 
(
@DiscussionID INT = NULL
,@Answar VARCHAR(500)= NULL
)
AS
BEGIN
	Update ASP.Discussion Set [Discussion_Ans]= @Answar
	WHERE [id] = @DiscussionID
END

GO
/****** Object:  StoredProcedure [ASP].[Update_User_Details]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[Update_User_Details] (
	@UserID INT = NULL
	,@FirstName VARCHAR(100) = NULL
	,@LastName VARCHAR(100) = NULL
	,@middleName VARCHAR(100) = NULL
	,@Role_Id SMALLINT = NULL
	,@DOB DATETIME = NULL
	,@email VARCHAR(100) = NULL
	,@Phoneno VARCHAR(100) = NULL
	,@gender CHAR(2) = NULL
	,@Course_Id SMALLINT = NULL
	,@Dept_Id SMALLINT = NULL
	,@Prof_Id BIGINT = NULL
	)
AS
BEGIN
	UPDATE [ASP].[User]
	SET [FirstName] = @FirstName
		,[LastName] = @LastName
		,[middleName] = @middleName
		,[DOB] = @DOB
		,[email] = @email
		,[Phoneno] = @Phoneno
		,[gender] = @gender
		,[Course_Id] = @Course_Id
		,[Dept_Id] = @Dept_Id
		,[Prof_Id] = @Prof_Id
	WHERE Userid = @UserID
END



GO
/****** Object:  StoredProcedure [ASP].[Verify_Authentication]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- MYEMS_verifyuser 'admin','asd'
CREATE PROCEDURE [ASP].[Verify_Authentication] (
	@UserName VARCHAR(100) = NULL
	,@Password VARCHAR(100) = NULL
	)
AS
BEGIN
	SELECT count(*)
	FROM [ASP].[Membership]
	WHERE username = @UserName
		AND pwd = @Password
		AND IsActive = 1
END



GO
/****** Object:  StoredProcedure [ASP].[View_Annoucement]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ASP].[View_Annoucement] (
	@UserID INT = NULL
	,@RoleID INT = NULL
	)
AS
BEGIN
	SELECT *
	FROM ASP.Announcement
	WHERE DestinationId = @UserID
		AND CONVERT(DATE, AnnounceDate) = CONVERT(DATE, GETDATE())
	
	UNION
	
	SELECT *
	FROM ASP.Announcement
	WHERE DestinationId = (
			CASE 
				WHEN @RoleID = 2
					THEN 0
				ELSE - 1
				END
			)
		AND CONVERT(DATE, AnnounceDate) = CONVERT(DATE, GETDATE())
END

GO
/****** Object:  StoredProcedure [ASP].[VIEW_MARKS]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [ASP].[VIEW_MARKS] (@studentid INT)
AS
BEGIN
	/****** Script for SelectTopNRows command from SSMS  ******/
	SELECT *
	FROM [ASP].[Marks]
	WHERE StudentId = @studentid
END

GO
/****** Object:  StoredProcedure [dbo].[ADD_COURSE_ENROLL]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_COURSE_ENROLL]
	(
	   @Studentid int, 
           @CourseId int, 
           @CourseType int, 
           @SchoolName varchar(500)=null, 
           @LocationName varchar(500)=null, 
           @Professorid int
	)
AS
BEGIN
	INSERT INTO [dbo].[EnrollCourse]
           ([Studentid]
           ,[CourseId]
           ,[CourseType]
           ,[SchoolName]
           ,[LocationName]
           ,[Professorid])
     VALUES
           (
		   @Studentid, 
           @CourseId, 
           @CourseType, 
           @SchoolName,
           @LocationName, 
           @Professorid
		   )

		   update asp.[User] set Prof_Id=@Professorid where userid=@Studentid
END 

GO
/****** Object:  StoredProcedure [dbo].[ADD_SPORTS_ENROLL]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_SPORTS_ENROLL]
(
 @SportsId int,
@description varchar(500),
           @StudentId int
		   )
AS
BEGIN
INSERT INTO [dbo].[EnrollSports]
           (SportsId,
           [description]
           ,[StudentId])
     VALUES
           (
		   @SportsId,
           @description, 
           @StudentId)
END


GO
/****** Object:  StoredProcedure [dbo].[GET_DDL_SPORTSTYPE]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_DDL_SPORTSTYPE]
	
AS
BEGIN
	SELECT  [sports_Id]
      ,[Name]
  FROM [SportsType]
END


GO
/****** Object:  StoredProcedure [dbo].[sp_contactus]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_contactus](
@FirstName  varchar(200),
@LastName  varchar(200),
@Email  varchar(500),
@PhoneNumber  varchar(500),
@Information  varchar(500)


) as
begin

INSERT INTO [dbo].[contactUs]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[PhoneNumber]
           ,[Information])
     VALUES
           (@FirstName
           ,@LastName
           ,@Email
           ,@PhoneNumber
           ,@Information)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_test]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_test]
(
@number1 int,
@number2 int
)
as
begin

select * from ASP.Announcement where id=@number1

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePassword]    Script Date: 10-11-2016 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdatePassword]
(
@newpwd varchar(40),
@memid int

)
as
begin

update ASP.Membership set pwd=@newpwd where membership_id=@memid

end
GO
USE [master]
GO
ALTER DATABASE [EMS] SET  READ_WRITE 
GO
