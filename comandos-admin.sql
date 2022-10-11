SELECT * FROM cliente;
SELECT * FROM endereco;
SELECT * FROM conta_corrente;
SELECT * FROM movimentacao_financeira;

/*==== 1 ====*/

/*==== 2 CLIENTES COM MAIORES MOVIMENTAÇÕES ==== */
SELECT cliente.NOME_COMPLETO, cliente.EMAIL, MAX(movimentacao_financeira.VALOR) AS MAIOR_MOVIMENTACAO
FROM cliente 
INNER JOIN conta_corrente ON conta_corrente.CLIENTE = cliente.ID_CLIENTE
INNER JOIN movimentacao_financeira ON movimentacao_financeira.CONTA_CORRENTE = conta_corrente.ID_CONTA_CORRENTE
GROUP BY cliente.NOME_COMPLETO
ORDER BY MAX(movimentacao_financeira.VALOR) DESC
LIMIT 5;

/*==== 3 DIA DO MES COM MAIOR MOVIMENTACAO ==== */
SELECT MAIORES_MOVIMENTACOES_MES.DATA ,MAX(MAIORES_MOVIMENTACOES_MES.MAIOR_MOVIMENTACAO) AS DIA_COM_MAIOR_VALOR_MOVIMENTADO FROM
(SELECT movimentacao_financeira.DATA, SUM(movimentacao_financeira.VALOR) AS MAIOR_MOVIMENTACAO
FROM movimentacao_financeira 
WHERE MONTH(movimentacao_financeira.DATA) = 6 AND DAY(movimentacao_financeira.DATA) = 15
GROUP BY movimentacao_financeira.DATA) AS MAIORES_MOVIMENTACOES_MES;

/*==== 4 DELETER CLIENTE PELO CPF ==== */
DELETE CLIENTE_DELETAR FROM 
cliente CLIENTE_DELETAR 
INNER JOIN endereco ON CLIENTE_DELETAR.ENDERECO = endereco.ID_ENDERECO
INNER JOIN conta_corrente ON CLIENTE_DELETAR.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
WHERE CPF = "90547362080";

/*--->CONFIRMAÇÃO<-----*/
SELECT * FROM 
cliente CLIENTE_DELETAR 
INNER JOIN endereco ON CLIENTE_DELETAR.ENDERECO = endereco.ID_ENDERECO
INNER JOIN conta_corrente ON CLIENTE_DELETAR.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
WHERE CPF = "90547362080";

/*==== 5 ==== */