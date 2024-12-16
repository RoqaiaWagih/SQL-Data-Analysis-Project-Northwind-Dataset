--Sales Performance by Region
SELECT 
    c.Region AS Region, 
    COUNT(o.OrderID) AS TotalOrders, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE c.Region IS NOT NULL
GROUP BY c.Region
HAVING TotalSales > 10000
ORDER BY TotalSales DESC;


--Identifying High-Value Customers
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE c.CompanyName LIKE '%Inc%'
GROUP BY c.CustomerID, c.CompanyName
HAVING SUM(od.Quantity * od.UnitPrice) > 5000
ORDER BY TotalRevenue DESC
LIMIT 10;

--Top-Selling Products and Categories
SELECT 
    p.ProductName, 
    c.CategoryName, 
    SUM(od.Quantity) AS TotalQuantitySold, 
    AVG(od.UnitPrice) AS AvgPrice, 
    MAX(od.UnitPrice) AS MaxPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE p.ProductName LIKE 'Ch%'
GROUP BY p.ProductName, c.CategoryName
ORDER BY TotalQuantitySold DESC
LIMIT 5;

-- Order Fulfillment Analysis
SELECT 
    o.OrderID, 
    c.CompanyName, 
    CAST(julianday(o.ShippedDate) - julianday(o.OrderDate) AS INTEGER) AS FulfillmentTime
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.ShippedDate IS NOT NULL
ORDER BY FulfillmentTime DESC
LIMIT 10;


--Supplier Contribution to Inventory
SELECT 
    s.SupplierID, 
    s.CompanyName, 
    COUNT(p.ProductID) AS TotalProducts, 
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY s.SupplierID, s.CompanyName
HAVING TotalRevenue > 20000
ORDER BY TotalRevenue DESC;
