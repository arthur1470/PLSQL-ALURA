create or replace PROCEDURE INCLUIR_CLIENTE
    (p_id IN cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ IN cliente.CNPJ%type,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj;
    e_null exception;
    pragma exception_init (e_null, -1400);
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto);
    FORMAT_CNPJ(v_cnpj);
    INSERT INTO cliente
        values (p_id, UPPER(p_razao_social), v_CNPJ, p_segmercado_id
                ,SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        raise_application_error(-20010, 'Ciente já cadastrado');
    WHEN e_null THEN
        raise_application_error(-20015, 'A coluna ID tem preenchimento obrigatório');
    WHEN OTHERS THEN
        raise_application_error(-20020, sqlerrm() );
        
END;

EXECUTE INCLUIR_CLIENTE(NULL, 'TEXTE', 82938, 2, 3000);