DECLARE
    v_id segmercado.id%type := 2;
    v_descricao segmercado.descricao%type := 'atacado';
BEGIN
    INSERT INTO segmercado VALUES (v_id, upper(v_descricao));
    COMMIT;
END;

SELECT * FROM segmercado;