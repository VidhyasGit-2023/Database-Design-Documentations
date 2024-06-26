USE [master]
GO
/****** Object:  Database [WonderfulWheels]    Script Date: 6/18/2022 2:08:38 AM ******/
CREATE DATABASE [WonderfulWheels]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WonderfulWheels', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WonderfulWheels.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WonderfulWheels_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WonderfulWheels_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WonderfulWheels] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WonderfulWheels].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WonderfulWheels] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WonderfulWheels] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WonderfulWheels] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WonderfulWheels] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WonderfulWheels] SET ARITHABORT OFF 
GO
ALTER DATABASE [WonderfulWheels] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WonderfulWheels] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WonderfulWheels] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WonderfulWheels] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WonderfulWheels] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WonderfulWheels] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WonderfulWheels] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WonderfulWheels] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WonderfulWheels] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WonderfulWheels] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WonderfulWheels] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WonderfulWheels] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WonderfulWheels] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WonderfulWheels] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WonderfulWheels] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WonderfulWheels] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WonderfulWheels] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WonderfulWheels] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WonderfulWheels] SET  MULTI_USER 
GO
ALTER DATABASE [WonderfulWheels] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WonderfulWheels] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WonderfulWheels] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WonderfulWheels] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WonderfulWheels] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WonderfulWheels] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WonderfulWheels] SET QUERY_STORE = OFF
GO
USE [WonderfulWheels]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[AccountBalance] [float] NOT NULL,
	[LastPaymentAmount] [float] NOT NULL,
	[LastPaymentDate] [date] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComissionEmployee]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComissionEmployee](
	[EmployeeID] [int] NOT NULL,
	[Comission] [float] NOT NULL,
 CONSTRAINT [PK_ComissionEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealership]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealership](
	[DealershipID] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NULL,
	[Name] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Dealership] PRIMARY KEY CLUSTERED 
(
	[DealershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmpDealID] [int] NULL,
	[HireDate] [date] NULL,
	[Role] [varchar](50) NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCusID] [int] NULL,
	[OrderEmpID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[OrderDealID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderID] [int] NOT NULL,
	[VehicleID] [int] NULL,
	[FinalSalePrice] [float] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PerLocID] [int] NULL,
	[DateofBirth] [date] NULL,
	[Title] [varchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryEmployee]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryEmployee](
	[EmployeeID] [int] NOT NULL,
	[Salary] [float] NOT NULL,
 CONSTRAINT [PK_SalaryEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 6/18/2022 2:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Year] [date] NULL,
	[Colour] [varchar](50) NULL,
	[Km] [int] NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_AccountBalance]  DEFAULT ((0.00)) FOR [AccountBalance]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_LastPaymentAmount]  DEFAULT ((0.00)) FOR [LastPaymentAmount]
GO
ALTER TABLE [dbo].[ComissionEmployee] ADD  CONSTRAINT [DF_ComissionEmployee_Comission]  DEFAULT ((0.00)) FOR [Comission]
GO
ALTER TABLE [dbo].[OrderItem] ADD  CONSTRAINT [DF_OrderItem_FinalSalePrice]  DEFAULT ((0.00)) FOR [FinalSalePrice]
GO
ALTER TABLE [dbo].[SalaryEmployee] ADD  CONSTRAINT [DF_SalaryEmployee_Salary]  DEFAULT ((0.00)) FOR [Salary]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF_Vehicle_Price]  DEFAULT ((0.00)) FOR [Price]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[ComissionEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ComissionEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[ComissionEmployee] CHECK CONSTRAINT [FK_ComissionEmployee_Employee]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer]
GO
ALTER TABLE [dbo].[Dealership]  WITH CHECK ADD  CONSTRAINT [FK_Dealership_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Dealership] CHECK CONSTRAINT [FK_Dealership_Location]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Dealership] FOREIGN KEY([EmpDealID])
REFERENCES [dbo].[Dealership] ([DealershipID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Dealership]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([OrderCusID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Dealership] FOREIGN KEY([OrderDealID])
REFERENCES [dbo].[Dealership] ([DealershipID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Dealership]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([OrderEmpID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Vehicle]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Location] FOREIGN KEY([PerLocID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Location]
GO
ALTER TABLE [dbo].[SalaryEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SalaryEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SalaryEmployee] CHECK CONSTRAINT [FK_SalaryEmployee_Employee]
GO
ALTER TABLE [dbo].[ComissionEmployee]  WITH CHECK ADD  CONSTRAINT [CK_ComissionEmployee] CHECK  (([Comission]>=(10)))
GO
ALTER TABLE [dbo].[ComissionEmployee] CHECK CONSTRAINT [CK_ComissionEmployee]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [CK_OrderItem] CHECK  (([FinalSalePrice]>=(1)))
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [CK_OrderItem]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [CK_Person] CHECK  (([Title]='Ms' OR [Title]='Mr' OR [Title]='Mrs'))
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [CK_Person]
GO
ALTER TABLE [dbo].[SalaryEmployee]  WITH CHECK ADD  CONSTRAINT [CK_SalaryEmployee] CHECK  (([Salary]>=(1000)))
GO
ALTER TABLE [dbo].[SalaryEmployee] CHECK CONSTRAINT [CK_SalaryEmployee]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [CK_Vehicle] CHECK  (([Price]>=(1)))
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [CK_Vehicle]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'([Salary] !< 1000)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalaryEmployee', @level2type=N'CONSTRAINT',@level2name=N'CK_SalaryEmployee'
GO
USE [master]
GO
ALTER DATABASE [WonderfulWheels] SET  READ_WRITE 
GO
