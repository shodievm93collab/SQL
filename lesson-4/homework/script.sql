Top 5 employees
Agar siz “top 5” deb faqat tartibga bog‘lamasdan yozgan bo‘lsangiz, SQL Server odatda “TOP” bilan ORDER BY dan keyin ishlatishni talab qilmaydi, lekin yaxshisi tartiblamoq kerak bo‘ladi:

SELECT TOP 5 *
FROM Employees
ORDER BY EmployeeID;  -- yoki boshqa ustun bo‘yicha tartib


Unique Category from Products

SELECT DISTINCT Category
FROM Products_Discounted;


Products with Price > 100

SELECT *
FROM Products_Discounted
WHERE Price > 100;


FirstName starts with 'A'
Agar shu ma’lumot mavjud bo‘lsa (Employees jadvalidagi FirstName ustuni bo‘sh bo‘lishi mumkin):

SELECT *
FROM Employees
WHERE FirstName LIKE 'A%';


Order products by Price ascending

SELECT *
FROM Products_Discounted
ORDER BY Price ASC;


Employees with Salary >= 60000 and DepartmentName = 'HR'

SELECT *
FROM Employees
WHERE Salary >= 60000 
  AND DepartmentName = 'HR';


Replace NULL Email with default

SELECT
  EmployeeID,
  FirstName,
  LastName,
  ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;


Products with Price BETWEEN 50 AND 100

SELECT *
FROM Products_Discounted
WHERE Price BETWEEN 50 AND 100;


SELECT DISTINCT on two columns (Category, ProductName)

SELECT DISTINCT Category, ProductName
FROM Products_Discounted;


Same DISTINCT but order by ProductName DESC

SELECT DISTINCT Category, ProductName
FROM Products_Discounted
ORDER BY ProductName DESC;
