create or replace PROCEDURE INCLUIR_CLIENTE
    (p_id IN cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ IN cliente.CNPJ%type,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj;
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto);
    FORMAT_CNPJ(v_cnpj);
    INSERT INTO cliente
        values (p_id, UPPER(p_razao_social), v_CNPJ, p_segmercado_id
                ,SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

EXECUTE INCLUIR_CLIENTE(4, 'Industria RTY', '12378', NULL, 110000);

SELECT * FROM CLIENTE;