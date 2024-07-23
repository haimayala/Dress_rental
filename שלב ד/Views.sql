CREATE OR REPLACE VIEW RentalOrderSummary AS
SELECT 
    o.OId AS OrderID,
    c.CName AS CustomerName,
    e.EName AS EmployeeName,
    d.did AS DressId,
    d.RentalCount AS DressRentalCount,
    o.OrderDate,
    o.ReturnDate,
    p.Price AS TotalPrice,
    p.IsPaid,
    p.FinePrice,
    l.Cost AS LaundryCost,
    (p.Price + p.FinePrice - COALESCE(l.Cost, 0)) AS NetRevenue
FROM 
    Orders o
    JOIN Customer c ON o.CId = c.CId
    JOIN Employee e ON o.EId = e.EId
    JOIN Dress d ON o.DId = d.DId
    JOIN Payment p ON o.pid = p.pId
    JOIN Laundry l ON o.OId = l.OId;
    
    
---  שאילתה המחזירה את כל השמלות מהקולקציה האחרונה
---רק משנת 2024 בסדר ממוין מהכי מורווחת להכי מפסידה
SELECT R1.DressId,D.LENGTH,D.COLOR,D.PRICE,R1.DressRentalCount,R1.NetRevenue
FROM RentalOrderSummary R1 JOIN Dress D ON D.DID = R1.DressId
WHERE EXTRACT(YEAR FROM R1.OrderDate) = 2024
AND R1.DressId NOT IN (
        SELECT  R2.DressId
        FROM RentalOrderSummary R2
        WHERE EXTRACT(YEAR FROM R2.OrderDate) < 2024
    )
Order by R1.NetRevenue desc  

    
--- השאילתה מחזירה אתכל הלקוחות ששילמו עבור כל ההזמנות שלהם וכל הזמנה לא היה קנס של מעל 20 
SELECT R.CustomerName,sum(R.FinePrice)
FROM RentalOrderSummary R 
WHERE R.IsPaid =1 and R.FinePrice < 20
GROUP BY R.CustomerName 
minus 
SELECT R.CustomerName,sum(R.FinePrice)
FROM RentalOrderSummary R 
WHERE R.IsPaid =0 and R.FinePrice >=20
GROUP BY R.CustomerName 
 



CREATE OR REPLACE VIEW OrchestraEventSummary AS
SELECT
    e.Event_Id,
    e.Event_Date,
    e.Location,
    c.cname AS CustomerName,
    c.cemail AS CustomerEmail,
    c.caddress AS CustomerAddress,
    s.Sname AS SingerName,
    s.Price AS SingerPrice,
    p.Producer_Name AS ProducerName,
    p.Price AS ProducerPrice,
    pt.price AS TotalPrice,
    pt.Ptype AS PaymentType,
    i.Instrument_Name AS InstrumentName,
    i.Price AS InstrumentPrice
FROM
    Event e
    JOIN Customer c ON e.cid = c.cid
    JOIN Singer s ON e.Singer_Id = s.Singer_Id
    JOIN Producer p ON e.Producer_Id = p.Producer_Id
    JOIN Payment pt ON e.pid = pt.pid
    LEFT JOIN Instrument_Event ie ON e.Event_Id = ie.Event_Id
    LEFT JOIN Instrument i ON ie.Instrument_Id = i.Instrument_Id;
    
    
    
 
---השאילתה מחזירה את ההזמנות שהיו בהם יותר מ3 כלים
SELECT
    o.Event_Id,
    o.Event_Date,
    o.Location,
    o.TotalPrice,
    o.CustomerName,
    o.SingerName,
    o.ProducerName,
    COUNT(o.InstrumentName) AS NumberOfInstruments
FROM
    OrchestraEventSummary o
GROUP BY
    o.Event_Id,
    o.Event_Date,
    o.Location,
    o.TotalPrice,
    o.CustomerName,
    o.SingerName,
    o.ProducerName
HAVING
    COUNT(o.InstrumentName) > 3;






---השאילתה מחזירה את 5 הלקוחות שבזבזו הכי הרבה כסף על התזמיורת
SELECT
    CustomerName,
    CustomerEmail,
    TotalSpent
FROM
    (SELECT
        CustomerName,
        CustomerEmail,
        SUM(TotalPrice) AS TotalSpent
     FROM
        OrchestraEventSummary
     GROUP BY
        CustomerName,
        CustomerEmail
     ORDER BY
        TotalSpent DESC)
WHERE
    ROWNUM <= 5;



