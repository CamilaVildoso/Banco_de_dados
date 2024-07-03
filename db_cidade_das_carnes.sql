CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
categoria VARCHAR(100) NOT NULL,
descricao TEXT,
PRIMARY KEY (ID)
);

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(100) not null,
preco decimal (6, 2) not null,
dataValidade DATE,
imagem VARCHAR(255),
categoriaid BIGINT,
PRIMARY KEY (ID),
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (categoria, descricao)
VALUES ("Carnes Bovinas", 'Diversos cortes de carne bovina de alta qualidade'),
("Carnes Suínas", 'Produtos derivados de carne suína fresca'),
("Carnes de Aves", 'Seleção de aves frescas e cortes variados'),
("Peixes e Frutos do Mar", 'Diversidade de peixes frescos e frutos do mar'),
('Embutidos', 'Produtos com carnes ou outros tecidos animais comestíveis');

INSERT INTO tb_produtos (nome, preco, dataValidade, imagem, categoriaid) 
VALUES('Picanha', 45.00,  '2024-07-01', 'url_imagem_picanha', 1),
    ('Costela de Porco', 30.00, '2024-07-12', 'url_imagem_costela_porco', 2),
    ('Peito de Frango', 19.00,  '2024-07-08', 'url_imagem_peito_frango', 3),
    ('Salmão Fresco', 39.90,  '2024-07-07', 'url_imagem_salmao', 4),
    ('Linguiça Calabresa', 14.00,  '2024-07-15', 'url_imagem_calabresa', 5),
    ('Bacon Defumado', 8.50,  '2024-07-25', 'url_imagem_bacon', 5),
    ('Iscas de Tilápia', 26.99,  '2024-07-07', 'url_imagem_tilápia', 4),
    ('peito inteiro', 32.00, '2024-07-08', 'url_imagem_frango', 3);
    
UPDATE tb_produtos SET preco = 60.00 WHERE Id = 1;
UPDATE tb_produtos SET preco = 55.00 WHERE Id = 2;

SELECT * FROM tb_produtos
WHERE preco > 50.00;

SELECT * FROM tb_produtos
WHERE preco BETWEEN 50.00 and 150.00;

SELECT * fROM tb_produtos
WHERE nome LIKE "%C%";

SELECT nome, preco, dataValidade, imagem, categoriaid, tb_categorias.*
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoriaid = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.categoria = 'Peixes e Frutos do Mar';