---- rename table
rename CUSTOMER to CUSTOMER1;

-------��������� ����� �������
--  ����� ����� ����� �������
ALTER TABLE CUSTOMER1
ADD CAddress varchar(15) NULL;

--- ����� ����� ����� ����� ��� ����
ALTER TABLE EVENT ADD cid NUMBER(3);

---����� �� ������� �� ����� ������� ����� ����
DECLARE
  v_cid NUMBER;
BEGIN
  FOR rec IN (SELECT customer_id, name, email, address FROM CUSTOMER) LOOP
    -- Generate a unique cid
    v_cid := GENERATE_UNIQUE_CID;
    
    -- Insert into CUSTOMER1
    INSERT INTO CUSTOMER1 (cid, cname, cemail, cphone, caddress, loyaltypoints)
    VALUES (v_cid, rec.name, rec.email, NULL, rec.address, 0); -- Adjust the values as needed
    
    -- Update the EVENT table with the new cid
    UPDATE EVENT
    SET cid = v_cid
    WHERE customer_id = rec.customer_id;
  END LOOP;
END;

---����� ����� ��� ����� ��������
DECLARE
  v_constraint_name VARCHAR2(255);
BEGIN
   SELECT uc.constraint_name INTO v_constraint_name
  FROM user_constraints uc
  JOIN user_cons_columns ucc
  ON uc.constraint_name = ucc.constraint_name
  WHERE uc.table_name = 'EVENT'
  AND uc.constraint_type = 'R'
  AND ucc.column_name = 'CUSTOMER_ID';

  EXECUTE IMMEDIATE 'ALTER TABLE EVENT DROP CONSTRAINT ' || v_constraint_name;
END;

---����� ���� �� ��� ������ �����
ALTER TABLE EVENT
ADD CONSTRAINT event_cid_fk FOREIGN KEY (cid)
REFERENCES CUSTOMER1 (cid);

---����� ������ �� ����� ��� �����
ALTER TABLE EVENT DROP COLUMN customer_id;

---����� ����� �������
drop table customer;

---����� ��� ������
rename CUSTOMER1 to CUSTOMER;


----����� ���� �������� ����
---����� ����� ���� �������
--- ����� ����� ����� ����� ��� ����
ALTER TABLE ORDERS ADD pid NUMBER(3);
---����� ������ ����� ����� 
DECLARE
  v_cid NUMBER;
BEGIN
  FOR rec IN (SELECT pid, oid FROM PAYMENT) LOOP
    
    
    UPDATE ORDERS O
    SET O.PID = pid
    WHERE O.OID = oid;
  END LOOP;
END;

---����� ����� ��� ����� ��������
DECLARE
  v_constraint_name VARCHAR2(255);
BEGIN
  -- Retrieve the constraint name for the foreign key on 'oid'
  SELECT uc.constraint_name INTO v_constraint_name
  FROM user_constraints uc
  JOIN user_cons_columns ucc
  ON uc.constraint_name = ucc.constraint_name
  WHERE uc.table_name = 'PAYMENT'
  AND uc.constraint_type = 'R'
  AND ucc.column_name = 'OID';

  -- Drop the constraint
  EXECUTE IMMEDIATE 'ALTER TABLE PAYMENT DROP CONSTRAINT ' || v_constraint_name;
END;

---����� ���� �� ���
ALTER TABLE ORDERS
ADD CONSTRAINT orders_pid_fk FOREIGN KEY (pid)
REFERENCES PAYMENT (pid);

---����� ������ ������ �� ����� ���
ALTER TABLE PAYMENT DROP COLUMN oid;

----����� ������ ��������
---������� ����� ���� ����� �������� ����
ALTER TABLE PAYMENT ADD PType varchar(15) NULL;

---����� ������� ������� ������������
ALTER TABLE payment MODIFY ispaid number(3) NULL;
ALTER TABLE payment MODIFY fineprice number(3) NULL;

--- ����� ����� ����� ����� ��� ����
ALTER TABLE EVENT ADD pid NUMBER(3);

DECLARE
  v_pid NUMBER;
  v_price NUMBER;
BEGIN
  -- Disable the trigger
  EXECUTE IMMEDIATE 'ALTER TRIGGER set_payment_price DISABLE';

  FOR rec IN (SELECT payment_id, ptype FROM payment_type) LOOP
    -- Generate a unique pid
    v_pid := GENERATE_UNIQUE_PID;
    
    -- Retrieve the maximum total_price_ for the current payment_id
    SELECT MAX(total_price_) INTO v_price
    FROM EVENT
    WHERE payment_id = rec.payment_id;
    
    -- Cap the price if it exceeds 999
    IF v_price > 999 THEN
      v_price := 999;
    END IF;

    -- Insert into PAYMENT
    INSERT INTO PAYMENT (pid, price, ispaid, fineprice, ptype)
    VALUES (v_pid, v_price, NULL, NULL, rec.ptype); -- Adjust the values as needed

    -- Update the EVENT table with the new pid
    UPDATE EVENT
    SET pid = v_pid
    WHERE payment_id = rec.payment_id;
  END LOOP;

  -- Re-enable the trigger
  EXECUTE IMMEDIATE 'ALTER TRIGGER set_payment_price ENABLE';

  -- Commit the transaction if required
  COMMIT;
  
EXCEPTION
  WHEN OTHERS THEN
    -- Ensure the trigger is re-enabled if an error occurs
    EXECUTE IMMEDIATE 'ALTER TRIGGER set_payment_price ENABLE';
    -- Optionally, rollback the transaction if needed
    ROLLBACK;
    -- Re-raise the exception
    RAISE;
END;

---����� ����� ��� ����� ��������
DECLARE
  v_constraint_name VARCHAR2(255);
BEGIN
   SELECT uc.constraint_name INTO v_constraint_name
  FROM user_constraints uc
  JOIN user_cons_columns ucc
  ON uc.constraint_name = ucc.constraint_name
  WHERE uc.table_name = 'EVENT'
  AND uc.constraint_type = 'R'
  AND ucc.column_name = 'PAYMENT_ID';

  EXECUTE IMMEDIATE 'ALTER TABLE EVENT DROP CONSTRAINT ' || v_constraint_name;
END;

---����� ���� �� ��� ������ �����
ALTER TABLE EVENT
ADD CONSTRAINT event_pid_fk FOREIGN KEY (pid)
REFERENCES PAYMENT (pid);

---����� ������ �� ����� ��� �����
ALTER TABLE EVENT DROP COLUMN payment_id;

---����� ����� �������
drop table payment_type;

---����� ����� �� ����� ����� ��������
ALTER TABLE EVENT DROP COLUMN total_price_;
