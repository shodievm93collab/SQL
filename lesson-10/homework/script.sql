Oson darajadagi vazifalar (10)
1. Xodimlar – 50000 dan katta maoshlar

 SELECT E.Name AS EmployeeName, E.Salary, D.DepartmentName FROM Employees E LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID WHERE E.Salary > 50000 ; 2. Mijozlar × Buyurtmalar – faqat 2023-yilda SELECT E.Name AS EmployeeName, E.Salary, D.DepartmentName FROM Employees E LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID WHERE E.Salary > 50000 ;
 SELECT C.FirstName, C.LastName, O.OrderDate
Mijozlardan C INNER JOIN Buyurtmalar O ON C.CustomerID = O.CustomerID WHERE YEAR(O.OrderDate) = 2023;
3. Employees + Departments – hamma xodimlar (NULL bo‘lsa ham)

Xodim nomi sifatida E. ismni, D. Xodimlardan E. bo'lim nomini tanlang .
LEFT JOIN Bo'limlari D ON E.DepartmentID = D.DepartmentID;
 4. Suppliers + Products – hamma xizmatchilar

 SELECT S.SupplierName, P.ProductName FROM Suppliers S LEFT JOIN Products P ON S.SupplierID = P.SupplierID; 5. Orders + Payments – ikkala tomon ham, hatto yo'q bo'lsa ham SELECT S.SupplierName, P.ProductName FROM Suppliers S LEFT JOIN Products P ON S.SupplierID = P.SupplierID;
 SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount FROM Orders O FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID; 6. Xodimlar – menejeri bilan SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount FROM Orders O FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID;
 SELECT E.Name AS EmployeeName, M.Name AS ManagerName FROM Employees E LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID; 7. Talabalar – 'Math 101' kursiga yoziladi SELECT E.Name AS EmployeeName, M.Name AS ManagerName FROM Employees E LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID; 
Talabalar nomidan S.Nomini Talaba nomi, C.Kurs nomini TANLANGAN Talabalar ICHKI QOʻSHILGAN Roʻyxatga olishlar E ON S.StudentID = E.StudentID INNER JOIN Kurslar C ON E.KursID = C.Kurs ID
WHERE C.CourseName = 'Math 101';
8. Customers – 3 tadan ortiq item buyurtma qilganlar

SELECT C.FirstName, C.LastName, O.Quantity
Mijozlardan C INNER JOIN Buyurtmalar O ON C.CustomerID = O.CustomerID
WHERE O.Quantity > 3;
9. Employees – Human Resources bo‘limidagi xodimlar

Xodimlar nomidan E.Ismni , D.Bo‘lim nomini TANLANG .
WHERE D.DepartmentName = 'Inson resurslari' ;
 🟠 O'rta darajadagi vazifalar (9)
 1. Departamentlarda 5 tadan ko'p

 SELECT D.DepartmentName, COUNT (E.EmployeeID) AS EmployeeCount FROM Departments D INNER JOIN Employees E ON D.DepartmentID = E.DepartmentID GROUP BY D.DepartmentName HAVING COUNT (E.EmployeeID) > 5 ; 2. Hech qachon sotilmagan mahsulotlar SELECT D.DepartmentName, COUNT (E.EmployeeID) AS EmployeeCount FROM Departments D INNER JOIN Employees E ON D.DepartmentID = E.DepartmentID GROUP BY D.DepartmentName HAVING COUNT (E.EmployeeID) > 5 ;
 SELECT P.ProductID, P.ProductName FROM Products P LEFT JOIN Sales S ON P.ProductID = S.ProductID WHERE S.ProductID IS NULL ; 3. Buyurtma qilgan SELECT P.ProductID, P.ProductName FROM Products P LEFT JOIN Sales S ON P.ProductID = S.ProductID WHERE S.ProductID IS NULL ;
 SELECT C.FirstName, C.LastName, COUNT (O.OrderID) AS TotalOrders
Mijozlardan C INNER JOIN Buyurtmalar O ON C.CustomerID = O.CustomerID
C.FirstName, C.Familiya boʻyicha GURUHLASH ;
 4. Xodimlar + Bo'limlar – faqat mos bo'lganlar


SELECT E.Name AS EmployeeName, D.DepartmentName FROM Employees E INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

5. Bir xil menejerga bo'ysunadigan juftliklar

 SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.ManagerID FROM Employees E1 INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID WHERE E1.EmployeeID < E2.EmployeeID AND E1.ManagerID IS NOT NULL ; 6. 2022-yildagi buyurtmalar + buyurtma ismi SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.ManagerID FROM Employees E1 INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID WHERE E1.EmployeeID < E2.EmployeeID AND E1.ManagerID IS NOT NULL ;
 SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
Buyurtmalardan O INNER JOIN mijozlar C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 2022;
7. Sales bo‘limi, maoshi > 60000 bo‘lgan xodimlar

SELECT E.Name AS EmployeeName, E.Salary, D.DepartmentName
Xodimlardan E ICHKI JOIN bo'limlari D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sotish' VA E.Ish haqi > 60000 ;
 8. Buyurtmalar + To'lovlar – faqat mos kelganlar

 SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount FROM Orders O INNER JOIN Payments P ON O.OrderID = P.OrderID; 9. Hech qachon buyurtma qilinmagan productlar SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount FROM Orders O INNER JOIN Payments P ON O.OrderID = P.OrderID;
 SELECT P.ProductID, P.ProductName FROM Products P LEFT JOIN Orders O ON P.ProductID = O.ProductID WHERE O.ProductID IS NULL ; 🔴 Qiyin darajadagi vazifalar (9) SELECT P.ProductID, P.ProductName FROM Products P LEFT JOIN Orders O ON P.ProductID = O.ProductID WHERE O.ProductID IS NULL ;
 1. O'z bo'limidagi o'rtacha maoshdan ko'p oylik tashrif

 SELECT E.Name AS EmployeeName, E.Salary FROM Employees E INNER JOIN ( SELECT DepartmentID, AVG (Salary) AS AvgSalary FROM Employees GROUP BY DepartmentID ) A ON E.DepartmentID = A.DepartmentID WHERE E.Salary > A.AvgSalary; 2. 2020-yilgacha bo'lgan va payi yo'q buyurtmalar SELECT E.Name AS EmployeeName, E.Salary FROM Employees E INNER JOIN ( SELECT DepartmentID, AVG (Salary) AS AvgSalary FROM Employees GROUP BY DepartmentID ) A ON E.DepartmentID = A.DepartmentID WHERE E.Salary > A.AvgSalary;
 SELECT O.OrderID, O.OrderDate FROM Orders O
LEFT JOIN To'lovlar P ON O.OrderID = P.OrderID
QAYERDA O.OrderDate < '2020-01-01' VA P.OrderID NULL ;
 3. Turkum yo'q mahsulotlar

 SELECT P.ProductID, P.ProductName FROM Products P LEFT JOIN Categories C ON P.Category = C.CategoryID WHERE C.CategoryID IS NULL ; 4. Bir xil menejer + 60000 dan katta maosh SELECT P.ProductID, P.ProductName FROM Products P LEFT JOIN Categories C ON P.Category = C.CategoryID WHERE C.CategoryID IS NULL ;
 SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.ManagerID, E1.Salary FROM Employees E1 INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID WHERE E1.EmployeeID < E2.EmployeeID AND E1.Salary > 60000 ; 5. DepartamentName M bilan boshlansa SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.ManagerID, E1.Salary FROM Employees E1 INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID WHERE E1.EmployeeID < E2.EmployeeID AND E1.Salary > 60000 ; 
Xodimlar nomidan E.Ismni , D.Bo‘lim nomini TANLANG .
QAYERDA D.DepartmentName LIKE 'M%' ;
 6. Sotish – summasi 500 dan katta, mahsulot bilan

 SELECT S.SaleID, P.ProductName, S.SaleAmount FROM Sales S INNER JOIN Products P ON S.ProductID = P.ProductID WHERE S.SaleAmount > 500 ; 7. 'Math 101' ga yozilmagan talabalar SELECT S.SaleID, P.ProductName, S.SaleAmount FROM Sales S INNER JOIN Products P ON S.ProductID = P.ProductID WHERE S.SaleAmount > 500 ;
 SELECT S.StudentID, S.Name AS StudentName FROM Students S WHERE S.StudentID NOT IN ( SELECT E.StudentID FROM Enrollments E
INNER JOIN kurslari C ON E.CourseID = C.CourseID WHERE C.CourseName = 'Matematik 101' );
 8. To'lov yo'q buyurtmalar

 SELECT O.OrderID, O.OrderDate, P.PaymentID FROM Orders O
LEFT JOIN To'lovlar P ON O.OrderID = P.OrderID QAYERDA P.PaymentID NULL ;

9. Elektronika yoki Mebel mahsulotlari

 SELECT P.ProductID, P.ProductName, C.CategoryName
