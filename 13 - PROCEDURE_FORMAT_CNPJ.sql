CREATE OR REPLACE PROCEDURE FORMAT_CNPJ
    (p_cnpj IN OUT cliente.cnpj%type)
IS
BEGIN
    p_cnpj := substr(p_cnpj, 1, 2) || '/' || substr(p_cnpj, 3);
END;

VARIABLE g_cnpj VARCHAR2(10)
EXECUTE :g_cnpj := '12345';
PRINT g_cnpj

EXECUTE FORMAT_CNPJ(:g_cnpj)
PRINT g_cnpj

SET SERVEROUTPUT ON

DECLARE
    v_test VARCHAR2(10) := '12346';
BEGIN
    FORMAT_CNPJ(v_test);
    dbms_output.put_line(v_test);
END;