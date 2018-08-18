SET SERVEROUTPUT ON

DECLARE
    v_id NUMBER(5) := 2;
BEGIN
    v_id := 3;
    dbms_output.put_line(v_id);
END;