SELECT * FROM HumanResources.Employee;

SELECT CONCAT(p.FirstName, p.LastName) AS 'Employee Name', emp.JobTitle AS 'Job Title', emp.HireDate AS 'Date Hired'
FROM HumanResources.Employee emp
INNER JOIN Person.Person p ON p.BusinessEntityID = emp.BusinessEntityID
ORDER BY p.LastName,p.FirstName ASC;

--Display employee name, job title and Age

SELECT CONCAT(p.FirstName, p.LastName) AS 'Employee Name', emp.JobTitle AS 'Job Title', datediff( YY, emp.BirthDate, getdate()) AS 'Age'
FROM HumanResources.Employee emp
INNER JOIN Person.Person p ON p.BusinessEntityID = emp.BusinessEntityID;

--Display only one employee who has the most vacation hours. Display employee name, job title and vacation hours

SELECT TOP 1 CONCAT(p.FirstName, p.LastName) AS 'Employee Name', emp.JobTitle AS 'Job Title', emp.VacationHours AS 'Vacation Hours'
FROM HumanResources.Employee emp
INNER JOIN Person.Person p ON p.BusinessEntityID = emp.BusinessEntityID
WHERE EXISTS
(SELECT emp.BusinessEntityID, max(emp.VacationHours) FROM HumanResources.Employee emp GROUP BY emp.BusinessEntityID);

--Insert a new CountryRegion record in [Person].[CountryRegion]. Display new region that has been inserted.

SELECT * FROM Person.CountryRegion
INSERT INTO Person.CountryRegion (CountryRegionCode,Name,ModifiedDate)
VALUES ('IT','Italy','2023-06-12 00:00:00.000');
SELECT *
FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

--Update new country region. Display new region that has been updated.

UPDATE Person.CountryRegion
SET Person.CountryRegion.Name = 'Italia'
WHERE CountryRegionCode = 'IT';
SELECT *
FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

--Delete new country region. Display results of query that shows that new region does not exist anymore. 

DELETE FROM Sales.CountryRegionCurrency
WHERE CountryRegionCode = 'IT';

DELETE FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

SELECT *
FROM Person.CountryRegion
WHERE CountryRegionCode = 'IT';

--Display the current date and time as “Current date and time”.

SELECT CURRENT_TIMESTAMP AS 'Current date and time';

--Display the current month only as “Current month”

SELECT MONTH(CURRENT_TIMESTAMP) AS 'Current month';

--Display today’s date one year from now

SELECT DATEADD(year, 1, CURRENT_TIMESTAMP) AS DateAdd;