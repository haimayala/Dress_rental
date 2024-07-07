create or replace procedure update_employee_performance(p_eid  IN NUMBER) IS
    CURSOR emp_orders IS
        SELECT COUNT(*) AS order_count
        FROM Orders
        WHERE EId = p_eid AND OrderDate >= ADD_MONTHS(SYSDATE, -3);

    v_order_count NUMBER;
    v_new_rating NUMBER(2,1);

    -- Custom exception for employee not found
    employee_not_found EXCEPTION;
BEGIN
    -- Check if employee exists
    DECLARE
        v_employee_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_employee_count
        FROM Employee
        WHERE EId = p_eid;

        IF v_employee_count = 0 THEN
            RAISE employee_not_found;
        END IF;
    END;

    OPEN emp_orders;
    FETCH emp_orders INTO v_order_count;
    CLOSE emp_orders;

    -- Calculate new rating based on order count
    v_new_rating := LEAST(5.0, 3.0 + (v_order_count * 0.2));

    -- Update employee performance rating
    UPDATE Employee
    SET PerformanceRating = v_new_rating
    WHERE EId = p_eid;

    COMMIT;
EXCEPTION
    WHEN employee_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Employee with ID ' || p_eid || ' does not exist.');
        ROLLBACK;
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No orders found for the employee with ID: ' || p_eid);
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating employee performance: ' || SQLERRM);
        ROLLBACK;
END;
/
