CREATE DATABASE test;

USE test;

CREATE TABLE Pessoas (
    idpessoas INT AUTO_INCREMENT,
    nome VARCHAR(100),
    documento VARCHAR(45),
    CEP VARCHAR(8),
    logradouro VARCHAR(100),
    numero INT,
    complemento VARCHAR(45),
    bairro VARCHAR(45),
    cidade VARCHAR(100),
    uf VARCHAR(2),
    dtregistro DATETIME,
    PRIMARY KEY (idpessoas)
);

CREATE TABLE login (
    idlogin INT AUTO_INCREMENT,
    usuario VARCHAR(45),
    senha VARCHAR(45),
    PRIMARY KEY (idlogin)
);

INSERT INTO login (usuario, senha) VALUES ('mabreu', '123');