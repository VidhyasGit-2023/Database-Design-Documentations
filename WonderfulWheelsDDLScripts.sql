USE master;  
GO  
IF DB_ID (N'WonderfulWheels') IS NOT NULL  
DROP DATABASE WonderfulWheels;  
GO  
CREATE DATABASE WonderfulWheels  
GO
USE WonderfulWheels;
GO
/*==============================================================*/
/* Table: Location                                              */
/*==============================================================*/
CREATE TABLE Location (
   LocationId           INT                  IDENTITY(1,1),
   StreetAddress        NVARCHAR(40)         NULL,
   City		            NVARCHAR(30)         NULL,
   Province             NVARCHAR(20)         NULL,
   PostalCode           NVARCHAR(15)         NULL,
   CONSTRAINT PK_LOCATION PRIMARY KEY (LocationId)
)
GO
/*==============================================================*/
/* Table: Dealership                                              */
/*==============================================================*/
CREATE TABLE Dealership (
   DealershipId         INT                  IDENTITY(1,1),
   LocationId	        INT			         NOT NULL,
   Name		            NVARCHAR(40)         NULL,
   Phone				NVARCHAR(40)         NULL,
   CONSTRAINT PK_DEALERSHIP PRIMARY KEY (DealershipId),
   FOREIGN KEY (LocationId) REFERENCES Location(LocationId)
)
GO
/*==============================================================*/
/* Table: Person                                              */
/*==============================================================*/
CREATE TABLE Person (
   PersonId		        INT                  IDENTITY(1000,1),
   FirstName	        NVARCHAR(40)         NOT NULL,
   LastName	            NVARCHAR(40)         NOT NULL,
   Telephone			NVARCHAR(20)         NULL,
   Email				NVARCHAR(20)         NULL,
   PerLocId				INT					 NOT NULL,
   DateOfBirth			DATETIME			 NULL,
   Title				NVARCHAR(3)			 NULL,
   CONSTRAINT PK_PERSON PRIMARY KEY (PersonId),
   CONSTRAINT TitleCheck CHECK (Title IN ('Mr','Ms','Mrs',NULL)),
   FOREIGN KEY (PerLocId) REFERENCES Location(LocationId)
)
GO
/*==============================================================*/
/* Index: IndexPersonName                                       */
/*==============================================================*/
CREATE NONCLUSTERED INDEX IndexPersonName ON Person (
LastName ASC,
FirstName ASC
)
GO
/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
CREATE TABLE Customer (
   CustomerId		    INT                  IDENTITY(1,1),
   RegistrationDate		DATETIME			 NULL,
   PersonId				INT				NOT NULL,
   CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustomerId),
   FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
)
GO
/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
CREATE TABLE Employee (
   EmployeeId		    INT                  IDENTITY(1,1),
   EmpDealId	        INT			         NOT NULL,
   HireDate				DATETIME			 NULL,
   Role					NVARCHAR(30)		 NOT NULL,
   ManagerId			INT					 NOT NULL,
   PersonId				INT				NOT NULL,
   CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EmployeeId),
   FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
)
GO
/*==============================================================*/
/* Table: SalaryEmployee                                              */
/*==============================================================*/
CREATE TABLE SalaryEmployee (
   EmployeeId		    INT                  NOT NULL,
   Salary				DECIMAL(12,2)		 NOT NULL DEFAULT 0.00,
   FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
   CONSTRAINT CHK_Salary CHECK (Salary >= 1000)
)
GO
/*==============================================================*/
/* Table: CommissionEmployee                                              */
/*==============================================================*/
CREATE TABLE CommissionEmployee (
   EmployeeId		    INT                  NOT NULL,
   Commission			DECIMAL(12,2)		 NOT NULL DEFAULT 0.00,
   FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
   CONSTRAINT CHK_Commission CHECK (Commission >= 10)
)
GO
/*==============================================================*/
/* Table: Vehicle                                              */
/*==============================================================*/
CREATE TABLE Vehicle (
   VehicleId		    INT                  IDENTITY(1,1),
   Make					NVARCHAR(30)		 NULL,
   Model				NVARCHAR(30)		 NULL,
   Year					INT					 NULL,
   Colour				NVARCHAR(20)		 NULL,
   Km					DECIMAL(12,2)		 NULL,
   Price				DECIMAL(12,2)		 NOT NULL DEFAULT 0.00,
   CONSTRAINT PK_VEHICLE PRIMARY KEY (VehicleId),
   CONSTRAINT CHK_Vehicle CHECK (Price >= 1)
)
GO
/*==============================================================*/
/* Table: Order                                                 */
/*==============================================================*/
CREATE TABLE [Order] (
   OrderId			    INT                  NOT NULL,
   OrderCustId			INT					 NOT NULL,
   OrdEmpId				INT					 NOT NULL,
   OrderDate			DATETIME			 NULL,
   OrdDealId			INT					 NOT NULL,
   CONSTRAINT PK_ORDER PRIMARY KEY (OrderId),
   FOREIGN KEY (OrderCustId) REFERENCES Customer(CustomerId),
   FOREIGN KEY (OrdEmpId) REFERENCES Employee(EmployeeId),
   FOREIGN KEY (OrdDealId) REFERENCES Dealership(DealershipId)
)
GO
/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
CREATE TABLE OrderItem (
   OrderId			    INT                  NOT NULL,
   VehicleId			INT					 NOT NULL,
   FinalSalePrice		DECIMAL(12,2)		 NOT NULL DEFAULT 0.00,
   FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
   FOREIGN KEY (VehicleId) REFERENCES [Vehicle](VehicleId),
   CONSTRAINT CHK_OrderItem CHECK (FinalSalePrice >= 1)
)
GO
/*==============================================================*/
/* Table: Account                                              */
/*==============================================================*/
CREATE TABLE Account (
   AccountId		    INT                  IDENTITY(1,1),
   CustomerId			INT					 NOT NULL,
   AccountBalance		DECIMAL(12,2)		 NOT NULL DEFAULT 0.00,
   LastPaymentAmount	DECIMAL(12,2)		 NOT NULL DEFAULT 0.00,
   LastPaymentDate		DATETIME			 NULL,
   CONSTRAINT PK_ACCOUNT PRIMARY KEY (AccountId),
   FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
   CONSTRAINT CHK_Account CHECK (AccountBalance >= 1 AND LastPaymentAmount >= 1)
)
GO