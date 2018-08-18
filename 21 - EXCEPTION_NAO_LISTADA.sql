create or replace PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
    (p_id cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type)
IS
    e_cliente_id_inexistente exception;
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
    
    IF SQL%NOTFOUND THEN
        RAISE e_cliente_id_inexistente;
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN e_cliente_id_inexistente THEN
        raise_application_error(-20100, 'Cliente inexistente');
END;

EXECUTE atualizar_cli_seg_mercado(20, 2);