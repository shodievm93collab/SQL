Oson Vazifalar
1️⃣ Ismni vergul bilan ajrating (TestMultipleColumns)
TANLASH
Id,
CHAP(Ism, CHARINDEX(',', Ism) - 1) Ism sifatida,
LTRIM(RIGHT(Ism, LEN(Ism) - CHARINDEX(',', Ism))) Familiya AS
FROM TestMultipleColumns;

2️⃣ "%" ni o'z ichiga olgan satrlar (TestPercent)
TANLASH *
FROM TestPercent
WHERE Strs LIKE '%[%]%';

3️⃣ Satrni nuqtaga bo'lish (Splitter)
TANLASH
Id,
CHAP(Vals, CHARINDEX('.', Vals) - 1) AS 1-qism,
RIGHT(Vals, LEN(Vals) - CHARINDEX('.', Vals)) AS 2-qism
Splitterdan;

4️⃣ Valsda 2 dan ortiq nuqta bo'lgan qatorlar (testDots)
TANLASH *
testDots dan
WHERE (LEN(Vals) - LEN(REPLACE(Vals, '.', ''))) > 2;

5️⃣ Satrdagi bo'shliqlarni sanash (CountSpaces)
TANLASH
matnlar,
LEN(matnlar) - LEN(REPLACE(matnlar, ' ', '')) SpaceCount AS
CountSpaces dan;

6️⃣ O'z menejeridan ko'proq maosh oladigan xodimlar (xodim)
Tanlang e.Ism AS Xodim nomi, e.Ish haqi AS ish haqi, m.Name AS menejer nomi, m.Maosh AS menejeri maosh
Xodimdan e
JOIN Xodim m ON e.ManagerId = m.Id
QAYERDA e.Ish haqi > m.Ish haqi;

7️⃣ 10-15 yillik ish stajiga ega xodimlar (xodimlar)
TANLASH
EMPLOYEE_ID,
FIRST_NAME,
LAST_NAME,
HIRE_DATE,
DATEDIFF(YEAR, HIRE_DATE, GETDATE()) YearsOfService AS
Xodimlardan
WHERE DATEDIFF(YEAR, HIRE_DATE, GETDATE()) 10 dan 15 gacha;

🟡 O'RTA VAZIFALAR
8️⃣ Harorat avvalgisidan yuqori bo'lgan sanalar (ob-havo)
SELECT w1.Id, w1.RecordDate, w1.Temperature
W1 ob-havosidan
JOIN ob-havo w2
DATEQO'SHIMDA(KUN, -1, w1.RecordDate) = w2.RecordDate
WHERE w1.Temperature > w2.Temperature;

9️⃣ Har bir o'yinchi uchun birinchi kirish sanasi (Faoliyat)
TANLASH
o'yinchi_identifikatori,
MIN(voqea_sanasi) FirstLoginDate AS
Faoliyatdan
player_identifikatori bo'yicha GROUP;

🔟 Ro'yxatdagi uchinchi narsani qaytaring (mevalar)
TANLASH
TRIM(qiymat) AS ThirdFruit
FROM STRING_SPLIT((mevalar_roʻyxatini tanlang), ',')
QAYERDA (STRING_SPLITDAN COUNT(*) TANILASH((mevalar_roʻyxatini tanlang), ',')
WHERE qiymati <= STRING_SPLIT((mevalar_roʻyxatini SELECT FROM), ',').value) = 3;


(Yengilroq usul SQL Server 2022+ bilan :)

TRIM(qiymat) ni ThirdFruit sifatida tanlang
FROM (
SELECT qiymati, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
FROM STRING_SPLIT((mevalar_roʻyxatini tanlang), ',')
) t
QAYERDA rn = 3;

11️⃣ Ishga qabul qilingan sana asosida ishga joylashtirish bosqichi (Xodimlar)
TANLASH
EMPLOYEE_ID,
FIRST_NAME,
LAST_NAME,
DATEDIFF(YEAR, HIRE_DATE, GETDATE()) Yillar Ishlaganidek,
HOLDA
WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 KEYIN “Yangi ishga”
QACHON DATEDIFF(YEAR, HIRE_DATE, GETDATE()) 1 dan 5 gacha bo‘lgandan keyin “Junior”
QAChON DATEDIFF(YEAR, HIRE_DATE, GETDATE()) 5 dan 10 gacha bo‘lsa, “O‘rta daraja”
QACHON DATEDIFF(YEAR, HIRE_DATE, GETDATE()) 10 dan 20 gacha bo‘lsa, “Katta”
BOSHQA "Veteran"
Employment Stage AS TUGATISH
Xodimlardan;

12️⃣ Boshida butun sonni chiqarib oling (GetIntegers)
TANLASH
Id,
VALS,
CHAP(VALS, PATINDEX('%[^0-9]%', VALS + 'X') - 1) AS StartingInteger
GetIntegers dan
VALS NOL BO'LMAGAN VA '[0-9]%'GA O'xshash VALS;

🔴 QIYIN VAZIFALAR
13️⃣ Vergul bilan ajratilgan satrning birinchi ikki harfini almashtiring (MultipleVals)
TANLASH
Id,
STUFF(Vals, 1, 1, SUBSTRING(Vals, CHARINDEX(',', Vals) + 1, 1)) AS Almashtirildi
FROM MultipleVals;


👉 'a,b,c' → 'b,a,c'

14️⃣ Satrning har bir belgisi ('sdgfhsdgfhs@121313131')
DECLARE @txt VARCHAR(100) = 'sdgfhsdgfhs@121313131';
SUBSTRING (@txt, raqam, 1)ni belgi sifatida tanlang
master.dbo.spt_values ​​dan
WHERE turi = 'P' VA 1 VA LEN O'rtasidagi raqam (@txt);

15️⃣ Har bir o'yinchiga birinchi kirgan qurilma (Faoliyat)
a.player_id, a.device_id ni tanlang
FROM faoliyat a
QERDA a.event_date = (
MIN TANI(b.voqe_sana)
FROM faoliyat b
QAYERDA b.player_id = a.player_id
);

16️⃣ Alohida butun son va belgilar qiymatlari ('rtcfvty34redt')
DECLARE @str VARCHAR(50) = 'rtcfvty34redt';

TANLASH
(SELECT STRING_AGG(SUBSTRING(@str, raqam, 1), '')
master.dbo.spt_values ​​dan
WHERE type='P' VA 1 VA LEN ORASINDAGI raqam(@str)
VA SUBSTRING(@str, raqam, 1) LIKE '[0-9]') butun sonlar kabi,
(SELECT STRING_AGG(SUBSTRING(@str, raqam, 1), '')
master.dbo.spt_values ​​dan
WHERE type='P' VA 1 VA LEN ORASINDAGI raqam(@str)
VA SUBSTRING(@str, raqam, 1) LIKE '[A-Za-z]') Belgilar AS;
