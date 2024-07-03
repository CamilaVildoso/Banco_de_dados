CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
id BIGINT auto_increment,
categoria VARCHAR(100) not null,
descricao VARCHAR(255),
PRIMARY KEY (id)
);

CREATE TABLE tb_produtos(
id BIGINT auto_increment,
nome VARCHAR(100) not null,
preco DECIMAL(10, 2),
marca VARCHAR(50),
data_validade DATE,
PRIMARY KEY(id),
categoriaid BIGINT,
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (categoria, descricao) 
VALUES('Medicamentos', 'Medicamentos diversos para cuidados gerais.'),
('Higiene Pessoal', 'Produtos de higiene pessoal, como sabonetes e shampoos.'),
('Cosméticos', 'Produtos cosméticos para cuidados com a pele e cabelo.'),
('Cuidados com Bebês', 'Produtos para cuidados com bebês e crianças.'),
('Produtos de Limpeza', 'Produtos de limpeza e desinfecção.');

INSERT INTO tb_produtos (nome, preco, marca, data_validade, categoriaid) 
VALUES('Paracetamol 500mg', 15.90, 'Genérico', '2025-12-31', 1),
('Shampoo Anticaspa', 23.50, 'Clear', '2024-08-31', 2),
('Creme Hidratante Facial', 35.75, 'Nivea', NULL, 3),
('Fralda Descartável M', 139.90, 'Pampers', NULL, 4),
('Pomada Cicatrizante', 21.25, 'Bepantol', NULL, 1),
('Desinfetante Líquido 1L', 12.90, 'Veja', NULL, 5),
('Creme Dental Branqueador', 15.50, 'Colgate', '2023-10-31', 2),
('Protetor Solar FPS 50', 53.50, 'L´Oréal', '2024-07-31', 3),
('Sabonete Líquido Lavanda', 7.75, 'Natura', NULL, 2);

SELECT * FROM tb_produtos
WHERE preco > 50.00;

SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 and 60.00;

SELECT * fROM tb_produtos
WHERE nome LIKE "%C%";

SELECT nome, preco, marca, data_validade, categoriaid, tb_categorias.*
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoriaid = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.categoria = 'Medicamentos';