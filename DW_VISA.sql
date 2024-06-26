USE [master]
GO
/****** Object:  Database [DW_VISA]    Script Date: 11/9/2023 10:02:56 PM ******/
CREATE DATABASE [DW_VISA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW_VISA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DW_VISA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DW_VISA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DW_VISA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DW_VISA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW_VISA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW_VISA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW_VISA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW_VISA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW_VISA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW_VISA] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW_VISA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW_VISA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW_VISA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW_VISA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW_VISA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW_VISA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW_VISA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW_VISA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW_VISA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW_VISA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DW_VISA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW_VISA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW_VISA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW_VISA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW_VISA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW_VISA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW_VISA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW_VISA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DW_VISA] SET  MULTI_USER 
GO
ALTER DATABASE [DW_VISA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW_VISA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW_VISA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW_VISA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DW_VISA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DW_VISA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DW_VISA] SET QUERY_STORE = OFF
GO
USE [DW_VISA]
GO
/****** Object:  Table [dbo].[country_lookup]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_lookup](
	[code] [int] NOT NULL,
	[country] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[demo_staging]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[demo_staging](
	[city] [varchar](255) NOT NULL,
	[state] [varchar](255) NOT NULL,
	[median_age] [real] NULL,
	[male_pop] [real] NULL,
	[female_pop] [real] NULL,
	[total_pop] [bigint] NULL,
	[no_vet] [real] NULL,
	[foreign_born] [real] NULL,
	[avg_household_size] [real] NULL,
	[state_code] [varchar](50) NULL,
	[race] [varchar](255) NOT NULL,
	[count] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_city]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_city](
	[city] [varchar](255) NOT NULL,
	[state] [varchar](255) NULL,
	[median_age] [real] NULL,
	[male_pop] [real] NULL,
	[female_pop] [real] NULL,
	[total_pop] [bigint] NULL,
	[no_vet] [real] NULL,
	[foreign_born] [real] NULL,
	[avg_household_size] [real] NULL,
	[state_code] [varchar](10) NULL,
	[race] [varchar](255) NOT NULL,
	[count] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_country]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_country](
	[code] [int] NOT NULL,
	[country] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_port]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_port](
	[port_code] [varchar](10) NOT NULL,
	[port_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[port_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_state]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_state](
	[state_code] [varchar](10) NOT NULL,
	[state] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[state_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_visa]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_visa](
	[visa_code] [varchar](10) NOT NULL,
	[visa_type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[visa_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i94fact]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i94fact](
	[ccid] [bigint] NOT NULL,
	[country_code] [int] NULL,
	[state_code] [varchar](10) NULL,
	[port_code] [varchar](10) NULL,
	[age_bir] [int] NULL,
	[visa_code] [varchar](10) NULL,
	[biryear] [int] NULL,
	[gender] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ccid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i94staging]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i94staging](
	[ccid] [bigint] NOT NULL,
	[i94yr] [bigint] NULL,
	[i94mon] [bigint] NULL,
	[i94cit] [bigint] NULL,
	[i94res] [int] NULL,
	[i94port] [varchar](50) NULL,
	[arrdate] [bigint] NULL,
	[i94mode] [bigint] NULL,
	[i94addr] [varchar](50) NULL,
	[depdate] [bigint] NULL,
	[i94bir] [int] NULL,
	[i94visa] [int] NULL,
	[count] [bigint] NULL,
	[dtadfile] [bigint] NULL,
	[visapost] [varchar](50) NULL,
	[occup] [varchar](50) NULL,
	[entdepa] [varchar](50) NULL,
	[entdepd] [varchar](50) NULL,
	[entdepu] [varchar](50) NULL,
	[matflag] [varchar](50) NULL,
	[biryear] [bigint] NULL,
	[dtaddto] [varchar](255) NULL,
	[gender] [varchar](50) NULL,
	[insnum] [int] NULL,
	[airline] [varchar](50) NULL,
	[admnum] [varchar](255) NULL,
	[fltno] [varchar](50) NULL,
	[visatype] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ccid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_lookup]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_lookup](
	[port_code] [varchar](50) NOT NULL,
	[port_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[port_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visa_lookup]    Script Date: 11/9/2023 10:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visa_lookup](
	[visa_code] [varchar](50) NOT NULL,
	[visa_type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[visa_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_city]  WITH CHECK ADD  CONSTRAINT [fk_name] FOREIGN KEY([state_code])
REFERENCES [dbo].[dim_state] ([state_code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dim_city] CHECK CONSTRAINT [fk_name]
GO
ALTER TABLE [dbo].[i94fact]  WITH CHECK ADD FOREIGN KEY([country_code])
REFERENCES [dbo].[dim_country] ([code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[i94fact]  WITH CHECK ADD FOREIGN KEY([port_code])
REFERENCES [dbo].[dim_port] ([port_code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[i94fact]  WITH CHECK ADD FOREIGN KEY([state_code])
REFERENCES [dbo].[dim_state] ([state_code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[i94fact]  WITH CHECK ADD FOREIGN KEY([visa_code])
REFERENCES [dbo].[dim_visa] ([visa_code])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [DW_VISA] SET  READ_WRITE 
GO
