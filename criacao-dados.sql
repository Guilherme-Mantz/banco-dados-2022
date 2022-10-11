USE BLUESOFT_FINANCAS_PESSOAIS;

INSERT INTO endereco
VALUES (null, "29118033", "Rua Paulo Afonso", "962", "", "Alecrim", "Vila Velha", "ES", "Brasil"),
(null, "57052570", "Rua Tatajuba", "235", "", "Gruta de Lourdes", "Maceió", "AL", "Brasil"),
(null, "69900276", "Rua São Paulo", "668", "", "Dom Giocondo", "Rio Branco", "AC", "Brasil"),
(null, "58056610", "Rua Maria dos Anjos de Lima Feitosa", "628", "", "Mangabeira", "João Pessoa", "PB", "Brasil");

INSERT INTO cliente
VALUES(null, "Thales Lucca Luís Viana", "90547362080", "thales_viana@thibe.com", "741852963", "1982-04-20", "contador", "M", 1),
(null, "Matheus Vinicius Bernardes", "09720790415", "matheus.bernardes@hushmail.com", "7539518426", "1974-10-03", "engenheiro civil", "M", 2),
(null, "João Nathan Lopes", "23136410408", "joaolopes72@cancaonova.com", "39715084926", "1972-06-22", "Análista de Sistemas", "M", 3),
(null, "Bárbara Maitê Luana Martins", "60741345102", "barbara.maitemartins@estruturalbr.com", "493768215675", "1981-05-14", "Nutricionista", "F", 4);

INSERT INTO conta_corrente
VALUES(null, "341", "88350-2", "0317", "Conta principal", 30452.69, 1),
(null, "001", "55210-0", "4290", "Compras diversas", 15060.75, 1),
(null, "001", "1070270-9", "4106", "Conta para valores altos", 50895.10, 2),
(null, "237", "1890155-2", "6194", "Compras diversas", 16365.19, 2),
(null, "033", "53787824-3", "1556", "Conta principal", 34610.10, 3),
(null, "237", "0830096-8", "6159", "Compras diversas", 26321.59, 3),
(null, "001", "193872-0", "4519", "Compras diversas", 29567.59, 4),
(null, "341", "46287-5", "7389", "Conta principal", 30598.98, 4);

/*MOVIMENTAÇÕES CLIENTE 1*/
INSERT INTO movimentacao_financeira
VALUES(null, 120.60, "2022-05-15","energia casa", 1),
(null, 146.30, "2022-06-15","energia casa", 1),
(null, 124.55, "2022-07-16","energia casa", 1),
(null, 110.90, "2022-08-15","energia casa", 1),
(null, 150.00, "2022-09-15","energia casa", 1),
(null, 1700.90, "2022-04-26","eletronicos", 2),
(null, 50.00, "2022-06-10","refeição", 2),
(null, 90.50, "2022-06-15","eletronicos", 2),
(null, 150.00, "2022-07-05","gasolina", 2),
(null, 62.68, "2022-08-17","uber", 2),
(null, 2600.00, "2022-01-7","Salário", 1),
(null, 2600.00, "2022-02-7","Salário", 1),
(null, 2600.00, "2022-03-7","Salário", 1),
(null, 2600.00, "2022-04-7","Salário", 1),
(null, 2600.00, "2022-05-7","Salário", 1),
(null, 2600.00, "2022-06-7","Salário", 1),
(null, 2600.00, "2022-07-7","Salário", 1),
(null, 2600.00, "2022-08-7","Salário", 1),
(null, 2600.00, "2022-09-7","Salário", 1),
(null, 2600.00, "2022-10-7","Salário", 1);

/*MOVIMENTAÇÕES CLIENTE 2*/
INSERT INTO movimentacao_financeira
VALUES(null, 15000.00, "2022-01-18","eletronicos", 3),
(null, 250.30, "2022-01-10","energia casa", 3),
(null, 2000.00, "2022-02-23","peça de carro", 3),
(null, 110.90, "2022-02-10","energia casa", 3),
(null, 90.00, "2022-03-09","alimentação", 3),
(null, 600.00, "2022-04-12","movél", 4),
(null, 150.00, "2022-04-26","gasolina", 4),
(null, 356.58, "2022-05-1","mercado", 4),
(null, 90.00, "2022-06-2","gasolina", 4),
(null, 70.00, "2022-06-5","mercado", 4),
(null, 6500.00, "2022-01-5","Salário", 3),
(null, 6500.00, "2022-02-5","Salário", 3),
(null, 6500.00, "2022-03-5","Salário", 3),
(null, 6500.00, "2022-04-5","Salário", 3),
(null, 6500.00, "2022-05-5","Salário", 3),
(null, 6500.00, "2022-06-5","Salário", 3),
(null, 6500.00, "2022-07-5","Salário", 3),
(null, 6500.00, "2022-08-5","Salário", 3),
(null, 6500.00, "2022-09-5","Salário", 3);

/*MOVIMENTAÇÕES CLIENTE 3*/
INSERT INTO movimentacao_financeira
VALUES(null, 200.10, "2022-01-10", "energia casa", 5),
(null, 600.00, "2022-01-25","licença de software", 5),
(null, 180.00, "2022-02-10","energia casa", 5),
(null, 540.90, "2022-02-28","móvel", 5),
(null, 230.00, "2022-03-09","eletronico", 5),
(null, 50.00, "2022-04-12","alimentação", 6),
(null, 120.00, "2022-04-26","gasolina", 6),
(null, 259.63, "2022-05-1","mercado", 6),
(null, 18.80, "2022-06-2","alimentação", 6),
(null, 70.00, "2022-06-5","gasolina", 6),
(null, 4200.00, "2022-01-6","Salário", 5),
(null, 4200.00, "2022-02-6","Salário", 5),
(null, 4200.00, "2022-03-6","Salário", 5),
(null, 4200.00, "2022-04-6","Salário", 5),
(null, 4200.00, "2022-05-6","Salário", 5),
(null, 4200.00, "2022-06-6","Salário", 5),
(null, 4200.00, "2022-07-6","Salário", 5),
(null, 4200.00, "2022-08-6","Salário", 5),
(null, 4200.00, "2022-09-6","Salário", 5);


/*MOVIMENTAÇÕES CLIENTE 4*/
INSERT INTO movimentacao_financeira
VALUES(null, 150.00, "2022-01-5", "energia casa", 7),
(null, 255.20, "2022-01-14","móvel", 7),
(null, 165.00, "2022-02-5","energia casa", 7),
(null, 89.99, "2022-02-15","academia", 7),
(null, 4500.00, "2022-03-09","eletronico", 7),
(null, 90.00, "2022-04-12","alimentação", 8),
(null, 100.00, "2022-04-26","gasolina", 8),
(null, 350.67, "2022-05-1","mercado", 8),
(null, 57.90, "2022-06-2","alimentação", 8),
(null, 80.90, "2022-06-5","gasolina", 8),
(null, 3600.00, "2022-01-7","Salário", 8),
(null, 3600.00, "2022-02-7","Salário", 8),
(null, 3600.00, "2022-03-7","Salário", 8),
(null, 3600.00, "2022-04-7","Salário", 8),
(null, 3600.00, "2022-05-7","Salário", 8),
(null, 3600.00, "2022-06-7","Salário", 8),
(null, 3600.00, "2022-07-7","Salário", 8),
(null, 3600.00, "2022-08-7","Salário", 8),
(null, 3600.00, "2022-09-7","Salário", 8),
(null, 3600.00, "2022-10-7","Salário", 8);
