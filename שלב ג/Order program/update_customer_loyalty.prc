CREATE OR REPLACE PROCEDURE update_customer_loyalty IS
    CURSOR customer_orders IS
        SELECT CId, COUNT(*) AS OrderCount
        FROM Orders
        GROUP BY CId;
    
    v_cid Customer.CId%TYPE;
    v_order_count NUMBER;
BEGIN
    FOR customer_rec IN customer_orders LOOP
        v_cid := customer_rec.CId;
        v_order_count := customer_rec.OrderCount;

        -- Calculate loyalty points
        UPDATE Customer
        SET LoyaltyPoints = v_order_count * 10
        WHERE CId = v_cid;
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows returned.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating customer loyalty: ' || SQLERRM);
        ROLLBACK;
END;
/
