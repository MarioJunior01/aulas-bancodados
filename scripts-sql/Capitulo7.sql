CREATE DATABASE db_capitulo7;
USE db_capitulo7;
CREATE TABLE tbGerente (
cod_gerente INT,
nome_gerente VARCHAR (100) NOT NULL,
CONSTRAINT pk_tbGerente PRIMARY KEY (cod_gerente)
);
CREATE TABLE tbCompanhia(
cod_companhia INT,
nome_companhia VARCHAR (100) NOT NULL,
cidade_companhia VARCHAR (100) NOT NULL,
CONSTRAINT pk_tbCompanhia PRIMARY KEY (cod_companhia)
);
CREATE TABLE tbEmpregado(
cod_empregado INT,
cod_gerente INT,
nome_empregado VARCHAR (100)NOT NULL,
rua_empregado VARCHAR (100) NOT NULL,
cidade_empregado VARCHAR (100) NOT NULL,
fone_empregado INT NOT NULL,
CONSTRAINT pk_tbEmpregado PRIMARY KEY (cod_empregado),
CONSTRAINT fk_tbEmpregado_tbGerente FOREIGN KEY tbEmpregado (cod_gerente) 
						REFERENCES tbGerente (cod_gerente)
);
CREATE TABLE tbTrabalha(
cod_empregado INT ,
cod_companhia INT ,
salario DOUBLE NOT NULL,
CONSTRAINT pk_tbTrabalha PRIMARY KEY (cod_empregado,cod_companhia),
CONSTRAINT fk_tbTrabalha_tbEmpregado FOREIGN KEY tbTrabalha (cod_companhia) 
                                      REFERENCES tbEmpregado (cod_empregado)       
);

CREATE UNIQUE INDEX idx_tbEmpregado
ON tbEmpregado (nome_empregado);

CREATE UNIQUE INDEX idx_tbCompanhia 
ON tbCompanhia (nome_companhia);

ALTER TABLE tbGerente 
ADD numero_telefone INT;

ALTER TABLE tbEmpregado
DROP  FOREIGN KEY fk_tbEmpregado_tbGerente;

ALTER TABLE tbEmpregado
DROP cod_gerente;

DROP TABLE tbGerente;

