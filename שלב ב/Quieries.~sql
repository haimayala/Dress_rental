--Select Quieries
--First Quiery
select C.CID, COUNT(C.CID) AS N_FINES,SUM(P.FINEPRICE) AS SUM_FINES
FROM CUSTOMER C JOIN ORDERS O ON (C.CID = O.OID) JOIN PAYMENT P ON (O.OID = P.OID)
WHERE P.FINEPRICE != 0
GROUP BY C.CID


--Second Quiery
SELECT E.EID,E.ENAME, SUM(SALARY) AS PRICE
FROM EMPLOYEE E JOIN ORDERS O ON O.EID = E.EID 
WHERE E.EID in(SELECT O.EID
               FROM Orders O 
               WHERE O.EID in (SELECT O.EID 
                               FROM Orders O 
                               GROUP BY O.CID,O.EID
                                HAVING COUNT(*) >=2)
GROUP BY O.EID
HAVING COUNT(*) >=50)
GROUP BY E.EID,E.ENAME
ORDER BY E.ENAME;


--Third Quiery
SELECT C.CID AS ID, C.CNAME AS NAME
FROM CUSTOMER C
JOIN ORDERS O ON C.CID = O.CID
JOIN PAYMENT P ON O.OID = P.OID
WHERE P.ISPAID = 1
MINUS
SELECT C.CID AS ID, C.CNAME AS NAME
FROM CUSTOMER C
JOIN ORDERS O ON C.CID = O.CID
JOIN PAYMENT P ON O.OID = P.OID
WHERE P.ISPAID = 0;


--Fourth Quiery
SELECT C.CID, C.CNAME,SUM(P.PRICE) AS PRICE
FROM CUSTOMER C
JOIN ORDERS O ON C.CID = O.CID 
JOIN PAYMENT P ON P.OID = O.OID
GROUP BY C.CID, C.CNAME
HAVING SUM(P.Price) >= (
    SELECT MAX(total_price)
    FROM (
        SELECT SUM(P2.Price) total_price
        FROM ORDERS O2 JOIN PAYMENT P2 ON P2.OID = O2.OID
        GROUP BY O2.CID
    ) max_total_price_subquery
);


--UpdateQuieries
--First Quiery
UPDATE Payment
SET Price =
(
    SELECT D.Price
    FROM Orders O JOIN Dress D ON O.DId = D.DId
    WHERE O.OId = Payment.OId
);


--Second Quiery
UPDATE Payment
SET IsPaid = 1
WHERE IsPaid = 0
  AND OId IN (
      SELECT O.OId
      FROM Orders O
      WHERE O.ReturnDate <= (SYSDATE - INTERVAL '7' DAY)
 );
 
 
--Delete Quieries
--First Quiery
DELETE FROM Payment
WHERE PId NOT IN (
    SELECT MIN(PId)
    FROM Payment
    GROUP BY OId
);



--Second Quiery
DELETE FROM Laundry
WHERE LId NOT IN (
    SELECT MIN(LId)
    FROM Laundry
    GROUP BY OId
);
