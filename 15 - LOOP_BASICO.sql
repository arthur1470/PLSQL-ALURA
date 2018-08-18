CREATE OR REPLACE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
    (p_id cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type)
IS
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
    COMMIT;
END;

DECLARE
    v_segmercado_id cliente.segmercado_id%type := 1;
    v_i NUMBER(4);
BEGIN
    v_i := 1;
    
    LOOP
        ATUALIZAR_CLI_SEG_MERCADO(v_i, v_segmercado_id);
        v_i := v_i + 1;
        EXIT WHEN v_i > 4;
    END LOOP;
END;

SELECT * FROM CLIENTE;