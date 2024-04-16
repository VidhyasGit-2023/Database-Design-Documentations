USE [WonderfulWheelsDW]
GO

/****** Object:  Table [dbo].[DimVehicle]    Script Date: 2023-07-21 8:00:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimVehicle](
	[VehicleSK] [int] IDENTITY(1,1) NOT NULL,
	[VehicleAK] [int] NOT NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Year] [date] NULL,
	[Color] [varchar](50) NULL,
	[Km] [int] NULL,
	[Price] [float] NOT NULL,
CONSTRAINT [PK_DimVehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO