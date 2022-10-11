SELECT * FROM cliente;
SELECT * FROM movimentacao_financeira;

/*CADA CONSULTA PEGA 1 CLIENTE PELO ID*/

/*==== 1 DESPESAS DE UM DETERMINADO MÊS ====*/
SELECT cliente.NOME_COMPLETO, movimentacao_financeira.VALOR, movimentacao_financeira.DATA, movimentacao_financeira.DESCRICAO_MOVIMENTACAO, movimentacao_financeira.TIPO
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE 
WHERE cliente.ID_CLIENTE = 2 AND MONTH(movimentacao_financeira.DATA) = 01;

/*==== 2 MOVIMENTAÇÕES DE UM DETERMINADO BANCO ====*/
SELECT cliente.NOME_COMPLETO,conta_corrente.CODIGO_BANCO, movimentacao_financeira.VALOR, movimentacao_financeira.DATA, movimentacao_financeira.CATEGORIA, movimentacao_financeira.DESCRICAO_MOVIMENTACAO
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE 
WHERE cliente.ID_CLIENTE = 2 AND conta_corrente.CODIGO_BANCO = "237";

/*==== 3 BUSCA POR PALAVRA NA DESCRIÇÃO DA CATEGORIA ====*/
SELECT cliente.NOME_COMPLETO, movimentacao_financeira.CATEGORIA, movimentacao_financeira.DESCRICAO_MOVIMENTACAO
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE 
WHERE cliente.ID_CLIENTE = 2 AND movimentacao_financeira.DESCRICAO_MOVIMENTACAO LIKE "%compra%";

/*==== 4 MOVIMENTAÇÕES NO PRIMEIRO SEMESTRE DE 2022 ====*/
SELECT cliente.NOME_COMPLETO, movimentacao_financeira.VALOR, movimentacao_financeira.DATA, movimentacao_financeira.DESCRICAO_MOVIMENTACAO, movimentacao_financeira.TIPO
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE 
WHERE cliente.ID_CLIENTE = 2 AND MONTH(movimentacao_financeira.DATA) BETWEEN 01 AND 06
ORDER BY DATA;

/*==== 5 MOVIMENTAÇÕES NA PRIMEIRA SEMANA DE UM MÊS ====*/


/*==== 6 SOMA DE TODAS AS DESPESAS ====*/
SELECT cliente.NOME_COMPLETO, movimentacao_financeira.CATEGORIA,
ROUND(SUM(movimentacao_financeira.VALOR), 2) AS SOMA_TOTAL_POR_CATEGORIA
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
WHERE cliente.ID_CLIENTE = 2 AND movimentacao_financeira.TIPO = "DESPESA"
GROUP BY movimentacao_financeira.CATEGORIA
HAVING SUM(movimentacao_financeira.VALOR) > 1000;

/*==== 7 BUSCAR 5 RECEITAS ====*/

/*==== 8 MAIOR MOVIMENTAÇÃO DENTRO DO MÊS ====*/
SELECT cliente.NOME_COMPLETO,MAX(movimentacao_financeira.VALOR) AS VALOR_MAIOR_MOVIMENTACAO,
movimentacao_financeira.DATA, movimentacao_financeira.DESCRICAO_MOVIMENTACAO, movimentacao_financeira.TIPO
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE 
WHERE cliente.ID_CLIENTE = 2 AND MONTH(movimentacao_financeira.DATA) = 06;

/*==== 9 CATEGORIA MAIS MOVIMENTADA DE CADA MES ====*/
SELECT cliente.NOME_COMPLETO, MONTHNAME(movimentacao_financeira.DATA) AS MES, movimentacao_financeira.CATEGORIA,
MAX(ROUND(movimentacao_financeira.VALOR, 2)) AS SOMA_TOTAL_POR_CATEGORIA
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
INNER JOIN movimentacao_financeira ON conta_corrente.ID_CONTA_CORRENTE = movimentacao_financeira.CONTA_CORRENTE
WHERE cliente.ID_CLIENTE = 2
GROUP BY MONTH(movimentacao_financeira.DATA);

/*==== 10 CONSULTAR SALDO ====*/
SELECT cliente.NOME_COMPLETO, 
CASE 
	WHEN conta_corrente.CODIGO_BANCO = "001" THEN "BANCO DO BRASIL"
    WHEN conta_corrente.CODIGO_BANCO = "341" THEN "ITAÚ"
    WHEN conta_corrente.CODIGO_BANCO = "237" THEN "BRADESCO"
    WHEN conta_corrente.CODIGO_BANCO = "033" THEN "BANCO SANTANDER"
    ELSE "NOME DO BANCO NÃO REGISTRADO NO SISTEMA"
END AS NOME_BANCO,
conta_corrente.SALDO
FROM conta_corrente
INNER JOIN cliente ON cliente.ID_CLIENTE = conta_corrente.CLIENTE
WHERE cliente.ID_CLIENTE = 2;