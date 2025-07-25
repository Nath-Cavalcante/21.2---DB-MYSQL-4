-- Crie o banco de dados
CREATE DATABASE db_farmacia_bem_estar;

-- Selecionando o banco de dados
USE db_farmacia_bem_estar;

-- Criando a Tabela
CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);
-- Inserindo os valores
INSERT INTO tb_categorias (categoria, descricao) VALUES
('Medicamentos', 'Produtos para tratamento de doenças e alívio de sintomas'),
('Higiene Pessoal', 'Produtos para cuidados diários e bem-estar'),
('Cosméticos', 'Produtos para beleza e cuidados com a pele e cabelo'),
('Suplementos', 'Produtos para complemento nutricional e saúde'),
('Primeiros Socorros', 'Produtos para curativos e emergências');

-- Criando a Tabela
CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	produto VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    data_validade DATE,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);
-- Inserindo os valores
INSERT INTO tb_produtos (produto, valor, quantidade, data_validade, categoria_id) VALUES
('Paracetamol 500mg', 15.50, 200, '2026-12-31', 1),
('Protetor Solar FPS 30', 45.99, 150, '2025-08-20', 2),
('Shampoo Anticaspa', 30.00, 100, '2027-03-15', 2),
('Vitamina C 1000mg', 65.00, 80, '2026-06-01', 4),
('Curativo Band-Aid', 10.25, 300, '2028-01-10', 5),
('Creme Hidratante Facial', 75.50, 90, '2025-11-05', 3),
('Dipirona 1g', 8.75, 250, '2026-09-30', 1),
('Ômega 3', 55.00, 70, '2027-04-20', 4);

-- produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE valor > 50.00;

-- produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

-- utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo produto
SELECT * FROM tb_produtos WHERE produto LIKE '%C%';

-- utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.produto, p.valor, p.quantidade, p.data_validade, c.categoria, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- utilizando INNER JOIN para produtos da categoria 'Medicamentos'
SELECT p.produto, p.valor, p.quantidade, p.data_validade, c.categoria, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.categoria = 'Medicamentos';
