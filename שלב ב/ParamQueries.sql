--First Quiery
SELECT ENAME, COUNT(*) AS n_orders, SUM(SALARY) AS SALARY
FROM EMPLOYEE E JOIN ORDERS O ON E.EID = O.EID
WHERE O.ORDERDATE BETWEEN &<name= "d_from" type= date required=true> and &<name= "d_to" type= date required=true>
GROUP BY E.EID, E.ENAME;


--Second Quiery
SELECT D.DID, D.LENGTH, D.COLOR,D.PRICE,O.ORDERDATE, O.RETURNDATE
FROM CUSTOMER C 
JOIN ORDERS O ON C.CID = O.CID 
JOIN DRESS D ON O.DID = D.DID
WHERE C.CID = &<name="CUSTOMER_NAME" 
list="SELECT DISTINCT C.CID,C.CNAME FROM CUSTOMER C JOIN ORDERS O ON C.CID = O.CID ORDER BY CNAME"
description="yes" restricted="yes" >;


--Third Quiery
select l.lname,o.oid,l.pickingdate,d.did
from laundry l 
join orders o on l.oid = o.oid
join dress d on o.did = d.did
where l.lid  in
(&<name="laundry_name"
list="select DISTINCT lid,lname from laundry order by lname"
description="yes" multiselect="yes" >) 


--Fourth Quiery
SELECT C.CID, C.CNAME
FROM CUSTOMER C 
JOIN ORDERS O ON O.CID = C.CID
JOIN PAYMENT P ON P.OID = O.OID
WHERE P.PRICE >= &<NAME="Price" IFEMPTY=0>
AND O.ORDERDATE >= &<NAME="Return_Date" TYPE=DATE REQUIRED="TRUE">
ORDER BY C.CNAME &<NAME="Descending" CHECKBOX="DESC, ASC">;
