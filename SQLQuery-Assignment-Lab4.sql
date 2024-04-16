--1) Display all columns of all products.

SELECT * FROM Production.Product;

--2) Display primary key, product name, number, list price of all products. 

SELECT ProductID , Name , ProductNumber ,ListPrice FROM Production.Product

--3) Display product id, product name, number, list price of all products where list price is $0 .00.

SELECT ProductID , Name , ProductNumber ,ListPrice FROM Production.Product 
where ListPrice=0.00;

--4) Display product id, product name, number, list price of all products where list price greater than $0 but less then $10.

SELECT ProductID , Name , ProductNumber ,ListPrice FROM Production.Product 
where ListPrice>0 and ListPrice<10;

--5) Display product id, product name, number, list price of all products where list price either 9.5 or 2.29

SELECT ProductID , Name , ProductNumber ,ListPrice FROM Production.Product
where ListPrice=9.5 or ListPrice=2.29;

--6) Concatenate Last Name, First Name and Middle Name FROM the Person table with appropriate commas and spaces between the data.

SELECT * FROM Person.Person
SELECT CONCAT(LastName,',',FirstName,',',MiddleName) as FullName FROM Person.Person

--7) Display distinct job titles FROM employee table and sort them in descending order. 

SELECT * FROM HumanResources.Employee
SELECTdistinct(JobTitle) FROM HumanResources.Employee

--8) Display employee id as “ID”, job title as “Job Title” and HireDate as “Date Hired”

SELECT BusinessEntityID as ID , JobTitle as 'Job Title' , HireDate as 'Date Hired' FROM HumanResources.Employee;

--9) Display employee last and first name as “Employee Name”, job title as “Job Title”, hire date as “Date Hired” and sort data by last then first name.

SELECT CONCAT(p.FirstName, p.LastName) AS 'Employee Name', emp.JobTitle AS 'Job Title', emp.HireDate AS 'Date Hired'
FROM HumanResources.Employee emp
INNER JOIN Person.Person p ON p.BusinessEntityID = emp.BusinessEntityID
ORDER BY p.LastName,p.FirstName ASC;

--10) Display employee name, job title and Age

SELECT CONCAT(p.FirstName, p.LastName) AS 'Employee Name', emp.JobTitle AS 'Job Title', datediff( YY, emp.BirthDate, getdate()) AS 'Age'
FROM HumanResources.Employee emp
INNER JOIN Person.Person p ON p.BusinessEntityID = emp.BusinessEntityID;

--11) Display only one employee who has the most vacation hours. Display employee name, job title and vacation hours.

SELECT TOP 1 CONCAT(p.FirstName, p.LastName) AS 'Employee Name', emp.JobTitle AS 'Job Title', emp.VacationHours AS 'Vacation Hours'
FROM HumanResources.Employee emp
INNER JOIN Person.Person p ON p.BusinessEntityID = emp.BusinessEntityID
WHERE EXISTS
(SELECT emp.BusinessEntityID, max(emp.VacationHours) FROM HumanResources.Employee emp GROUP BY emp.BusinessEntityID);

--12) Display the number of sales territories as “Number of Sales Territories”.

SELECT TerritoryID FROM Sales.SalesTerritory
SELECT TerritoryID AS "Number of Sales Territories"
FROM Sales.SalesTerritory;

--13) Add up the sales year to date for all sales territories and display as “Sum of All Sales”.

SELECT SUM(SalesYTD) AS "Sum of All Sales"
FROM Sales.SalesTerritory;

--14) Display sum of all SalesYTD sales as “Sum of All Sales”, average sale as “Average Sale”, minimum sale as “Minimum Sale” and maximum sale as “Maximum Sale”. 

SELECT SUM(SalesYTD) AS "Sum of All Sales",
       AVG(SalesYTD) AS "Average Sale",
       MIN(SalesYTD) AS "Minimum Sale",
       MAX(SalesYTD) AS "Maximum Sale"
FROM Sales.SalesTerritory;

--15) Insert a new CountryRegion record in [Person].[CountryRegion]. Display new region that has been inserted.

SELECT * FROM Person.CountryRegion

INSERT INTO Person.CountryRegion (CountryRegionCode,Name,ModifiedDate)
VALUES ('IT','Vidhya','2023-06-12 00:00:00.000');

SELECT CountryRegionCode
FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

--16) Update new country region. Display new region that has been updated.

UPDATE Person.CountryRegion
SET Person.CountryRegion.Name = 'Italia'
WHERE CountryRegionCode = 'IT';

SELECT *
FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

--17) Delete new country region. Display results of query that shows that new region does not exist anymore. 

DELETE FROM Sales.CountryRegionCurrency
WHERE CountryRegionCode = 'IT';

DELETE FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

SELECT *
FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

--18) Display the current date and time as “Current date and time”.

SELECT CURRENT_TIMESTAMP AS 'Current date and time';

--19) Display the current month only as “Current month”
SELECT MONTH(CURRENT_TIMESTAMP) AS 'Current month';

--20) Display today’s date one year from now
SELECT DATEADD(year, 1, CURRENT_TIMESTAMP) AS DateAdd;
