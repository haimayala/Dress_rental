CREATE OR REPLACE PROCEDURE process_order(
    p_cid NUMBER,
    p_did NUMBER,
    p_eid NUMBER,
    p_rental_days NUMBER,
    p_rental_price NUMBER
) IS
    v_oid Orders.OId%TYPE;
    v_pid Payment.PId%TYPE;
    v_order_date DATE := SYSDATE;
    v_return_date DATE := SYSDATE + p_rental_days;

BEGIN
    
    -- Generate unique IDs
    v_oid := generate_unique_oid();
    v_pid := generate_unique_pid();

    -- Insert new order
    INSERT INTO Orders (OId, OrderDate, ReturnDate, EId, DId, CId,Salary)
    VALUES (v_oid, v_order_date, v_return_date, p_eid, p_did, p_cid, p_rental_price * 0.2);

    -- Insert payment record
    INSERT INTO Payment (PId, Price, IsPaid, FinePrice, OId)
    VALUES (v_pid, p_rental_price, 0, 0, v_oid);
    
  UPDATE Payment
    SET Price = p_rental_price
    WHERE PId = v_pid;

    -- Update dress rental count
    UPDATE Dress
    SET RentalCount = RentalCount + 1
    WHERE DId = p_did;

    -- Update customer loyalty points
    UPDATE Customer
    SET LoyaltyPoints = LoyaltyPoints + 10
    WHERE CId = p_cid;

    COMMIT;
    
     DBMS_OUTPUT.PUT_LINE('Order processed successfully. Order ID: ' || v_oid);
    DBMS_OUTPUT.PUT_LINE('Payment ID: ' || v_pid);
    DBMS_OUTPUT.PUT_LINE('Rental price: $' || p_rental_price);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error processing order: ' || SQLERRM);
END;
/
