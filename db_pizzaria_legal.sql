CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
tipo_pizza VARCHAR(100) NOT NULL,
descricao TEXT,
PRIMARY KEY (ID)
);

CREATE TABLE tb_pizzas(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(100) not null,
preco decimal (6, 2) not null,
ingredientes VARCHAR (100) not null,
tamanho VARCHAR (100),
categoriaid BIGINT,
PRIMARY KEY (ID),
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (tipo_pizza, descricao)
VALUES ("Vegetariana", 'Pizzas feitas apenas com ingredientes vegetais'),
("Carnes", 'Pizzas feitas com diversos tipos de carne'),
("Queijos", 'Pizzas com uma variedade de queijos'),
('Doces', 'Pizzas com sabores doces e sobremesas'),
('Especiais', 'Pizzas gourmet com ingredientes especiais');

INSERT INTO tb_pizzas (nome, preco, ingredientes, tamanho, categoriaid) VALUES
    ('Margherita', 25.00, 'Molho de tomate, queijo mozzarella, manjericão fresco', 'Média', 1),
    ('Pepperoni', 28.00, 'Molho de tomate, queijo mozzarella, pepperoni', 'Grande', 2),
    ('Frango com Catupiry', 30.00, 'Molho de tomate, queijo mozzarella, frango desfiado, Catupiry', 'Grande', 2),
    ('Calabresa', 26.00, 'Molho de tomate, queijo mozzarella, calabresa fatiada, cebola', 'Média', 2),
    ('Quatro Queijos', 27.00, 'Molho de tomate, queijo mozzarella, queijo gorgonzola, queijo parmesão, queijo provolone', 'Grande', 3),
    ('Chocolate com Morango', 22.00, 'Chocolate ao leite, morangos frescos', 'Média', 4),
    ('Banana Caramelada', 24.00, 'Banana, doce de leite, açúcar mascavo', 'Grande', 4),
    ('Pizza do Chef', 32.00, 'Ingredientes variados escolhidos pelo chef', 'Grande', 5);

UPDATE tb_pizzas SET preco = 60.00 WHERE Id = 1;
UPDATE tb_pizzas SET preco = 80.00 WHERE Id = 2;
UPDATE tb_pizzas SET preco = 95.00 WHERE Id = 3;
UPDATE tb_pizzas SET preco = 90.00 WHERE Id = 4;
UPDATE tb_pizzas SET preco = 45.00 WHERE Id = 5;
UPDATE tb_pizzas SET preco = 50.00 WHERE Id = 6;
UPDATE tb_pizzas SET preco = 85.00 WHERE Id = 7;
UPDATE tb_pizzas SET preco = 120.00 WHERE Id = 8;

SELECT * FROM tb_pizzas
WHERE preco > 45.00;

SELECT * FROM tb_pizzas
WHERE preco BETWEEN 50.00 and 100.00;

SELECT * fROM tb_pizzas
WHERE nome LIKE "M%";

SELECT nome, preco, ingredientes, tamanho, categoriaid, tb_categorias.*
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoriaid = tb_categorias.id;

SELECT tb_pizzas.*, tb_categorias.tipo_pizza
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.tipo_pizza = 'Doces';

