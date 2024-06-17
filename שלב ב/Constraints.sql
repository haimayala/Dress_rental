--First Constraint
ALTER TABLE  Payment
ADD CONSTRAINT is_paid
     CHECK (ispaid = 0 or ispaid = 1);

insert into TAMAR.PAYMENT (PID, PRICE, ISPAID, FINEPRICE, OID)
values (997, 555, 3, 151, 708);


--Second Constraint
CREATE OR REPLACE TRIGGER set_payment_price
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
  SELECT D.Price
  INTO :NEW.Price
  FROM Orders O
  JOIN Dress D ON O.DId = D.DId
  WHERE O.OId = :NEW.OId;
END;
/

insert into TAMAR.ORDERS (OID, ORDERDATE, RETURNDATE, EID, DID, CID)
values (998, to_date('05-07-2022', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'), 106, 956, 234);

insert into TAMAR.PAYMENT (PID, ISPAID, FINEPRICE, OID)
values (99, 1, 126, 998);


--Third Constraint
ALTER TABLE Customer
ADD CONSTRAINT chk_customer_email
CHECK (
  REGEXP_LIKE(
    CEmail, 
    '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$'
  )
);

insert into TAMAR.CUSTOMER (CID, CNAME, CEMAIL, CPHONE)
values (999, 'Dan-Cohen', 'bernie.keithba', '3002526439');
