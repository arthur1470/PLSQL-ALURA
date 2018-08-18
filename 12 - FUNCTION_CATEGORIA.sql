// FUNCAO PARA MELHORAR O CÓDIGO DIMINUINDO O ACOPLAMENTO
CREATE OR REPLACE FUNCTION categoria_cliente
    (p_faturamento_previsto IN cliente.faturamento_previsto%type)
    RETURN cliente.categoria%type
IS
BEGIN
    IF p_faturamento_previsto < 10000 THEN
        RETURN 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        RETURN 'MEDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        RETURN 'MEDIO GRANDE';
    ELSE
        RETURN 'GRANDE';
    END IF;
END;

// MODIFICANDO A PROCEDURE ANTIGA
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE
    (p_id IN cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ IN cliente.CNPJ%type,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto);
    
    INSERT INTO cliente
        values (p_id, UPPER(p_razao_social), p_CNPJ, p_segmercado_id
                ,SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

// TESTANDO FUNCIONAMENTO
BEGIN
    incluir_cliente(3, 'loja xyz', '32214', null, 5000);
END;

SELECT * FROM cliente;