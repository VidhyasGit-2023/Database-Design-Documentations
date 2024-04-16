-- Step 1 First write the actual query for extracting employee sales data and test it

USE [WonderfulWheelsDW]
GO

DECLARE @FirstName VARCHAR(100),
			@LastName VARCHAR(100),
			@Year CHAR(4),
			@Month CHAR(2)

	SET @FirstName = ''
	SET @LastName = ''
	SET @Year = '2020'
	SET @Month = '10'

SELECT e.FirstName, e.LastName, CONCAT(e.Title, ' ',e.FirstName,' ',e.LastName) AS 'Employee Full Name',e.Email, DATEDIFF(YY, e.DateofBirth, GETDATE()) AS Age,
		DATEDIFF(YY, e.HireDate, GETDATE()) AS 'Years of service', e.Commission AS 'Commission Percentage', fs.[Commission ] AS 'Sale Commission',
		CONCAT(c.Title, ' ',c.FirstName,' ',c.LastName) AS 'Customer Name', c.RegDate AS 'Customer Registration Date',
		d.DealershipName AS 'Dealership Name', d.StreetAddress AS 'Dealership Street Address', d.City AS 'Dealership City', d.Province AS 'Dealership Province',
		v.Make AS 'Vehicle Make', v.Model, v.Year, v.Km, v.Price, fs.FinalSalePrice, dd.Year AS 'Sales Year',dd.CalendarQuarter AS 'Quarter', dd.Month AS 'Month'
		FROM dbo.DimCommissionEmployee e
		FULL OUTER JOIN [dbo].[FactSales] fs ON e.EmployeeSK = fs.EmployeeSK
		FULL OUTER JOIN [dbo].[DimCustomer] c ON fs.CustomerSK = c.CustomerSK
		FULL OUTER JOIN [dbo].[DimDealership] d ON fs.DealershipSK = d.DealershipSK
		FULL OUTER JOIN [dbo].[DimVehicle] v ON fs.VehicleSK = v.VehicleSK
		FULL OUTER JOIN [dbo].[Dim_Date] dd ON fs.OrderDateSK = dd.DateSK
		WHERE
		e.Commission IS NOT NULL 
		AND (e.FirstName = @FirstName OR @FirstName = '')
		AND (e.LastName = @LastName OR @LastName = '')
		AND (dd.Year = @Year OR @Year IS NULL)
		AND (dd.Month = @Month OR @Month IS NULL)
		
GO

-- Step 2 create view

-- Create a main view that is used to display Employee Sales data in report

USE [WonderfulWheelsDW]
GO

DROP VIEW IF EXISTS [dbo].[vwGetEmployeeSalesData] ;  
GO 

CREATE VIEW [dbo].[vwGetEmployeeSalesData] 
AS
		SELECT e.FirstName, e.LastName, CONCAT(e.Title, ' ',e.FirstName,' ',e.LastName) AS 'Employee Full Name',e.Email, DATEDIFF(YY, e.DateofBirth, GETDATE()) AS Age,
		DATEDIFF(YY, e.HireDate, GETDATE()) AS 'Years of service', e.Commission AS 'Commission Percentage', fs.[Commission ] AS 'Sale Commission',
		CONCAT(c.Title, ' ',c.FirstName,' ',c.LastName) AS 'Customer Name', c.RegDate AS 'Customer Registration Date',
		d.DealershipName AS 'Dealership Name', d.StreetAddress AS 'Dealership Street Address', d.City AS 'Dealership City', d.Province AS 'Dealership Province',
		v.Make AS 'Vehicle Make', v.Model, v.Year, v.Km, v.Price, fs.FinalSalePrice, dd.Year AS 'Sales Year',dd.CalendarQuarter AS 'Quarter', dd.Month AS 'Month'
		FROM dbo.DimCommissionEmployee e
		FULL OUTER JOIN [dbo].[FactSales] fs ON e.EmployeeSK = fs.EmployeeSK
		FULL OUTER JOIN [dbo].[DimCustomer] c ON fs.CustomerSK = c.CustomerSK
		FULL OUTER JOIN [dbo].[DimDealership] d ON fs.DealershipSK = d.DealershipSK
		FULL OUTER JOIN [dbo].[DimVehicle] v ON fs.VehicleSK = v.VehicleSK
		FULL OUTER JOIN [dbo].[Dim_Date] dd ON fs.OrderDateSK = dd.DateSK
		WHERE
		e.Commission IS NOT NULL
GO

-- Test view

	DECLARE @FirstName VARCHAR(100),
			@LastName VARCHAR(100), 
			@Year INT,
			@Month INT

	SET @FirstName = ''
	SET @LastName = ''
	SET @Year = 2020
	SET @Month = 10

	SELECT *
	FROM [dbo].[vwGetEmployeeSalesData]
	WHERE (FirstName LIKE '%' + @FirstName + '%' OR @FirstName = '' OR @FirstName IS NULL)
	AND (LastName LIKE '%' + @LastName + '%' OR @LastName = '' OR @LastName IS NULL)
	AND ([Sales Year] = @Year OR @Year IS NULL)
	AND (Month = @Month OR @Month IS NULL)
	ORDER BY FirstName, LastName

GO

-- Step 3 Create a main stored procedure and use the vwGetEmployeeSalesData view and test it. 

USE [WonderfulWheelsDW]
GO

DROP PROCEDURE IF EXISTS dbo.spGetEmployeeSalesData;  
GO

	CREATE PROCEDURE dbo.spGetEmployeeSalesData
	(
		@FirstName VARCHAR(100),
		@LastName VARCHAR(100),
		@Year INT,
		@Month INT
	)
	AS
	BEGIN

		SELECT *
		FROM [vwGetEmployeeSalesData]
		WHERE (FirstName LIKE '%' + @FirstName + '%' OR @FirstName = '' OR @FirstName IS NULL)
			AND (LastName LIKE '%' + @LastName + '%' OR @LastName = '' OR @LastName IS NULL)
			AND ([Sales Year] = @Year OR @Year IS NULL)
			AND (Month = @Month OR @Month IS NULL)
			ORDER BY FirstName, LastName

	END
	
GO

/*
		EXEC dbo.spGetEmployeeSalesData '', '', NULL, NULL
		EXEC dbo.spGetEmployeeSalesData '', '', NULL, 2020
		EXEC dbo.spGetEmployeeSalesData 'Tracy', '', NULL, NULL
*/

GO