
# **SQL Data Analysis Project: Northwind Dataset**

## **Overview**  
This project analyzes the Northwind dataset to derive actionable business insights. By focusing on key performance areas such as sales trends, customer segmentation, product performance, and supplier contributions, this analysis demonstrates the practical application of SQL for solving real-world business challenges. It employs various SQL techniques to efficiently query, filter, aggregate, and join data, uncovering trends and offering solutions for business optimization.

---

## **Project Objectives**  
1. **Sales Performance by Region**  
   Analyze total sales revenue and order counts for each region, identifying high-performing areas.  

2. **Identifying High-Value Customers**  
   Find customers who generate the highest revenue and frequently order from the store.  

3. **Top-Selling Products and Categories**  
   Evaluate the most successful products and categories in terms of sales and demand.  

4. **Order Fulfillment Analysis**  
   Examine order lead times and identify delays to improve customer satisfaction.  

5. **Supplier Contribution to Inventory**  
   Analyze supplier contributions and their impact on revenue and inventory.  

---

## **Technologies Used**  
- **SQL**: Filtering, wildcards, aggregate functions, grouping, subqueries, joins, and ordering.  
- **Database**: Northwind dataset.  
- **Tools**: Any SQL client (MySQL, PostgreSQL, SQL Server, SQLite, etc.).  

---

## **SQL Techniques Demonstrated**  

### **1. SELECT and FROM Statements**  
Basic data extraction from multiple tables.  

### **2. LIMIT Statement**  
Restrict the number of records for analysis.  

### **3. Filtering with WHERE and Wildcards**  
Extract specific data using conditions and patterns.  

### **4. Aggregate Functions (AVG, COUNT, MIN, MAX, SUM)**  
Perform calculations on grouped data.  

### **5. GROUP BY and HAVING Clauses**  
Segment data for summary analysis and apply conditions.  

### **6. Subqueries**  
Nest queries to refine analysis.  

### **7. Joins (INNER, LEFT, RIGHT)**  
Combine data from multiple tables for comprehensive insights.  

### **8. ORDER BY**  
Sort results for better readability and analysis.  

---

## **Example Queries**

### **1. Sales Performance by Region**  
```sql
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
```

### **2. Identifying High-Value Customers**  
```sql
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
```

### **3. Top-Selling Products and Categories**  
```sql
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
```

### **4. Order Fulfillment Analysis**  
```sql
SELECT 
    o.OrderID, 
    c.CompanyName, 
    CAST(julianday(o.ShippedDate) - julianday(o.OrderDate) AS INTEGER) AS FulfillmentTime
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.ShippedDate IS NOT NULL
ORDER BY FulfillmentTime DESC
LIMIT 10;
```

### **5. Supplier Contribution to Inventory**  
```sql
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
```

---

## **Insights and Recommendations**  

### **1. High-Performing Regions**  
Regions with higher sales revenue should receive more marketing resources to capitalize on their growth potential.  

### **2. High-Value Customers**  
Target high-revenue customers with personalized loyalty programs and promotions to increase retention and spending.  

### **3. Top-Selling Products**  
Focus on stocking and promoting top-selling products and categories to meet customer demand efficiently.  

### **4. Streamlined Order Fulfillment**  
Address delays in order shipments by optimizing supply chain logistics and improving internal processes.  

### **5. Supplier Strategies**  
Negotiate better deals with suppliers who significantly contribute to revenue and inventory.  

---

## **How to Use This Project**  

### **1. Dataset**  
Download the Northwind dataset from any SQL database resource and load it into your SQL client.  

### **2. Run Queries**  
Execute the provided SQL queries on the database to generate insights.  

### **3. Customize Analysis**  
Modify queries or create new ones to explore different business aspects or answer specific questions.  

### **4. Insights Presentation**  
Use the outputs to create visual dashboards or detailed reports in tools like Power BI or Tableau.  

---

## **Future Enhancements**  

1. Incorporate advanced analytics with Python or R for deeper insights.  
2. Develop interactive dashboards using visualization tools like Tableau.  
3. Extend analysis to include predictive models to forecast sales and trends.  

---

## **Contact**  
For questions or collaborations, feel free to reach out!  

**Author**: Roqaia Khalid  
**Email**: roqaia.wagih.mohammed@gmail.com  

--- 
