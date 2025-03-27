/*Uma loja tem um banco de dados que contém todo o controle de vendas de 
produtos e de cadastro de clientes. Pensando nisso, crie uma função para somar 
todos os clientes que foram cadastrados na loja durante um dia.*/

CREATE FUNCTION total_clientes_por_dia(data_consulta DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_clientes INT;

    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE DATE(data_cadastro) = data_consulta;

    RETURN total_clientes;
END

SELECT total_clientes_por_dia('2025-03-27');