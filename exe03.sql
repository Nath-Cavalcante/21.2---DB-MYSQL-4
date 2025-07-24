-- Crie o banco de dados
CREATE DATABASE db_pizzaria_legal;

-- Selecionando o banco de dados
USE db_pizzaria_legal;

-- Criando a Tabela
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

-- Inserindo os valores
INSERT INTO tb_categorias (categoria, descricao) VALUES
('Salgadas', 'Pizzas com recheios tradicionais e salgados'),
('Doces', 'Pizzas com recheios doces e sobremesas'),
('Vegetarianas', 'Pizzas sem carne, com vegetais e queijos'),
('Especiais', 'Pizzas com ingredientes premium ou combinações exclusivas'),
('Tradicionais', 'Pizzas clássicas e as mais pedidas');

-- Criando a Tabela
CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pizza VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    ingredientes VARCHAR(500),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserindo os valores
INSERT INTO tb_pizzas (pizza, valor, tamanho, ingredientes, categoria_id) VALUES
('Calabresa', 45.00, 'Grande', 'Molho, mussarela, calabresa fatiada e cebola', 1),
('Quatro Queijos', 55.00, 'Grande', 'Molho, mussarela, provolone, parmesão e catupiry', 1),
('Brigadeiro', 60.00, 'Média', 'Chocolate, granulado', 2),
('Marguerita', 48.00, 'Grande', 'Molho, mussarela, tomate e manjericão', 5),
('Portuguesa', 52.00, 'Grande', 'Molho, mussarela, presunto, ovos, cebola e azeitona', 5),
('Vegetariana', 58.00, 'Grande', 'Molho, mussarela, brócolis, palmito, champignon e pimentão', 3),
('Morango com Chocolate', 65.00, 'Média', 'Chocolate branco, morangos e raspas de chocolate', 2),
('Pizza da Casa', 75.00, 'Grande', 'Molho, mussarela, camarão, cream cheese e alho poró', 4);

-- pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- utilizando o operador LIKE, buscando todas as pizzas que possuam a letra 'M' no atributo pizza
SELECT * FROM tb_pizzas WHERE pizza LIKE '%M%';

-- utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT p.pizza, p.valor, p.tamanho, p.ingredientes, c.categoria, c.descricao FROM tb_pizzas p INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- utilizando INNER JOIN para produtos da categoria 'Doces'
SELECT p.pizza, p.valor, p.tamanho, p.ingredientes, c.categoria, c.descricao FROM tb_pizzas p INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.categoria = 'Doces';