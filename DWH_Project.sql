-- Membuat database

CREATE DATABASE DWH_Project;

GO

-- Membuat tabel-tabel pada DWH_Project

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY NOT NULL,
    CustomerName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    NoHP VARCHAR(50) NOT NULL
);

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    ProductCategory VARCHAR(255) NOT NULL,
    ProductUnitPrice INT NOT NULL
);

CREATE TABLE DimStatusOrder (
    StatusID INT PRIMARY KEY NOT NULL,
    StatusOrder VARCHAR(50) NOT NULL,
    StatusOrderDesc VARCHAR(50) NOT NULL
);

CREATE TABLE FactSalesOrder (
	OrderID INT PRIMARY KEY NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES DimCustomer(CustomerID) NOT NULL,
	ProductID INT FOREIGN KEY REFERENCES DimProduct(ProductID) NOT NULL,
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	StatusID INT FOREIGN KEY REFERENCES DimStatusOrder(StatusID) NOT NULL,
	OrderDate DATE NOT NULL
);
