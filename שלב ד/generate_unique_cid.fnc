CREATE OR REPLACE FUNCTION generate_unique_cid RETURN NUMBER IS
    v_new_cid Customer1.CId%TYPE;
    v_count NUMBER;
BEGIN
    LOOP
        -- Generate random number between 0 and 999
        v_new_cid := ROUND(DBMS_RANDOM.VALUE(0, 999));

        -- Check if this OId is already used
        SELECT COUNT(*)
        INTO v_count
        FROM Customer1
        WHERE CId = v_new_cid;

        -- If not used, return the new OId
        IF v_count = 0 THEN
            RETURN v_new_cid;
        END IF;
    END LOOP;
END generate_unique_cid;
/
