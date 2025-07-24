-- Crie o banco de dados
CREATE DATABASE db_rh_funcionarios;

-- Selecionando o banco de dados
USE db_rh_funcionarios;

-- Criando a Tabela
CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
funcao VARCHAR(255) NOT NULL,
salario DECIMAL(10, 2) NOT NULL,
idade int
);

-- Inserindo os valores
INSERT INTO tb_colaboradores(nome, funcao, salario, idade)
values("Nathalia", "Analista Junior", 3500.00, 30 );
INSERT INTO tb_colaboradores(nome, funcao, salario, idade)
values("Rafael", "Designer Grafico", 1800.00, 37 );
INSERT INTO tb_colaboradores(nome, funcao, salario, idade)
values("Lilian", "Estagiaria", 1500.00, 20 );
INSERT INTO tb_colaboradores(nome, funcao, salario, idade)
values("Silvia", "Auxiliar Administrativo", 2500.00, 48 );
INSERT INTO tb_colaboradores(nome, funcao, salario, idade)
values("Luiz", "Vendedor", 3000.00, 30 );

-- colaboradores com o salário maior do que 2000
SELECT*FROM tb_colaboradores where salario > 2000;

-- colaboradores com o salário menor do que 2000
SELECT*FROM tb_colaboradores where salario < 2000;

-- atualização de registro
UPDATE tb_colaboradores SET salario = 1900.00 WHERE id = 3;