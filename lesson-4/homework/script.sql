-- 1. Top 5 employees
SELECT TOP 5 * FROM Employees;

-- 2. Unique Category values from Products
SELECT DISTINCT Category FROM Products;

-- 3. Products with Price > 100
SELECT * FROM Products WHERE Price > 100;

-- 4. Customers whose FirstName starts with 'A'
SELECT * FROM Customers WHERE FirstName LIKE 'A%';

-- 5. Products ordered by Price ascending
SELECT * FROM Products ORDER BY Price ASC;

-- 6. Employees with Salary >= 60000 and Department = 'HR'
SELECT * FROM Employees
WHERE Salary >= 60000 AND DepartmentName = 'HR';

-- 7. Replace NULL in Email with 'noemail@example.com'
SELECT 
    EmployeeID,
    ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;

-- 8. Products with Price BETWEEN 50 AND 100
SELECT * FROM Products
WHERE Price BETWEEN 50 AND 100;

-- 9. SELECT DISTINCT on two columns (Category, ProductName)
SELECT DISTINCT Category, ProductName FROM Products;

-- 10. DISTINCT Category, ProductName ordered by ProductName DESC
SELECT DISTINCT Category, ProductName FROM Products
ORDER BY ProductName DESC;

SELECT DISTINCT Category, ProductName
FROM Products_Discounted
ORDER BY ProductName DESC;
-- 11. Top 10 products ordered by Price DESC
SELECT TOP 10 * FROM Products
ORDER BY Price DESC;

-- 12. COALESCE on FirstName and LastName
SELECT EmployeeID, COALESCE(FirstName, LastName) AS Name FROM Employees;

-- 13. Distinct Category and Price
SELECT DISTINCT Category, Price FROM Products;

-- 14. Employees aged 30-40 or in Marketing
SELECT * FROM Employees
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';

-- 15. OFFSET-FETCH rows 11 to 20 (ordered by Salary DESC)
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 16. Products with Price <= 1000 AND Stock > 50, sorted by Stock ASC
SELECT * FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

-- 17. ProductName contains letter 'e'
SELECT * FROM Products
WHERE ProductName LIKE '%e%';

-- 18. Employees in HR, IT, or Finance
SELECT * FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

-- 19. Customers ordered by City ASC, PostalCode DESC
SELECT * FROM Customers
ORDER BY City ASC, PostalCode DESC;
-- 20. Top 5 products with highest sales (sum by ProductID)
SELECT TOP 5
    P.ProductID,
    P.ProductName,
    SUM(S.SaleAmount) AS TotalSales
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalSales DESC;

-- 21. Combine FirstName and LastName as FullName
SELECT 
    EmployeeID,
    (ISNULL(FirstName, '') + ' ' + ISNULL(LastName, '')) AS FullName
FROM Employees;

-- 22. DISTINCT Category, ProductName, and Price where Price > 50
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;

-- 23. Products priced < 10% of average price
SELECT * FROM Products
WHERE Price < (SELECT AVG(Price) * 0.1 FROM Products);

-- 24. Employees Age < 30 and Department in HR or IT
SELECT * FROM Employees
WHERE Age < 30 AND DepartmentName IN ('HR', 'IT');

-- 25. Customers whose Email contains '@gmail.com'
SELECT * FROM Customers
WHERE Email LIKE '%@gmail.com%';

-- 26. Employees whose salary > ALL employees in 'Sales' dept
-- Note: Your data has no 'Sales' dept, so use fallback example:
SELECT * FROM Employees
WHERE Salary > ALL (
    SELECT Salary FROM Employees WHERE DepartmentName = 'Marketing'
);

-- 27. Orders placed in last 180 days (based on OrderDate)
SELECT * FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, CAST(GETDATE() AS DATE)) AND CAST(GETDATE() AS DATE);

