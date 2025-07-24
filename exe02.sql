-- Crie o banco de dados
CREATE DATABASE db_construindo_vidas;

-- Selecionando o banco de dados
USE db_construindo_vidas;

-- Criando a Tabela
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

-- Inserindo os valores
INSERT INTO tb_categorias (categoria, descricao) VALUES
('Hidráulica', 'Tubos, conexões, caixas d''água e acessórios para instalações hidráulicas'),
('Elétrica', 'Fios, cabos, tomadas, interruptores e materiais para instalações elétricas'),
('Pisos e Revestimentos', 'Porcelanatos, cerâmicas, argamassas e rejuntes'),
('Ferramentas', 'Ferramentas manuais e elétricas para construção e reparos'),
('Cimentos e Argamassas', 'Cimento, cal, areia e argamassas especiais');

-- Criando a Tabela
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    unidade_medida VARCHAR(50),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserindo os valores
INSERT INTO tb_produtos (produto, valor, quantidade, unidade_medida, categoria_id) VALUES
('Cano PVC 50mm', 35.00, 150, 'metro', 1),
('Fio Elétrico 2.5mm', 95.00, 200, 'rolo', 2),
('Porcelanato Polido 60x60', 85.50, 500, 'm²', 3),
('Furadeira de Impacto', 250.00, 30, 'unidade', 4),
('Cimento 50kg', 40.00, 1000, 'saco', 5),
('Torneira de Bancada', 120.00, 80, 'unidade', 1),
('Interruptor Simples', 15.00, 300, 'unidade', 2),
('Argamassa 20kg', 28.00, 400, 'saco', 5);

-- produtos cujo valor seja maior do que R$ 100,00
SELECT * FROM tb_produtos WHERE valor > 100.00;

-- produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

-- utilizando o operador LIKE, buscando todos os produtos que possuam a letra 'C' no atributo produto
SELECT * FROM tb_produtos WHERE produto LIKE '%C%';

-- utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.produto, p.valor, p.quantidade, p.unidade_medida, c.categoria, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id;

--  utilizando INNER JOIN para produtos da categoria 'Elétrica'
SELECT p.produto, p.valor, p.quantidade, p.unidade_medida, c.categoria, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.categoria = 'Elétrica';