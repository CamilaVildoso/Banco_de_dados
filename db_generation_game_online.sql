CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
id BIGINT auto_increment,
nomeDaClasse VARCHAR(100) not null,
armasPreferidas VARCHAR(255),
PRIMARY KEY (id)
);

CREATE TABLE tb_personagens(
id BIGINT auto_increment,
nome VARCHAR(100) not null,
nivel INT not null,
habilidade VARCHAR(255),
pontosDeVida int not null,
PRIMARY KEY(id)
);

ALTER TABLE tb_classes ADD personagensid BIGINT;

ALTER TABLE tb_classes ADD CONSTRAINT fk_classes_personagens
FOREIGN KEY (personagensid) REFERENCES tb_personagens (id);

SELECT * FROM tb_classes;

ALTER TABLE tb_classes DROP FOREIGN KEY fk_classes_personagens;

ALTER TABLE tb_classes DROP COLUMN personagensid;

ALTER TABLE tb_personagens ADD COLUMN classe_id BIGINT;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (classe_id) REFERENCES tb_classes(id);

SELECT * FROM tb_classes;

SELECT * FROM tb_personagens;

INSERT INTO tb_classes (nomeDaClasse, armasPreferidas)
VALUES ('Guerreiro', 'Espada, Machado'),
       ('Mago', 'Cajado, Livro de Feitiços'),
       ('Arqueiro', 'Arco, Flecha'),
       ('Ladino', 'Adagas, Arco Curto'),
       ('Clérigo', 'Mace, Cajado Sagrado');
       
INSERT INTO tb_personagens (nome, nivel, habilidade, pontosDeVida, classe_id)
VALUES ('Aragorn', 10, 'Golpe Duplo', 100, 1),
       ('Gandalf', 20, 'Bola de Fogo', 80, 2),
       ('Legolas', 15, 'Tiro Preciso', 90, 3),
       ('Frodo', 5, 'Furtividade', 60, 4),
       ('Boromir', 12, 'Defesa Valente', 110, 1),
       ('Saruman', 18, 'Relâmpago', 85, 2),
       ('Tauriel', 14, 'Flecha Veloz', 95, 3),
       ('Elrond', 22, 'Cura Divina', 120, 5);

SELECT * FROM tb_personagens;

ALTER TABLE tb_personagens ADD ataque VARCHAR(255);
ALTER TABLE tb_personagens ADD defesa VARCHAR(255);

ALTER TABLE tb_personagens MODIFY ataque INT;
ALTER TABLE tb_personagens MODIFY defesa INT;

UPDATE tb_personagens SET ataque = 4500 WHERE Id = 1;
UPDATE tb_personagens SET ataque = 4000 WHERE Id = 2;
UPDATE tb_personagens SET ataque = 1000 WHERE Id = 3;
UPDATE tb_personagens SET ataque = 1300 WHERE Id = 4;
UPDATE tb_personagens SET ataque = 800 WHERE Id = 5;
UPDATE tb_personagens SET ataque = 1700 WHERE Id = 6;
UPDATE tb_personagens SET ataque = 1800 WHERE Id = 7;
UPDATE tb_personagens SET ataque = 1500 WHERE Id = 8;

SELECT * FROM tb_personagens;

UPDATE tb_personagens SET defesa = 2000 WHERE Id = 1;
UPDATE tb_personagens SET defesa = 1000 WHERE Id = 2;
UPDATE tb_personagens SET defesa = 2500 WHERE Id = 3;
UPDATE tb_personagens SET defesa = 3000 WHERE Id = 4;
UPDATE tb_personagens SET defesa = 4500 WHERE Id = 5;
UPDATE tb_personagens SET defesa = 1800 WHERE Id = 6;
UPDATE tb_personagens SET defesa = 1900 WHERE Id = 7;
UPDATE tb_personagens SET defesa = 5500 WHERE Id = 8;

SELECT * FROM tb_personagens;

SELECT * FROM tb_personagens WHERE ataque < 2000;

SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 and 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

SELECT * FROM tb_personagens WHERE nome LIKE "E%";

SELECT p.nome AS nome_personagem, p.nivel, p.habilidade, p.pontosDeVida,
       c.nomeDaClasse AS classe_personagem, c.armasPreferidas
FROM tb_personagens p INNER JOIN tb_classes c 
ON p.classe_id = c.id;

SELECT nome, nivel, habilidade, pontosDeVida, tb_classes.nomeDaClasse
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id;

SELECT tb_personagens.* FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.nomeDaClasse = 'Guerreiro';


