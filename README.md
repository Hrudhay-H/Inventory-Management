# Inventory Management System - SQL Database


## 📌 Overview
This SQL script sets up an Inventory Management System database named `inventory`. The database includes tables for users, suppliers, warehouses, products, purchase orders, customers, and sales orders. The schema enforces data integrity through constraints and relationships among tables.

## 🏗 Database Schema

### 📍 Users Table
Stores user information such as administrators, store managers, and suppliers.
- **Primary Key:** `UserID`
- **Unique Constraints:** `Email`

### 📍 Suppliers Table
Stores supplier details.
- **Primary Key:** `SupplierID`
- **Unique Constraints:** `Phone`, `Email`

### 📍 Warehouses Table
Stores warehouse details and their capacities.
- **Primary Key:** `WarehouseID`
- **Foreign Key:** `ManagerID` references `Users(UserID)`

### 📍 Products Table
Stores product information including stock levels, pricing, and supplier details.
- **Primary Key:** `ProductID`
- **Foreign Keys:** `SupplierID` references `Suppliers(SupplierID)`, `WarehouseID` references `Warehouses(WarehouseID)`

### 📍 Purchase Orders Table
Tracks purchase orders from suppliers.
- **Primary Key:** `PurchaseID`
- **Foreign Keys:** `SupplierID`, `ProductID`, `WarehouseID`
- **Computed Column:** `TotalCost = Quantity * CostPrice`

### 📍 Customers Table
Stores customer details.
- **Primary Key:** `CustomerID`
- **Unique Constraints:** `Phone`, `Email`

### 📍 Orders Table
Stores customer orders and payment details.
- **Primary Key:** `OrderID`
- **Foreign Keys:** `CustomerID`, `ProductID`
- **Computed Column:** `TotalAmount = Quantity * SellingPrice`

## 🔐 Data Integrity Constraints
- **Email Validation:** Uses REGEXP for email format validation.
- **Phone Validation:** Must be unique and follow proper numbering format.
- **Foreign Key Relationships:** Ensure referential integrity for suppliers, products, users, warehouses, and customers.
- **ENUM Fields:** Define predefined status values for roles, order status, and payment status.

## 📊 Sample Data
The script includes sample data for:
- Users (Admins, Store Managers, Suppliers)
- Suppliers with contact details
- Warehouses and their respective managers
- Products linked to suppliers and warehouses
- Customers with contact information
- Orders including product purchases

## 🚀 Usage Instructions
1. Run the script in a MySQL-compatible database.
2. Use `USE inventory;` to switch to the database.
3. Execute `SELECT * FROM <table_name>;` to view data.
4. Modify `INSERT INTO` statements as needed to customize the initial dataset.
5. Ensure all constraints and foreign keys are properly enforced by checking the schema.

## 🛠 Queries for Verification
```sql
-- Check table structure
DESC <table_name>;

-- Retrieve all records
SELECT * FROM <table_name>;
```

## 📌 Notes
- The script uses `AUTO_INCREMENT` for primary keys.
- ENUM fields ensure controlled values for roles and statuses.
- Consider implementing additional constraints such as `TRIGGERS` for stricter data validation where necessary.

## 🔮 Future Improvements
- Integration of a website to manage inventory through a user-friendly interface.



