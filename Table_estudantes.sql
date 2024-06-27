USE db_colaboradores;

CREATE TABLE tb_estudantes (
id BIGINT auto_increment,
nome VARCHAR(100), 
idade INT,
curso VARCHAR(50),
nota DECIMAL(3,1),
PRIMARY KEY (id)
);

INSERT INTO tb_estudantes (nome, idade, curso, nota)
VALUES('João Silva', 18, 'Matemática', 8.5),
    ('Camila Oliveira', 17, 'História', 6.2),
    ('Pedro Santos', 19, 'Física', 7.8),
    ('Wendy Souza', 20, 'Química', 6.9),
    ('Thiago Almeida', 18, 'Geografia', 9.2),
    ('Isabelly Costa', 17, 'Biologia', 5.5),
    ('Edivaldo Pereira', 19, 'Artes', 7.1),
    ('Mariana Fernandes', 18, 'Literatura', 8.0);

SELECT * FROM tb_estudantes WHERE nota > 7.0;

SELECT * FROM tb_estudantes WHERE nota <= 7.0;

UPDATE tb_estudantes SET nota = 7.0 WHERE id = 6;

SELECT * FROM tb_estudantes;




