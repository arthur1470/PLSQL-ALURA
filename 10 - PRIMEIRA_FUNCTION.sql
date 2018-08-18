CREATE OR REPLACE FUNCTION obter_descricao_segmercado
    (p_id IN segmercado.id%type)
    RETURN segmercado.descricao%type
IS
    v_descricao segmercado.descricao%type;
BEGIN
    SELECT descricao INTO v_descricao
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao;
END;

SET SERVEROUTPUT ON

// SQL DEVELOPER
VARIABLE g_descricao varchar2(100)
EXECUTE :g_descricao := obter_descricao_segmercado(1)
PRINT g_descricao

// PLSQL
DECLARE
    v_descricao segmercado.descricao%type;
BEGIN
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('DESCRIÇÃO: ' || v_descricao);
END;