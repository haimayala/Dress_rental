PL/SQL Developer Test script 3.0
64
DECLARE
    v_cid Customer.CId%TYPE;
    v_did Dress.DId%TYPE;
    v_eid Employee.EId%TYPE;
    v_rental_days NUMBER;
    v_estimated_price NUMBER;
    v_rental_price NUMBER;
    v_cid_loyalty NUMBER;

    e_dress_not_available EXCEPTION;

BEGIN
    -- Select a random customer, employee, dress, and rental duration
    SELECT CId , loyaltypoints INTO v_cid, v_cid_loyalty
    FROM (SELECT CId, loyaltypoints FROM Customer ORDER BY DBMS_RANDOM.VALUE)
    WHERE ROWNUM = 1;

    SELECT EId INTO v_eid
    FROM (SELECT EId FROM Employee ORDER BY DBMS_RANDOM.VALUE)
    WHERE ROWNUM = 1;

    v_rental_days := FLOOR(DBMS_RANDOM.VALUE(1, 8)); -- Random rental duration between 1 and 7 days

    -- Select a random dress
    SELECT DId INTO v_did
    FROM (SELECT DId FROM Dress ORDER BY DBMS_RANDOM.VALUE)
    WHERE ROWNUM = 1;

    -- Check if the selected dress is available
    DECLARE
        v_order_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_order_count
        FROM Orders
        WHERE DId = v_did AND ReturnDate >= SYSDATE;

        IF v_order_count > 0 THEN
            RAISE e_dress_not_available;
        END IF;
    END;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Processing Order:');
    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_cid);
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('Dress ID: ' || v_did);
    DBMS_OUTPUT.PUT_LINE('Rental Days: ' || v_rental_days);

    -- Calculate rental price
    v_rental_price := calculate_rental_price(v_did, v_rental_days,v_cid_loyalty);


    -- Process the order
    process_order(v_cid, v_did, v_eid, v_rental_days , v_rental_price);

EXCEPTION
    WHEN e_dress_not_available THEN
        DBMS_OUTPUT.PUT_LINE('The selected dress is currently unavailable. Please choose another dress.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Make sure there are records in Customer, Employee, and Dress tables.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in main program: ' || SQLERRM);
END;
0
0
