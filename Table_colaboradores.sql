CREATE DATABASE db_colaboradores;

USE db_colaboradores;

CREATE TABLE tb_colaboradores(
id BIGINT auto_increment,
nome varchar(100) not null,
cargo varchar(50),
departamento varchar(50),
salario decimal (10,2),
data_admissao date,
primary key (id)
);

INSERT INTO tb_colaboradores (nome, cargo, departamento, salario, data_admissao)
VALUES ("Camila", "estagio", "comercial", 900.00, "2024-10-01"),
("Daniela", "gerente", "comercial", 18000.00, "2020-09-30"),
("Thais", "analista", "comercial", 2000.00, "2023-05-04"),
("Samuel", "analista", "financiero", 2500.00, "2019-04-10"),
("Sofia", "assistente", "financiero", 1500.00, "2024-09-10");

SELECT * from tb_colaboradores;

SELECT * FROM tb_colaboradores
WHERE salario > 2000;

SELECT * FROM tb_colaboradores;

UPDATE tb_colaboradores SET salario = 2300.00 WHERE id = 8;

SELECT * FROM tb_colaboradores
WHERE id = 8;
