-- 1. 1 dan 1000 gacha raqamlar jadvali
BILAN raqamlar AS (
1 TANI AS n
HAMMA ittifoq
SELECT n + 1
Raqamlardan
QAYERDA n < 1000
)
Raqamlardan n ni tanlang
OPTION (MAXRECURSION 1000);

-- 2. Bir xodimga to'g'ri keladigan jami savdolar (hosil jadval)
SELECT e.FirstName, e.LastName, s.TotalSales
Xodimlardan e
QO'SHILING (
Xodim identifikatorini, SUMni (Sotish summasini) Jami savdo sifatida tanlang
Sotishdan
Xodim identifikatori boʻyicha GURUHLASH
) s ON e.EmployeeID = s.EmployeeID;

-- 3. CTE: Xodimlarning o'rtacha ish haqi
AvgMaosh AS BILAN (
Xodimlardan AVG(Ish haqi) AVGSAL SIFATIDA TANLANING
)
O'rtacha maoshdan AvgSalni tanlang;

-- 4. Har bir mahsulot uchun eng yuqori sotuvlar (Olingan jadval)
SELECT p.ProductName, t.MaxSale
FROM Mahsulotlar p
QO'SHILING (
MaxSale AS mahsulot identifikatorini, MAX(SalesAmount) ni tanlang
Sotishdan
Mahsulot identifikatori boʻyicha GURUHLASH
) t ON p.ProductID = t.ProductID;

-- 5. < 1 000 000 gacha ikki baravar ko'paytiriladi
BILAN Doubles AS (
1 TANI AS n
HAMMA ittifoq
TANLASH n * 2
FROM Doubles
QAYERDA n * 2 < 1000000
)
Doubles FROM dan n ni tanlang
OPTION (MAXRECURSION 1000);

-- 6. 5 dan ortiq savdoga ega bo'lgan xodimlar
SalesCount AS BILAN (
Xodim identifikatorini tanlang, COUNT(*) SaleCount sifatida
Sotishdan
Xodim identifikatori boʻyicha GURUHLASH
COUNT(*) > 5
)
e.FirstName, e.Familiya ni tanlang
Xodimlardan e
JOIN SalesCount s ON e.EmployeeID = s.EmployeeID;

-- 7. Savdosi > 500$ bo'lgan mahsulotlar
ProductSales AS BILAN (
Mahsulot identifikatorini, SUMni (Sotish summasini) Jami savdo sifatida tanlang
Sotishdan
Mahsulot identifikatori boʻyicha GURUHLASH
)
SELECT p.ProductName, ps.TotalSales
FROM Mahsulotlar p
JOIN ProductSales ps ON p.ProductID = ps.ProductID
QAYERDA ps.TotalSotish > 500;

-- 8. Maoshi o'rtachadan yuqori bo'lgan xodimlar
AvgSal AS BILAN (
Xodimlardan AVG(Ish haqi) o'rtacha ish haqi sifatida TANLANING
)
Ism, Familiya, Ish haqini TANlang
Xodimlardan
WHERE Maosh > (OvgSaldan o'rtacha ish haqini tanlang);

-- O'rta 1. Buyurtmalar soni bo'yicha eng yaxshi 5 nafar xodimlar
TOP 5 TANLASH e.Ism, e.Familiya, t.Buyurtma soni
Xodimlardan e
QO'SHILING (
Xodim identifikatorini, COUNT(*) NI Buyurtmalar soni sifatida tanlang
Sotishdan
Xodim identifikatori boʻyicha GURUHLASH
) t ON e.EmployeeID = t.EmployeeID
t.OrderCount DESC BO'YICHA BUYURTMA;

-- O'rta 2. Mahsulot toifasi bo'yicha sotish
P.CategoryID, SOTOSHMALAR SOTISH SUM(s.Satuv summasi) ni tanlang
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
CategoryID bo'yicha guruhlash;

-- O'rta 3. Har bir sonning faktorial
Faktorial AS BILAN (
Raqamni, TAYLANGANNI (raqamni KATTA) Fakt sifatida, raqamni StartVal sifatida tanlang
Raqamlardan 1
HAMMA ittifoq
SELECT f.StartVal, f.Fact * n.Raqam, f.StartVal
FROM faktorial f
JOIN raqamlari1 n ON n.Raqam < f.StartVal
)
StartVal raqamini AS, MAX(Fakt) AS Faktorial ni tanlang
FROM Faktorial
StartVal bo'yicha GURUHLASH
StartVal BO'YICHA BUYURTMA
OPTION (MAXRECURSION 1000);

-- O'rta 4. Satrni belgilarga bo'lish
SplitCTE AS BILAN (
SELECT Id, LEFT(String,1) AS CharPart, RIGHT(String,LEN(String)-1) AS Qolgan
FROM Misol
HAMMA ittifoq
SELECT Id, LEFT(Qolgan,1), RIGHT(Qolgan,LEN(Qolgan)-1)
SplitCTE dan
WHERE LEN(Qolgan) > 0
)
SELECT Id, SplitCTE dan CharPart
WHERE CharPart <> ''
OPTION (MAXRECURSION 1000);

-- O'rta 5. Joriy va oldingi oy o'rtasidagi savdo farqi
oylik savdo AS BILAN (
YIL(SotishSanasi)ni Y, MONTH(SotishSanasi) AS M,
SUM(SalesAmount) AS JamiSotish
Sotishdan
YIL BO'YICHA GURUH (Sotish sanasi), OY (Sotish sanasi)
),
Farq AS (
Y, M ni tanlang,
TotalSales - LAG(TotalSales) ORTA (Y, M TARTIBI) AS DiffFromPrev
Oylik sotuvlardan
)
SELECT * FROM Farq;

-- O'rta 6. Har chorakda 45000 dan ortiq savdoga ega bo'lgan xodimlar
TANLASH e.FirstName, e.Familiya, q.QuarterTotal
Xodimlardan e
QO'SHILING (
Xodim identifikatori, DATE QISM (chorak, sotuv sanasi) AS Qtr,
SUM(Sotish summasi) choraklik jami
Sotishdan
Xodimlar identifikatori boʻyicha GURUHLASH, DATE QISM (chorak, sotilgan sana)
SUM (Savdo summasi) > 45000
) q ON e.EmployeeID = q.EmployeeID;

-- Qiyin 1. Fibonachchi raqamlari
Fibonachchi AS BILAN (
0 AS a, 1 AS b ni tanlang
HAMMA ittifoq
b, a + b ni tanlang
Fibonachchidan
QERDA b < 10000
)
Fibonachchidan Fibonachchi raqamini tanlang
OPTION (MAXRECURSION 1000);

-- Qiyin 2. Bir xil belgili satrlarni toping
SELECT Vals
FindSameCharacters FROM
QAYERDA LEN(Vals) > 1
VA LEN(LTRIM(REPLACE(Vals, LEFT(Vals,1), ''))) = 0;

-- Qiyin 3. 1, 12, 123, 1234, ...
Seq AS BILAN (
1 NI n AS, CAST('1' VARCHAR(50) ASKI) SeqVal
HAMMA ittifoq
SELECT n + 1, SeqVal + CAST(n + 1 AS VARCHAR(10))
SEQ
QAYERDA n <5
)
SeqValni SEQ
OPTION (MAXRECURSION 1000);

-- Qiyin 4. So'nggi 6 oy ichida eng ko'p sotilgan xodimlar
TOP 1 ni tanlang e.Ism, e.Familiya, soʻm(s.Sotish summasi) AS Jami savdo
Xodimlardan e
JOIN Sales s ON e.EmployeeID = s.EmployeeID
QAYERDA s.SaleSana >= DATEQO'SHILGAN (MONTH, -6, GETDATE())
e.Ism, e.Familiya boʻyicha GURUHLASH
TotalSales DESC tomonidan BUYURTMA;

-- Qiyin 5. Satrdan ikki nusxadagi butun sonlarni olib tashlang
PawanName ni tanlang,
Pawan_slug_name,
ALGILASH(Pawan_slug_name,
REPLICATE(RIGHT(Pawan_slug_name,1), LEN(RIGHT(Pawan_slug_name,1)))),
RIGHT(Pawan_slug_name,1)) CleanedName AS
FROM RemoveDuplicateIntsFromNames;
