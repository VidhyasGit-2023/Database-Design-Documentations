
USE [WonderfulWheelsDW]
GO

/****** Object:  Table [dbo].[FactSales]    Script Date: 2023-07-21 8:02:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSales](
	[OrderId] [int] NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[EmployeeSK] [int] NOT NULL,
	[CustomerSK] [int] NOT NULL,
	[VehicleSK] [int] NOT NULL,
	[DealershipSK] [int] NOT NULL,
	[FinalSalePrice] [float] NOT NULL,
	[OrderDateSK] [datetime] NULL,
	[Commission ] [float] NOT NULL,
	FOREIGN KEY (EmployeeSK) REFERENCES DimCommissionEmployee(EmployeeSK),
	FOREIGN KEY (CustomerSK) REFERENCES DimCustomer(CustomerSK),
	FOREIGN KEY (VehicleSK) REFERENCES DimVehicle(VehicleSK),
	FOREIGN KEY (DealershipSK) REFERENCES DimDealership(DealershipSK)
) GO