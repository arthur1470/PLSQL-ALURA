DECLARE
    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 1;
    CURSOR cur_cliente IS
        SELECT id 
        FROM CLIENTE;
BEGIN
    OPEN cur_cliente;
    LOOP
        FETCH cur_cliente into v_id;
        EXIT WHEN cur_cliente%NOTFOUND;
        atualizar_cli_seg_mercado(v_id, v_segmercado_id);
    END LOOP;
    
    CLOSE cur_cliente;
    COMMIT;
END;