USE [master]
GO
/****** Object:  Database [sql]    Script Date: 22-01-2024 11:13:10 ******/
CREATE DATABASE [sql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sql_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sql] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sql] SET ARITHABORT OFF 
GO
ALTER DATABASE [sql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sql] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sql] SET RECOVERY FULL 
GO
ALTER DATABASE [sql] SET  MULTI_USER 
GO
ALTER DATABASE [sql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sql] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sql] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sql', N'ON'
GO
ALTER DATABASE [sql] SET QUERY_STORE = OFF
GO
USE [sql]
GO
/****** Object:  User [sreenath]    Script Date: 22-01-2024 11:13:10 ******/
CREATE USER [sreenath] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sree]    Script Date: 22-01-2024 11:13:10 ******/
CREATE USER [sree] FOR LOGIN [sree] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [myadmin]    Script Date: 22-01-2024 11:13:10 ******/
CREATE USER [myadmin] FOR LOGIN [myadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 22-01-2024 11:13:10 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[department]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[dep_id] [int] IDENTITY(1,1) NOT NULL,
	[dep_name] [varchar](20) NOT NULL,
	[dep_location] [varchar](20) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [varchar](50) NOT NULL,
	[job_name] [varchar](50) NOT NULL,
	[manager_id] [int] NULL,
	[hire_date] [date] NOT NULL,
	[salary] [decimal](10, 2) NOT NULL,
	[commission] [decimal](7, 2) NULL,
	[dep_id] [int] NOT NULL,
	[gender] [varchar](2) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_grade]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary_grade](
	[grade] [int] IDENTITY(1,1) NOT NULL,
	[min_salary] [int] NOT NULL,
	[max_salary] [int] NOT NULL,
 CONSTRAINT [PK_salary_grade] PRIMARY KEY CLUSTERED 
(
	[grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([dep_id], [dep_name], [dep_location]) VALUES (1, N'FINANCE', N'SYDNEY')
INSERT [dbo].[department] ([dep_id], [dep_name], [dep_location]) VALUES (2, N'AUDIT', N'MELBOURNE')
INSERT [dbo].[department] ([dep_id], [dep_name], [dep_location]) VALUES (3, N'MARKETING', N'PERTH')
INSERT [dbo].[department] ([dep_id], [dep_name], [dep_location]) VALUES (4, N'PRODUCTION', N'BRISBANE')
INSERT [dbo].[department] ([dep_id], [dep_name], [dep_location]) VALUES (1002, N'Researching', N'Kollam')
SET IDENTITY_INSERT [dbo].[department] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (6, N'KAYLING', N'PRESIDENT', NULL, CAST(N'1991-11-18' AS Date), CAST(6000.00 AS Decimal(10, 2)), NULL, 1, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (7, N'BLAZE', N'MANAGER', 68319, CAST(N'1991-05-01' AS Date), CAST(2750.00 AS Decimal(10, 2)), NULL, 3, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (8, N'CLARE', N'MANAGER', 68319, CAST(N'1991-06-09' AS Date), CAST(2550.00 AS Decimal(10, 2)), NULL, 1, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (9, N'JONAS', N'MANAGER', 68319, CAST(N'1991-04-02' AS Date), CAST(2957.00 AS Decimal(10, 2)), NULL, 2, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (10, N'SCARLET', N'ANALYST', 65646, CAST(N'1997-04-19' AS Date), CAST(3100.00 AS Decimal(10, 2)), CAST(650.00 AS Decimal(7, 2)), 2, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (12, N'FRANK', N'ANALYST', 65646, CAST(N'1991-12-03' AS Date), CAST(3100.00 AS Decimal(10, 2)), CAST(650.00 AS Decimal(7, 2)), 2, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (13, N'SANDRINE', N'CLERK', 69062, CAST(N'1990-12-18' AS Date), CAST(900.00 AS Decimal(10, 2)), NULL, 2, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (14, N'ADELYIN', N'SALESMAN', 66928, CAST(N'1991-02-20' AS Date), CAST(1700.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(7, 2)), 3, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (15, N'WADE', N'SALESMAN', 66928, CAST(N'1991-09-22' AS Date), CAST(1350.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(7, 2)), 3, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (16, N'MADDEN', N'SALESMAN', 66928, CAST(N'1991-09-28' AS Date), CAST(1350.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(7, 2)), 3, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (17, N'TUCKER', N'SALESMAN', 66928, CAST(N'1991-09-08' AS Date), CAST(1600.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(7, 2)), 3, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (18, N'ADNRES', N'CLERK', 67858, CAST(N'1997-05-23' AS Date), CAST(1200.00 AS Decimal(10, 2)), NULL, 2, NULL)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id], [gender]) VALUES (19, N'Anu', N'CLERK', 66928, CAST(N'1991-12-03' AS Date), CAST(1050.00 AS Decimal(10, 2)), NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[salary_grade] ON 

INSERT [dbo].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (1, 800, 1300)
INSERT [dbo].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (2, 1301, 1500)
INSERT [dbo].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (3, 1501, 2100)
INSERT [dbo].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (4, 2101, 3100)
INSERT [dbo].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (5, 3101, 9999)
SET IDENTITY_INSERT [dbo].[salary_grade] OFF
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_department] FOREIGN KEY([dep_id])
REFERENCES [dbo].[department] ([dep_id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_department]
GO
/****** Object:  StoredProcedure [dbo].[deleteById]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteById]
@empId int
as
delete from employees where emp_id=@empId
GO
/****** Object:  StoredProcedure [dbo].[insertData]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertData]
@depName varchar(max),@depLocation varchar(max)
as
insert into department(dep_name,dep_location)
values(@depName,@depLocation)
GO
/****** Object:  StoredProcedure [dbo].[updateById]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateById]
    @empId INT,
    @empName VARCHAR(MAX)  -- Adjust the length based on your actual column definition
AS 
BEGIN
    -- Updated SQL statements or modifications here
    UPDATE employees
    SET emp_name = @empName
    WHERE emp_id = @empId;
END;
GO
/****** Object:  StoredProcedure [dbo].[viewAll]    Script Date: 22-01-2024 11:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[viewAll]
as 
select *from employees
GO
USE [master]
GO
ALTER DATABASE [sql] SET  READ_WRITE 
GO

exec insertData @depName='Researching',@depLocation='Kollam'