USE [WonderfulWheelsDW]
GO

/****** Object:  Table [dbo].[DimDealership]    Script Date: 2023-07-21 8:02:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDealership](
	[DealershipSK] [int] IDENTITY(1,1) NOT NULL,
	[DealershipAK] [int] NOT NULL,
	[DealershipName] [varchar](50) NULL,
	[StreetAddress] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimDealership] PRIMARY KEY CLUSTERED 
(
	[DealershipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

