CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
id BIGINT auto_increment,
nome VARCHAR(100) not null,
descricao VARCHAR(255),
PRIMARY KEY (id)
);

CREATE TABLE tb_produtos(
id BIGINT auto_increment,
nome VARCHAR(100) not null,
preco DECIMAL(10, 2),
descricao VARCHAR(50),
estoque INT,
PRIMARY KEY(id),
categoriaid BIGINT,
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id)
);

ALTER TABLE tb_produtos MODIFY descricao TEXT;


INSERT INTO tb_categorias (nome, descricao)
VALUES('Ferramentas', 'Produtos relacionados a ferramentas para construção.'),
('Materiais Elétricos', 'Produtos elétricos para instalações em construções.'),
('Pisos e Revestimentos', 'Diversos tipos de pisos e revestimentos.'),
('Ferragens', 'Itens como dobradiças, fechaduras, e acessórios de metal.'),
('Tintas', 'Tintas e produtos relacionados para pintura de construções.');

INSERT INTO tb_produtos (nome, preco, descricao, estoque, categoriaid) 
VALUES('Martelo de Borracha', 25.90, 'Martelo com cabeça de borracha resistente.', 100, 1),
('Fio Elétrico 2.5mm²', 1.80, 'Rolo com 100 metros de fio elétrico.', 50, 2),
('Porcelanato Bege', 45.00, 'Porcelanato de alta resistência e qualidade.', 500, 3),
('Dobradiça de Aço', 7.50, 'Dobradiça para portas de aço com acabamento polido.', 1000, 4),
('Tinta Acrílica Branca', 32.00, 'Lata de 3.6 litros de tinta acrílica lavável.', 1500, 5),
('Serra Circular Makita', 380.00, 'Serra circular profissional com motor potente.', 80, 1),
('Interruptor Simples', 3.50, 'Interruptor simples para instalações elétricas.', 1020, 2),
('Argamassa Flexível', 18.90, 'Sacola de 20kg de argamassa para pisos.', 80, 3);

SELECT * FROM tb_produtos
WHERE preco > 100.00;

SELECT * FROM tb_produtos
WHERE preco BETWEEN 70.00 and 150.00;

SELECT * FROM tb_produtos
WHERE preco BETWEEN 20.00 and 70.00;

SELECT * fROM tb_produtos
WHERE nome LIKE "%C%";

SELECT tb_produtos.nome, preco, tb_produtos.descricao, estoque, categoriaid, tb_categorias.*
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoriaid = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.nome = 'Pisos e Revestimentos';
