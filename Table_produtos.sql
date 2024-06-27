USE db_colaboradores;

CREATE TABLE tb_produtos(
id BIGINT auto_increment,
nome VARCHAR(100),
preco DECIMAL(10, 2),
categoria VARCHAR(50),
quantidade int,
PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, preco, categoria, quantidade)
VALUES ("Notebook", 2500.00, "Eletrônicos", 100),
("camiseta", 30.00, "vestuário", 300),
("Relógio", 250.00, "Acessório", 1000),
("Tablet", 3550.00, "Eletrônicos", 400),
("Jaqueta", 450.00, "vestuário", 250),
("Bolsa Térmica", 50.00, "Acessório", 2000),
("Mouse Gamer", 150.00, "Eletrônicos", 1250),
("Sapato", 260.00, "vestuário", 40);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 500;

SELECT * FROM tb_produtos WHERE preco < 500;

UPDATE tb_produtos SET preco = 75.00 WHERE id = 6;

SELECT * FROM tb_produtos;


