CREATE DATABASE IF NOT EXISTS inventory;
USE inventory;

-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE CHECK (Email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    PasswordHash VARCHAR(255) NOT NULL, -- Added for authentication
    Role ENUM('Admin', 'Store Manager', 'Supplier') NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(150) NOT NULL, -- Added for larger supplier networks
    ContactPerson VARCHAR(100),
	Phone VARCHAR(20) UNIQUE CHECK (Phone REGEXP '^\+?[0-9]{10,15}$'),
	Email VARCHAR(100) UNIQUE CHECK (Email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    Address TEXT
);

-- Warehouses Table
CREATE TABLE Warehouses (
    WarehouseID INT PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(255) NOT NULL,
    Capacity INT NOT NULL,
    CapacityUnit ENUM('kg', 'cubic meters', 'units') DEFAULT 'units', -- Added for unit flexibility
    ManagerID INT, -- Tracks who manages the warehouse
    FOREIGN KEY (ManagerID) REFERENCES Users(UserID) ON DELETE SET NULL
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    SKU VARCHAR(50) UNIQUE NOT NULL, -- Added for inventory tracking
    Name VARCHAR(150) NOT NULL,
    Category VARCHAR(100),
    Description TEXT, -- Added to store additional details
    StockLevel INT DEFAULT 0,
    ReorderLevel INT DEFAULT 10, -- Added to trigger restocking alerts
    CostPrice DECIMAL(10,2) NOT NULL,
    SellingPrice DECIMAL(10,2) NOT NULL,
    SupplierID INT,
    WarehouseID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE SET NULL,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) ON DELETE SET NULL
);

-- Purchase Orders Table (Fixed cost calculation issue)
CREATE TABLE Purchase_Orders (
    PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT,
    ProductID INT,
    WarehouseID INT,
    Quantity INT NOT NULL,
    CostPrice DECIMAL(10,2) NOT NULL, -- Now stores CostPrice at the time of purchase
    TotalCost DECIMAL(12,2) GENERATED ALWAYS AS (Quantity * CostPrice) STORED, -- Now works correctly
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReceivedDate TIMESTAMP NULL, -- Added to track when order is received
    Status ENUM('Pending', 'Received', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) ON DELETE CASCADE
);

-- Customers Table (Added to normalize customer data)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE CHECK (Phone REGEXP '^\+?[0-9]{10,15}$'),
    Email VARCHAR(100) UNIQUE CHECK (Email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    Address TEXT
);

-- Orders Table (Fixed price calculation issue)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    SellingPrice DECIMAL(10,2) NOT NULL, -- Now stores SellingPrice at the time of order
    TotalAmount DECIMAL(12,2) GENERATED ALWAYS AS (Quantity * SellingPrice) STORED, -- Now works correctly
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    PaymentStatus ENUM('Pending', 'Paid', 'Refunded') DEFAULT 'Pending', -- Added for tracking payments
    ShippingAddress TEXT, -- Added to track where orders are shipped
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
