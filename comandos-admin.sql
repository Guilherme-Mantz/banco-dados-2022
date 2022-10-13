SELECT * FROM cliente;
SELECT * FROM endereco;
SELECT * FROM conta_corrente;
SELECT * FROM movimentacao_financeira;

/*==== 1 CLIENTES SEM MOVIMENTAÇÕES NO MES ATUAL ====*/
SELECT NOME_COMPLETO, EMAIL, CIDADE FROM(
	SELECT cliente.NOME_COMPLETO, cliente.EMAIL, cliente.ENDERECO FROM cliente
    WHERE cliente.ID_CLIENTE NOT IN
	(SELECT cliente.ID_CLIENTE
		FROM cliente 
		INNER JOIN conta_corrente ON conta_corrente.CLIENTE = cliente.ID_CLIENTE
		INNER JOIN movimentacao_financeira ON movimentacao_financeira.CONTA_CORRENTE = conta_corrente.ID_CONTA_CORRENTE
		WHERE MONTH(movimentacao_financeira.DATA) = MONTH(CURRENT_DATE()))) AS CLIENTE_SEM_MOVIMENTACAO 
    INNER JOIN endereco ON CLIENTE_SEM_MOVIMENTACAO.ENDERECO = endereco.ID_ENDERECO;

/*==== 2 CLIENTES COM MAIORES MOVIMENTAÇÕES ==== */
SELECT cliente.NOME_COMPLETO, cliente.EMAIL, MAX(movimentacao_financeira.VALOR) AS MAIOR_MOVIMENTACAO
FROM cliente 
INNER JOIN conta_corrente ON conta_corrente.CLIENTE = cliente.ID_CLIENTE
INNER JOIN movimentacao_financeira ON movimentacao_financeira.CONTA_CORRENTE = conta_corrente.ID_CONTA_CORRENTE
GROUP BY cliente.NOME_COMPLETO
ORDER BY MAX(movimentacao_financeira.VALOR) DESC
LIMIT 5;

/*==== 3 DIA DO MES COM MAIOR MOVIMENTACAO ==== */
SELECT MAIORES_MOVIMENTACOES_MES.DATA ,MAX(MAIORES_MOVIMENTACOES_MES.TOTAL_MOVIMENTACAO) AS MAIOR_VALOR_MOVIMENTADO FROM
(SELECT movimentacao_financeira.DATA, SUM(movimentacao_financeira.VALOR) AS TOTAL_MOVIMENTACAO
FROM movimentacao_financeira 
WHERE MONTH(movimentacao_financeira.DATA) = 2
GROUP BY movimentacao_financeira.DATA) AS MAIORES_MOVIMENTACOES_MES;

/*==== 4 DELETER CLIENTE PELO CPF ==== */
START TRANSACTION;

DELETE CLIENTE_DELETAR FROM 
cliente CLIENTE_DELETAR 
INNER JOIN endereco ON CLIENTE_DELETAR.ENDERECO = endereco.ID_ENDERECO
INNER JOIN conta_corrente ON CLIENTE_DELETAR.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
WHERE CPF = "90547362080";

COMMIT;
ROLLBACK;

/*--->CONFIRMAÇÃO<-----*/
SELECT * FROM 
cliente CLIENTE_DELETAR 
INNER JOIN endereco ON CLIENTE_DELETAR.ENDERECO = endereco.ID_ENDERECO
INNER JOIN conta_corrente ON CLIENTE_DELETAR.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
WHERE CPF = "90547362080";

/*==== 5 VALIDAÇÃO DE MOVIMENTAÇÃO ==== */

insert into movimentacao_financeira (valor, DATA, CATEGORIA, CONTA_CORRENTE, DESCRICAO_MOVIMENTACAO, TIPO) 
		values (50000, "2022-10-15", "Pagamento cliente", 1, "Pagamento de cliente à vista", "RECEITA");

DELIMITER //
CREATE TRIGGER tg_bloqueio_seguranca BEFORE INSERT ON movimentacao_financeira FOR EACH ROW BEGIN
   
    IF (SELECT COUNT(movimentacao_financeira.VALOR) FROM movimentacao_financeira 
    INNER JOIN conta_corrente ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
    INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
    WHERE cliente.ID_CLIENTE = ID_CLIENTE) > 10 AND
    
		(SELECT MAX(valor) FROM movimentacao_financeira 
		INNER JOIN conta_corrente ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
		INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
        WHERE ID_CLIENTE = ID_CLIENTE) < (NEW.VALOR * 3) THEN			
			signal sqlstate '45000' set message_text = 'OPERAÇAO EXCEDE O LIMITE PERMITIDO';         
                
	END IF;
END//
