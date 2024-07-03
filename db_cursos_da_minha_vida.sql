CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
id BIGINT auto_increment,
categorias VARCHAR(100) not null,
descricao TEXT,
PRIMARY KEY (id)
);

CREATE TABLE tb_cursos(
id BIGINT auto_increment,
nome VARCHAR(100) not null,
preco DECIMAL(10, 2),
descricaoCurso TEXT,
nivel VARCHAR(50),
PRIMARY KEY(id),
categoriaid BIGINT,
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (categorias, descricao)
VALUES('Programação', 'Cursos de programação em diversas linguagens.'),
('Design Gráfico', 'Cursos de design gráfico e criação visual.'),
('Marketing Digital', 'Cursos de marketing digital e estratégias online.'),
('Idiomas', 'Cursos de idiomas como inglês, espanhol, etc.'),
('Desenvolvimento Pessoal', 'Cursos para desenvolvimento pessoal e profissional.');

INSERT INTO tb_cursos (nome, preco, descricaoCurso, nivel, categoriaid) 
VALUES('Curso de Python', 99.90, 'Aprenda Python do básico ao avançado.', 'Intermediário', 1),
('Curso de Photoshop', 79.90, 'Edição e manipulação de imagens com Photoshop.', 'Iniciante', 2),
('Curso de Marketing Digital', 149.90, 'Estratégias eficazes para marketing digital.', 'Avançado', 3),
('Curso de Inglês', 199.90, 'Aprenda inglês de forma prática e eficiente.', 'Iniciante', 4),
('Curso de Liderança', 129.90, 'Desenvolva habilidades de liderança.', 'Intermediário', 5),
('Curso de Espanhol', 199.90, 'Aprenda Espanhol de forma prática e eficiente.', 'Iniciante', 4),
('Curso de Java', 99.90, 'Aprenda Java do básico ao avançado.', 'Intermediário', 1);

SELECT * FROM tb_cursos
WHERE preco > 100.00;

SELECT * FROM tb_cursos
WHERE preco BETWEEN 70.00 and 150.00;

SELECT * fROM tb_cursos
WHERE nome LIKE "%J%";

SELECT tb_cursos.nome, preco, descricaoCurso, nivel, categoriaid, tb_categorias.*
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.categoriaid = tb_categorias.id;

SELECT tb_cursos.*, tb_categorias.categorias
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.categoriaid = tb_categorias.id
WHERE tb_categorias.categorias = 'Idiomas';