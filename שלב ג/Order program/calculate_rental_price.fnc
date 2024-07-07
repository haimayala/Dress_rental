CREATE OR REPLACE FUNCTION calculate_rental_price(p_did NUMBER, p_days NUMBER, c_loyalty NUMBER)
RETURN NUMBER IS
    v_base_price Dress.Price%TYPE;
    v_rental_count Dress.RentalCount%TYPE;
    v_final_price NUMBER;
BEGIN
    -- Get the base price and rental count of the dress
    SELECT Price, RentalCount INTO v_base_price, v_rental_count
    FROM Dress
    WHERE DId = p_did;

    -- Calculate the final price based on rental count and duration
    v_final_price := v_base_price + p_days*10;
    
    -- Apply discount for frequently rented dresses
    IF v_rental_count > 7 THEN
        v_final_price := v_final_price * 0.9; -- 10% discount
    ELSIF v_rental_count > 4 THEN
        v_final_price := v_final_price * 0.95; -- 5% discount
    END IF;
    
    -- Apply discount for loyalty points
    IF c_loyalty > 50 THEN
        v_final_price := v_final_price * 0.9; -- 10% discount
    ELSIF c_loyalty > 30 THEN
        v_final_price := v_final_price * 0.95; -- 5% discount
    END IF;
    
    IF v_final_price > 999 THEN
       v_final_price := 999;
    END IF;

    RETURN ROUND(v_final_price, 2);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Dress not found');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error calculating rental price: ' || SQLERRM);
END;
/
