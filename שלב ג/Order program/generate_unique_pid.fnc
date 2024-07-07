-- Function to generate unique PId
CREATE OR REPLACE FUNCTION generate_unique_pid RETURN NUMBER IS
    v_new_pid Payment.PId%TYPE;
    v_count NUMBER;
BEGIN
    LOOP
        -- Generate random number between 0 and 999
        v_new_pid := ROUND(DBMS_RANDOM.VALUE(0, 999));

        -- Check if this PId is already used
        SELECT COUNT(*)
        INTO v_count
        FROM Payment
        WHERE PId = v_new_pid;

        -- If not used, return the new PId
        IF v_count = 0 THEN
            RETURN v_new_pid;
        END IF;
    END LOOP;
END generate_unique_pid;
/
