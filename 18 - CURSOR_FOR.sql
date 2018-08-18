DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
    CURSOR cur_cliente is
        SELECT id
        FROM cliente;
BEGIN
    FOR cli_rec IN cur_cliente LOOP
        ATUALIZAR_CLI_SEG_MERCADO(cli_rec.id, v_segmercado_id);
    END LOOP;
    
    COMMIT;
END;

SELECT * FROM CLIENTE;