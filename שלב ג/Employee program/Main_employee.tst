PL/SQL Developer Test script 3.0
33
DECLARE
    v_eid Employee.EId%TYPE;
    v_ename Employee.EName%TYPE;
    v_rating Employee.PerformanceRating%TYPE;
    top_employees SYS_REFCURSOR;
BEGIN
    -- Update performance rating for all employees
    FOR emp IN (SELECT EId FROM Employee) LOOP
        update_employee_performance(emp.EId);
    END LOOP;

    -- Get the top 5 employees after updating their ratings
    top_employees := get_top_5_employees;

    LOOP
        FETCH top_employees INTO v_eid, v_ename, v_rating;
        EXIT WHEN top_employees%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Employee Performance Review');
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_eid);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('Current Rating: ' || v_rating);
    END LOOP;

    CLOSE top_employees;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows returned.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in main program: ' || SQLERRM);
END;
0
0
