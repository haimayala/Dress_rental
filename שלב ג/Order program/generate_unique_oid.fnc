-- Function to generate unique OId
CREATE OR REPLACE FUNCTION generate_unique_oid RETURN NUMBER IS
    v_new_oid Orders.OId%TYPE;
    v_count NUMBER;
BEGIN
    LOOP
        -- Generate random number between 0 and 999
        v_new_oid := ROUND(DBMS_RANDOM.VALUE(0, 999));

        -- Check if this OId is already used
        SELECT COUNT(*)
        INTO v_count
        FROM Orders
        WHERE OId = v_new_oid;

        -- If not used, return the new OId
        IF v_count = 0 THEN
            RETURN v_new_oid;
        END IF;
    END LOOP;
END generate_unique_oid;
/
