USE [WonderfulWheelsDW]
GO

/****** Object:  Table [dbo].[DimCommissionEmployee]    Script Date: 2023-07-21 7:59:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCommissionEmployee](
	[EmployeeSK] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeAK] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Title] [varchar](50) NULL,
	[HireDate] [date] NULL,
	[EmpRole] [varchar](50) NULL,
	[Commission] [float] NOT NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_DimCommissionEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


