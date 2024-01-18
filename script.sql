USE [master]
GO
/****** Object:  Database [sql]    Script Date: 18-01-2024 11:57:26 ******/
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
/****** Object:  User [sreenath]    Script Date: 18-01-2024 11:57:26 ******/
CREATE USER [sreenath] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sree]    Script Date: 18-01-2024 11:57:26 ******/
CREATE USER [sree] FOR LOGIN [sree] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [myadmin]    Script Date: 18-01-2024 11:57:26 ******/
CREATE USER [myadmin] FOR LOGIN [myadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 18-01-2024 11:57:26 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[department]    Script Date: 18-01-2024 11:57:26 ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 18-01-2024 11:57:26 ******/
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
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_grade]    Script Date: 18-01-2024 11:57:26 ******/
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
SET IDENTITY_INSERT [dbo].[department] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (6, N'KAYLING', N'PRESIDENT', NULL, CAST(N'1991-11-18' AS Date), CAST(6000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (7, N'BLAZE', N'MANAGER', 68319, CAST(N'1991-05-01' AS Date), CAST(2750.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (8, N'CLARE', N'MANAGER', 68319, CAST(N'1991-06-09' AS Date), CAST(2550.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (9, N'JONAS', N'MANAGER', 68319, CAST(N'1991-04-02' AS Date), CAST(2957.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (10, N'SCARLET', N'ANALYST', 65646, CAST(N'1997-04-19' AS Date), CAST(3100.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (12, N'FRANK', N'ANALYST', 65646, CAST(N'1991-12-03' AS Date), CAST(3100.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (13, N'SANDRINE', N'CLERK', 69062, CAST(N'1990-12-18' AS Date), CAST(900.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (14, N'ADELYIN', N'SALESMAN', 66928, CAST(N'1991-02-20' AS Date), CAST(1700.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(7, 2)), 3)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (15, N'WADE', N'SALESMAN', 66928, CAST(N'1991-09-22' AS Date), CAST(1350.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(7, 2)), 3)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (16, N'MADDEN', N'SALESMAN', 66928, CAST(N'1991-09-28' AS Date), CAST(1350.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(7, 2)), 3)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (17, N'TUCKER', N'SALESMAN', 66928, CAST(N'1991-09-08' AS Date), CAST(1600.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(7, 2)), 3)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (18, N'ADNRES', N'CLERK', 67858, CAST(N'1997-05-23' AS Date), CAST(1200.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (19, N'JULIUS', N'CLERK', 66928, CAST(N'1991-12-03' AS Date), CAST(1050.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (20, N'MARKER', N'CLERK', 67832, CAST(N'1992-01-23' AS Date), CAST(1400.00 AS Decimal(10, 2)), NULL, 1)
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
USE [master]
GO
ALTER DATABASE [sql] SET  READ_WRITE 
GO




--1. From the above table return complete information about the employees.


	SELECT *FROM employees

--2. From the table, write a SQL query to find the salaries of all employees. Return salary. 
	
	SELECT salary FROM employees

--3. From the table, write a SQL query to find the unique designations of the employees. Return job name. 
	
	SELECT DISTINCT job_name FROM employees

--4. From the following table, write a SQL query to list the employees’ names, increase their salary by 15%, and express the number of Dollars.
	
	SELECT emp_name, CONCAT('$', ROUND((salary + (salary * 0.15)), 0)) AS Salary
	FROM employees;

--5. From the following table, write a SQL query to list the employees name and job name as a format of "Employee & Job".

	SELECT emp_name +job_name as "Employee&Job" from employees

--6. From the following table, write a SQL query to find those employees with a hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date. 

	SELECT emp_id,emp_name,salary,FORMAT(hire_date,'MMMM dd/yyyy') as to_char from employees

--7. From the following table, write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.

	SELECT DATALENGTH(emp_name) as length from  employees

--8From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees. 

	SELECT emp_id,salary ,commission from employees

--9. From the following table, write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees. (Using NOT IN)

	SELECT *FROM employees WHERE dep_id NOT IN('2')

--10. From the following table, write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
	
	SELECT *FROM employees WHERE hire_date < '1991-01-01'

--11.From the following table, write a SQL query to compute the average salary of those employees who work as ‘ANALYST’. Return average salary.
	
	SELECT AVG(salary) AS avg FROM employees WHERE job_name='ANALYST'

--12. From the following table, write a SQL query to find the details of the employee ‘BLAZE’.

	SELECT *FROM employees WHERE emp_name ='BLAZE'

--13. From the following table, write a SQL query to find those employees whose salary exceeds 3000 after giving a 25% increment. Return complete information about the employees.  

	SELECT *FROM employees WHERE (salary+(salary*0.25))>3000

--14 From the following table, write a SQL query to find those employees who joined in the month January. Return complete information about the employees.
	
	SELECT *FROM employees WHERE hire_date LIKE '_____01%'

--15 From the following table, write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary. 

		SELECT *FROM employees WHERE hire_date < '1991-04-01'

--16 From the following table, write a SQL query to find the name and salary of the employee FRANK.
	
	SELECT emp_name,salary FROM employees WHERE emp_name ='FRANK' 

--17. From the following table, write a SQL query to list all the employees except PRESIDENT and MANAGER in ascending order of salaries. Return complete information about the employees.  (Using Order By)
	
	SELECT *FROM employees where job_name NOT IN('PRESIDENT','MANAGER') ORDER BY salary

--18. From the following table, write a SQL query to find the highest salary. Return the highest salary.
	
	SELECT MAX(salary) as max FROM employees

--19 From the table, write a SQL query to find the average salary and average total remuneration (salary and commission) for each type of job. Return name, average salary and average total remuneration. (Using GROUP BY)
	
	SELECT  job_name,avg(salary) as avg ,( sum(salary)+sum(commission) )/count(emp_name) as avg  from employees group by job_name

--20 From the following table, write a SQL query to find those employees who work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, department location, and department name.(Using IN clause)

	SELECT emp_id,emp_name,employees.dep_id dep_location,dep_name from employees inner join department on employees.dep_id = department.dep_id where department.dep_id in('1','2')

--21. From the table, write a SQL query to list the managers and number of employees work under them. Sort the result set in ascending order on manager. Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)
	
	SELECT DISTINCT manager_id,COUNT(emp_id) as count FROM employees WHERE manager_id >0  GROUP BY manager_id ORDER BY manager_id

--22From the table, write a SQL query to find those departments where at least two employees work. Return department id, number of employees.(GROUP BY & HAVING)
	
	SELECT dep_id, count(dep_id) FROM employees GROUP BY dep_id HAVING count(dep_id)>2

--23. From the table, write a SQL query to find those employees whose names contain the character set 'AR' together. Return complete information about the employees. (using ‘like’)
	
	SELECT *FROM employees WHERE emp_name LIKE '%AR%'

--24  Add a column for “Gender” in the employee table and update each row accordingly. 
	
	ALTER TABLE employees ADD gender varchar(2)
	SELECT *FROM employees
	
--25. From the above table we need to retrieve all employees except ‘Manager’ & ’President’ Job name. 
	
	SELECT * FROM employees WHERE job_name NOT IN ('MANAGER','PRESIDENT')

--26. From the above table we need to display ‘Management Level’ - labelname for ‘President’,’Manager’,’Analyst’ jobs and ‘Employee Level’ - label name for ‘Salesman’,’Clerk’ job names.
	
	SELECT emp_name,job_name,
	CASE
	WHEN  job_name  IN('PRESIDENT','MANAGER','ANALYST') THEN 'Management Level'
	WHEN job_name IN('SALESMAN','CLERK') THEN 'Employee Level'
	END AS label
	from employees

--27 Update commission field to 650.00 for job name titled as  “analyst” in “employee” table using “Exist” clauses.

	update employees set commission=0.00 where emp_id=17


	 