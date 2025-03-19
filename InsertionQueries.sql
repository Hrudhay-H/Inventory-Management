Use Inventory;

-- Insert into Users
INSERT INTO Users (Name, Email, PasswordHash, Role) VALUES
('Amit Sharma', 'amit.sharma@example.com', 'hashedpassword1', 'Admin'),
('Priya Verma', 'priya.verma@example.com', 'hashedpassword2', 'Store Manager'),
('Rahul Desai', 'rahul.desai@example.com', 'hashedpassword3', 'Supplier'),
('Neha Patil', 'neha.patil@example.com', 'hashedpassword4', 'Admin'),
('Ravi Iyer', 'ravi.iyer@example.com', 'hashedpassword5', 'Store Manager'),
('Pooja Nair', 'pooja.nair@example.com', 'hashedpassword6', 'Supplier'),
('Sandeep Joshi', 'sandeep.joshi@example.com', 'hashedpassword7', 'Admin'),
('Kavita Reddy', 'kavita.reddy@example.com', 'hashedpassword8', 'Store Manager'),
('Arjun Mehta', 'arjun.mehta@example.com', 'hashedpassword9', 'Supplier'),
('Deepika Rao', 'deepika.rao@example.com', 'hashedpassword10', 'Store Manager');

-- Insert into Suppliers
INSERT INTO Suppliers (SupplierID, CompanyName, ContactPerson, Phone, Email, Address) VALUES
(101, 'Tata Supplies', 'Amit Sharma', '+919876543210', 'tata@example.com', 'Mumbai, Maharashtra'),
(102, 'Reliance Traders', 'Priya Verma', '+919812345678', 'reliance@example.com', 'New Delhi, Delhi'),
(103, 'Hindustan Exports', 'Rahul Desai', '+918765432109', 'hindustan@example.com', 'Ahmedabad, Gujarat'),
(104, 'Mahindra Wholesale', 'Neha Patil', '+917654321098', 'mahindra@example.com', 'Pune, Maharashtra'),
(105, 'Birla Distributors', 'Ravi Iyer', '+916543210987', 'birla@example.com', 'Bangalore, Karnataka'),
(106, 'Adani Enterprises', 'Pooja Nair', '+919223344556', 'adani@example.com', 'Kolkata, West Bengal'),
(107, 'Godrej Mart', 'Sandeep Joshi', '+917788990011', 'godrej@example.com', 'Chennai, Tamil Nadu'),
(108, 'Infosys Retail', 'Kavita Reddy', '+919900112233', 'infosys@example.com', 'Hyderabad, Telangana'),
(109, 'Wipro Supplies', 'Arjun Mehta', '+918822334455', 'wipro@example.com', 'Jaipur, Rajasthan'),
(110, 'HCL Traders', 'Deepika Rao', '+917711223344', 'hcl@example.com', 'Lucknow, Uttar Pradesh');

-- Insert into Warehouses
INSERT INTO Warehouses (WarehouseID, Location, Capacity, CapacityUnit, ManagerID) VALUES
(1, 'Mumbai', 5000, 'units', 2),
(2, 'Delhi', 7500, 'kg', 5),
(3, 'Ahmedabad', 6000, 'cubic meters', 8),
(4, 'Pune', 4500, 'units', 2),
(5, 'Bangalore', 5200, 'kg', 5),
(6, 'Kolkata', 6700, 'cubic meters', 8),
(7, 'Chennai', 4300, 'units', 2),
(8, 'Hyderabad', 4900, 'kg', 5),
(9, 'Jaipur', 5800, 'cubic meters', 8),
(10, 'Lucknow', 6100, 'units', 2);

-- Insert into Products
INSERT INTO Products (ProductID, SKU, Name, Category, Description, StockLevel, ReorderLevel, CostPrice, SellingPrice, SupplierID, WarehouseID) VALUES
(1, 'P001', 'Laptop', 'Electronics', 'High-performance laptop', 50, 10, 60000.00, 70000.00, 101, 1),
(2, 'P002', 'Smartphone', 'Electronics', 'Latest model smartphone', 100, 15, 30000.00, 35000.00, 102, 2),
(3, 'P003', 'Refrigerator', 'Appliances', 'Energy-efficient fridge', 20, 5, 25000.00, 32000.00, 103, 3),
(4, 'P004', 'Washing Machine', 'Appliances', 'Automatic washing machine', 30, 8, 18000.00, 22000.00, 104, 4),
(5, 'P005', 'Microwave Oven', 'Appliances', 'Compact microwave', 40, 10, 8000.00, 11000.00, 105, 5),
(6, 'P006', 'Air Conditioner', 'Appliances', 'Split AC 1.5 Ton', 25, 7, 40000.00, 50000.00, 106, 6),
(7, 'P007', 'Television', 'Electronics', '4K Ultra HD TV', 15, 5, 50000.00, 65000.00, 107, 7),
(8, 'P008', 'Headphones', 'Accessories', 'Noise-canceling headphones', 80, 20, 3000.00, 5000.00, 108, 8),
(9, 'P009', 'Smartwatch', 'Wearable', 'Fitness tracking smartwatch', 60, 15, 10000.00, 15000.00, 109, 9),
(10, 'P010', 'Camera', 'Electronics', 'DSLR Camera', 10, 3, 80000.00, 100000.00, 110, 10);

-- Insert into Customers
INSERT INTO Customers (CustomerID, Name, Phone, Email, Address) VALUES
(1, 'Vikas Gupta', '+919876543210', 'vikas@example.com', 'Mumbai, Maharashtra'),
(2, 'Ananya Kapoor', '+919812345678', 'ananya@example.com', 'Delhi, Delhi'),
(3, 'Rohan Malhotra', '+918765432109', 'rohan@example.com', 'Ahmedabad, Gujarat'),
(4, 'Meera Krishnan', '+917654321098', 'meera@example.com', 'Pune, Maharashtra'),
(5, 'Suresh Kumar', '+916543210987', 'suresh@example.com', 'Bangalore, Karnataka');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, SellingPrice, OrderDate, Status, PaymentStatus, ShippingAddress) VALUES
(1, 1, 1, 1, 70000.00, NOW(), 'Pending', 'Pending', 'Mumbai, Maharashtra'),
(2, 2, 2, 2, 35000.00, NOW(), 'Shipped', 'Paid', 'Delhi, Delhi'),
(3, 3, 3, 1, 32000.00, NOW(), 'Delivered', 'Paid', 'Ahmedabad, Gujarat'),
(4, 4, 4, 1, 22000.00, NOW(), 'Pending', 'Pending', 'Pune, Maharashtra'),
(5, 5, 5, 3, 11000.00, NOW(), 'Cancelled', 'Refunded', 'Bangalore, Karnataka');
