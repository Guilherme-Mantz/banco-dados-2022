USE BLUESOFT_FINANCAS_PESSOAIS;
SELECT * FROM bluesoft_financas_pessoais.movimentacao_financeira;

/*Entendemos que agora é necessário adicionar uma descrição a uma movimentação, 
e essa descrição será obrigatória. ps: E se já tivermos dados inseridos, precisamos ter algum cuidado?*/

ALTER TABLE movimentacao_financeira ADD COLUMN DESCRICAO_MOVIMENTACAO VARCHAR(100) NOT NULL;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Conta de energia da casa" 
WHERE CATEGORIA = "energia casa";

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de marmita pelo IFood" 
WHERE CATEGORIA = "refeição";

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de suprimentos para o mês" 
WHERE CATEGORIA = "mercado" AND VALOR > 150.00;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Abastecimento de carro (gasolina)" 
WHERE CATEGORIA = "gasolina";

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Pagamento de viagem feita com uber" 
WHERE CATEGORIA = "uber";

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de suprimentos básicos" 
WHERE CATEGORIA = "mercado" AND VALOR < 100.00;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Meu salário mensal" 
WHERE CATEGORIA = "Salário";

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de notebook" 
WHERE ID_MOVIMENTACAO = 6;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de fone de ouvido" 
WHERE ID_MOVIMENTACAO = 8;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de WorkStation dedicada para engenharia" 
WHERE ID_MOVIMENTACAO = 21;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de farol para o carro" 
WHERE ID_MOVIMENTACAO = 23;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Almoço no shopping" 
WHERE ID_MOVIMENTACAO = 25;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de mesa para escritório" 
WHERE ID_MOVIMENTACAO = 26;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de software" 
WHERE ID_MOVIMENTACAO = 42;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Compra de mesa para escritório" 
WHERE ID_MOVIMENTACAO = 44;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Fone de ouvido novo" 
WHERE ID_MOVIMENTACAO = 45;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Marmitex do tio Chico" 
WHERE ID_MOVIMENTACAO = 46;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="pedido de açaí pelo IFood" 
WHERE ID_MOVIMENTACAO = 49;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Cadeira para escritório" 
WHERE ID_MOVIMENTACAO = 62;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Mensalidade academia" 
WHERE ID_MOVIMENTACAO = 64;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Celular Iphone 11" 
WHERE ID_MOVIMENTACAO = 65;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Almoço em restaurante" 
WHERE ID_MOVIMENTACAO = 66;

UPDATE movimentacao_financeira
SET DESCRICAO_MOVIMENTACAO ="Almoço em shopping" 
WHERE ID_MOVIMENTACAO = 69;


/*Percebemos que precisamos ter mais precisão no valor da movimentação financeira. 
Agora queremos ter 4 casas após a vírgula. ps: Extra: E se fossemos diminuir a precisão, 
digamos de 6 casas decimais para 4, podemos reduzir a precisão? Se sim, como?*/

ALTER TABLE movimentacao_financeira MODIFY VALOR DECIMAL(10,4);

/*A categoria precisa ter uma coluna que nos fale se ela é de receita ou despesa. 
Por padrão toda categoria criada é de despesa(gasto), 
mas podemos criar categorias como SALARIO que é de RECEITA(ganho).*/

ALTER TABLE movimentacao_financeira ADD COLUMN TIPO ENUM("DESPESA", "RECEITA") DEFAULT "DESPESA";

UPDATE movimentacao_financeira
SET TIPO ="RECEITA" 
WHERE CATEGORIA = "Salário";