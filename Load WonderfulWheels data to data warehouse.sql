/*
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimCommissionEmployee]
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimCustomer]
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimVehicle]
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimDealership]
	SELECT * FROM [WonderfulWheelsDW].[dbo].[FactSales]

*/


USE WonderfulWheels
GO	
-- Step 1 -- Load OLTP Employee and their Commission data into data warehouse **

	INSERT INTO [WonderfulWheelsDW].[dbo].[DimCommissionEmployee]
	SELECT 		
		e.EmployeeID AS EmployeeAK,
		p.FirstName,
		p.LastName,
		p.Email,
		p.DateOfBirth,
		p.Title,
		e.HireDate,
		e.Role AS EmpRole,
		ce.Comission AS Commission,
		e.ManagerId
	FROM Employee e
		JOIN Person p on e.EmployeeID = p.PersonID
		LEFT JOIN ComissionEmployee ce on e.EmployeeID = ce.EmployeeID

	-- Test 
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimCommissionEmployee]

GO

-- Step 2 -- Load OLTP Customer data into data warehouse **
	INSERT INTO [WonderfulWheelsDW].[dbo].[DimCustomer]
	SELECT c.CustomerID AS CustomerAK,
		p.FirstName,
		p.LastName,
		p.Email,
		p.DateOfBirth,
		p.Title,
		c.RegistrationDate AS RegDate
	FROM Customer c
		JOIN Person p ON c.CustomerID = p.PersonID

	-- Test 
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimCustomer]

GO

-- Step 3 -- Load OLTP Vehicle data into data warehouse **
	INSERT INTO [WonderfulWheelsDW].[dbo].[DimVehicle]
	SELECT v.VehicleID AS VehicleAK,
		v.Make,
		v.Model,
		v.Year,
		v.Colour AS Color,
		v.Km,
		v.Price
	FROM Vehicle v

	-- Test 
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimVehicle]

GO

-- Step 4 -- Load OLTP Dealership data into data warehouse **
	INSERT INTO [WonderfulWheelsDW].[dbo].[DimDealership]
	SELECT d.DealershipID AS DealershipAK,
		d.Name AS DealershipName,
		l.StreetAddress,
		l.City,
		l.Province,
		l.PostalCode
	FROM Dealership d
		JOIN Location l ON d.LocationID = l.LocationId
		
	-- Test 
	SELECT * FROM [WonderfulWheelsDW].[dbo].[DimDealership]

GO

-- Step 5 -- Load OLTP FactSales data into data warehouse **
	INSERT INTO [WonderfulWheelsDW].[dbo].[FactSales]
	SELECT DISTINCT
		o.OrderID,
		ROW_NUMBER() OVER(PARTITION BY oi.OrderID ORDER BY oi.OrderID) AS OrderItemId,
		EmployeeSK,
		CustomerSK,
		VehicleSK,
		DealershipSK,
		oi.FinalSalePrice,
		o.OrderDate AS OrderDateSK,
		oi.FinalSalePrice * ce.Comission AS Commission
	FROM [Order] o
		LEFT JOIN OrderItem oi ON o.OrderID = oi.OrderID
		LEFT JOIN Vehicle v on oi.VehicleID = v.VehicleID
		LEFT JOIN Dealership d on o.OrderDealID = d.DealershipID
		LEFT JOIN Customer c on o.OrderCusID = c.CustomerID
		LEFT JOIN Employee e on o.OrderEmpID = e.EmployeeID
		LEFT JOIN ComissionEmployee ce on e.EmployeeID = ce.EmployeeID
		
		-- Join to dimensions to get SKs
		JOIN [WonderfulWheelsDW].[dbo].[DimCommissionEmployee] ON e.EmployeeID = EmployeeAK
		JOIN [WonderfulWheelsDW].[dbo].[DimCustomer] ON c.CustomerID = CustomerAK
		JOIN [WonderfulWheelsDW].[dbo].[DimVehicle] ON v.VehicleID = VehicleAK
		JOIN [WonderfulWheelsDW].[dbo].[DimDealership] ON d.DealershipID = DealershipAK

	-- Test	
	SELECT * FROM [WonderfulWheelsDW].[dbo].[FactSales]

GO