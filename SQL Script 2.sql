USE WonderfulWheels;
GO

/** Display all dealerships **/

SELECT * FROM Dealership;

/** Display all inventory/vehicles. Sort data by price where most expensive car is on the top **/

SELECT * FROM Vehicle ORDER BY Price DESC;

/** Display all customers. Order data by first then last name in ascending order **/

SELECT Customer.CustomerID, CONCAT(Person.Title, ' ',Person.FirstName,' ',Person.LastName) AS CustomerName, 
Person.Telephone AS Phone, Person.Email, Person.DateofBirth
FROM Person 
INNER JOIN Customer ON Person.PersonID = Customer.CustomerID
ORDER BY Person.FirstName, Person.LastName ASC;

/** Display all employees. Order data by first then last name in ascending order **/

SELECT Employee.EmployeeID, CONCAT(Person.Title, ' ',Person.FirstName,' ',Person.LastName) AS EmployeeName, 
Person.Telephone AS Phone, Person.Email, Person.DateofBirth
FROM Person 
INNER JOIN Employee ON Person.PersonID = Employee.EmployeeID
ORDER BY Person.FirstName, Person.LastName ASC;

/** Display all addresses , Sort data by city **/

SELECT * FROM Location 
ORDER BY City;

/** Update Tracy Spencer commission. Set it to 9. Based on requirements 
from lab 5 you should not be able to do this **/

UPDATE C
	SET C.Comission = 9
FROM 
	ComissionEmployee C
	INNER JOIN Employee E ON E.EmployeeID = C.EmployeeID
	INNER JOIN Person P ON P.PersonID = E.EmployeeID
WHERE
	P.FirstName = 'Tracy' AND P.LastName = 'Spencer';

/** Update Tracy Spencer title to “Mz”. Based on requirements from lab 5 
you should not be able to do this **/

UPDATE P
	SET P.Title = 'Mz'
FROM 
	Person P
WHERE
	P.FirstName = 'Tracy' AND P.LastName = 'Spencer';

/** Display vehicles that are not sold. These vehicles will be listed on dealership web site. 
Customers should be able to search only available vehicles **/

SELECT * FROM Vehicle
WHERE VehicleID NOT IN (SELECT VehicleID FROM OrderItem);

/** Display employee sales info. Include all employees including those who did not sell any cars. 
Dealership, Employee Name, Employee Manger (Bonus), Customer name, Phone, Email, Date of Birth, 
Age, Address (Street, City, Province, and postal code) and Car info (Make, Model, Year, Color, 
Mileage and Final Sales Price) **/

SELECT D.Name AS Dealership, CONCAT(P.Title, ' ',P.FirstName,' ',P.LastName) AS EmployeeName,
CONCAT(PM.Title, ' ',PM.FirstName,' ',PM.LastName, ' (', CE.Comission, ')') AS 'EmployeeManager (Bonus)',
CONCAT(PC.Title, ' ',PC.FirstName,' ',PC.LastName) AS CustomerName, P.Telephone AS Phone, P.Email, P.DateofBirth,
DATEDIFF(YY, P.DateofBirth, GETDATE()) AS Age, 
CONCAT(L.StreetAddress, ', ', L.City, ', ', L.Province, ', ', L.PostalCode) AS Address,
CONCAT(V.Make, ', ',V.Model, ', ',V.Year, ', ', V.Colour, ', ',V.Km, ', ', OI.FinalSalePrice) AS CarInfo
FROM Employee E 
LEFT JOIN Person P ON E.EmployeeID = P.PersonID
LEFT JOIN Person PM ON E.ManagerID = PM.PersonID
LEFT JOIN Dealership D ON E.EmpDealID = D.DealershipID
LEFT JOIN ComissionEmployee CE ON E.EmployeeID = CE.EmployeeID
LEFT JOIN [Order] O ON E.EmployeeID = O.OrderEmpID
LEFT JOIN Customer C ON O.OrderCusID = C.CustomerID
LEFT JOIN Person PC ON C.CustomerID = PC.PersonID
LEFT JOIN Location L ON P.PerLocID = L.LocationID
LEFT JOIN OrderItem OI ON O.OrderID = OI.OrderID
LEFT JOIN Vehicle V ON OI.VehicleID = V.VehicleID;
