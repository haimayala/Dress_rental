CREATE OR REPLACE PROCEDURE update_dress_rental_count IS
    CURSOR dress_orders IS
        SELECT DId, COUNT(*) AS OrderCount
        FROM Orders
        GROUP BY DId;
    
    v_did Dress.DId%TYPE;
    v_order_count NUMBER;
BEGIN
    FOR dress_rec IN dress_orders LOOP
        v_did := dress_rec.DId;
        v_order_count := dress_rec.OrderCount;

        -- Update rental count for the dress
        UPDATE Dress
        SET RentalCount = v_order_count
        WHERE DId = v_did;
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows returned.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating dress rental count: ' || SQLERRM);
        ROLLBACK;
END;
/
