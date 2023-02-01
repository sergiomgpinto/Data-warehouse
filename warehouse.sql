DROP DATABASE IF EXISTS northwind_dw; CREATE DATABASE northwind_dw;
USE northwind_dw;
CREATE TABLE dim_customer ( CustomerID VARCHAR(255),
CompanyName VARCHAR(255), City VARCHAR(255),
Country VARCHAR(255), PRIMARY KEY (CustomerID)
);
CREATE TABLE dim_product ( ProductID INT,
ProductCode INT,
ProductName VARCHAR(255), CategoryID INT,
CategoryName VARCHAR(255), VERSION INT,
DATE_FROM DATETIME, DATE_TO DATETIME, PRIMARY KEY (ProductID)
);
CREATE TABLE dim_supplier ( SupplierID INT,
CompanyName VARCHAR(255), City VARCHAR(255),
Country VARCHAR(255), PRIMARY KEY (SupplierID)
);
CREATE TABLE dim_shipper ( ShipperID INT,
CompanyName VARCHAR(255),
PRIMARY KEY (ShipperID) );
CREATE TABLE dim_time ( TimeID DATETIME,
YearID INT,
MonthID INT,
MonthName VARCHAR(255), DayID INT,
PRIMARY KEY (TimeID)
);
CREATE TABLE fact_order ( OrderID INT,
QuantityOrdered INT,
Sales REAL,
CustomerID VARCHAR(255), ProductCode INT,
ProductID INT,
SupplierID INT,
ShipperID INT,
TimeID DATETIME,
PRIMARY KEY (OrderID,ProductCode),
FOREIGN KEY (CustomerID) REFERENCES dim_customer (CustomerID), FOREIGN KEY (ProductID) REFERENCES dim_product (ProductID), FOREIGN KEY (TimeID) REFERENCES dim_time (TimeID),
FOREIGN KEY (SupplierID) REFERENCES dim_supplier (SupplierID),
FOREIGN KEY (ShipperID) REFERENCES dim_shipper (ShipperID) );