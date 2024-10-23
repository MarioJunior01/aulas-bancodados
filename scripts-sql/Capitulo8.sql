CREATE DATABASE db_capitulo8;
USE db_capitulo8;

CREATE TABLE tbSala(
numero_sala INT ,
descricao_sala VARCHAR (20),
capacidade_sala INT,
CONSTRAINT pk_tbSala PRIMARY KEY  (numero_sala)
);
CREATE TABLE tbDiretor(
codigo_diretor INT ,
nome_diretor VARCHAR (20),
CONSTRAINT pk_tbDiretor PRIMARY KEY (codigo_diretor)
);

CREATE TABLE tbFilme (
codigo_filme INT,
codigo_diretor INT,
nome_filme VARCHAR (50) NOT NULL,
ano_lancamento INT,
categoria_filme VARCHAR (20) NOT NULL,

CONSTRAINT pk_tbFilme PRIMARY KEY tbFilme (codigo_filme),
CONSTRAINT fk_tbFilme_tbDiretor FOREIGN KEY tbFilme (codigo_diretor)
								REFERENCES tbDiretor (codigo_diretor)
);

CREATE TABLE tbSalaFilme (
numero_sala INT,
codigo_filme INT ,
data_filme DATE NOT NULL,
horario_filme TIME NOT NULL,

CONSTRAINT pk_tbSalaFilme PRIMARY KEY tbSalaFilme (numero_sala,codigo_filme,data_filme),
CONSTRAINT fk_tbSalaFilme_tbFilme FOREIGN KEY tbSalaFilme (codigo_filme) 
                                  REFERENCES tbFilme (codigo_filme),
CONSTRAINT fk_tbSalaFilme_tbSala FOREIGN KEY tbSalaFilme (numero_sala)
                                   REFERENCES tbSala (numero_sala)
);
CREATE TABLE tbPremio(
codigo_premio INT,
codigo_filme INT ,
nome_premio VARCHAR (20) NOT NULL,
ano_premiacao INT NOT NULL,
 CONSTRAINT pk_tbPremio PRIMARY KEY tbPremio (codigo_premio),
 CONSTRAINT fk_tbPremio_tbFilme FOREIGN KEY tbPremio (codigo_filme)
								REFERENCES tbFilme (codigo_filme)
);
INSERT INTO tbDiretor (codigo_diretor,nome_diretor)
VALUES (1,'Pedro Paulo Matos');

INSERT INTO tbDiretor (codigo_diretor,nome_diretor)
VALUES (2,'Claudio Romero');

INSERT INTO tbDiretor (codigo_diretor,nome_diretor)
VALUES (3,'Julio Melo');

INSERT INTO tbDiretor (codigo_diretor,nome_diretor)
VALUES (4,'Roberto Nascimento');

INSERT INTO tbDiretor (codigo_diretor,nome_diretor)
VALUES (5,'Matheus Silva');

INSERT INTO tbFilme(codigo_filme,codigo_diretor,nome_filme,categoria_filme,ano_lancamento)
VALUES (1,3,'As branquelas','terror',1980);

INSERT INTO tbFilme(codigo_filme,codigo_diretor,nome_filme,categoria_filme,ano_lancamento)
VALUES (2,4,'Coraline','drama',2000);

INSERT INTO tbFilme(codigo_filme,codigo_diretor,nome_filme,categoria_filme,ano_lancamento)
VALUES (3,3,'IT ','terror',2007);

INSERT INTO tbFilme(codigo_filme,codigo_diretor,nome_filme,categoria_filme,ano_lancamento)
VALUES (4,5,'Mario','Animação',2023);

INSERT INTO tbFilme(codigo_filme,codigo_diretor,nome_filme,categoria_filme,ano_lancamento)
VALUES (5,3,'Papai noel em ação','Romance',2020);

INSERT INTO tbSala (numero_sala,descricao_sala,capacidade_sala)
VALUES (10,'Sala vip',50);

INSERT INTO tbSala (numero_sala,descricao_sala,capacidade_sala)
VALUES (11,'Sala Executiva',60);

INSERT INTO tbSala (numero_sala,descricao_sala,capacidade_sala)
VALUES (12,'Sala Executiva',60);

INSERT INTO tbSala (numero_sala,descricao_sala,capacidade_sala)
VALUES (13,'Sala Executiva',60);

INSERT INTO tbSala (numero_sala,descricao_sala,capacidade_sala)
VALUES (14,'Sala Executiva',60);

INSERT INTO tbSala (numero_sala,descricao_sala,capacidade_sala)
VALUES (15,'Sala Vip',40);


INSERT INTO tbSalaFilme (numero_sala,codigo_filme,data_filme,horario_filme)
VALUES(15,4,'2020-10-2','12:00');

INSERT INTO tbSalaFilme (numero_sala,codigo_filme,data_filme,horario_filme)
VALUES(11,2,'2021-11-3','16:00');

INSERT INTO tbSalaFilme (numero_sala,codigo_filme,data_filme,horario_filme)
VALUES(12,1,'2024-12-7','18:00');

INSERT INTO tbSalaFilme (numero_sala,codigo_filme,data_filme,horario_filme)
VALUES(10,4,'2021-09-3','19:00');

INSERT INTO tbSalaFilme (numero_sala,codigo_filme,data_filme,horario_filme)
VALUES(15,2,'2022-09-3','18:00');


INSERT INTO tbPremio(codigo_premio,codigo_filme,nome_premio,ano_premiacao)
VALUES (1,4,'Oscar',2000);

INSERT INTO tbPremio(codigo_premio,codigo_filme,nome_premio,ano_premiacao)
VALUES (2,3,'Filme do ano ',2020);

INSERT INTO tbPremio(codigo_premio,codigo_filme,nome_premio,ano_premiacao)
VALUES (3,5,'Melhor animacao',2030);

INSERT INTO tbPremio(codigo_premio,codigo_filme,nome_premio,ano_premiacao)
VALUES (4,2,'Filme do ano',2026);

INSERT INTO tbPremio(codigo_premio,codigo_filme,nome_premio,ano_premiacao)
VALUES (5,1,'Nobel',2060);

SELECT *
FROM tbDiretor;

SELECT tbFilme.nome_filme
FROM tbFilme 
WHERE tbFilme.categoria_filme = 'terror';

UPDATE tbSala
SET capacidade_sala = 200
WHERE numero_sala =10;

UPDATE tbSalaFilme
SET numero_sala = 12
WHERE numero_sala =10 AND data_filme ='2021-09-03';


DELETE  FROM tbPremio 
WHERE tbPremio.codigo_filme IN  (SELECT  tbFilme.codigo_filme
							FROM tbFilme INNER JOIN tbDiretor ON tbFilme.codigo_diretor = tbDiretor.codigo_diretor
                            WHERE tbDiretor.nome_diretor = 'Pedro Paulo Matos');
                            
DELETE FROM tbSalaFilme 
 WHERE tbSalaFilme.codigo_filme IN (SELECT tbFilme.codigo_filme
									FROM tbFilme INNER JOIN tbDiretor ON tbFilme.codigo_diretor = tbDiretor.codigo_diretor
                                    WHERE tbDiretor.nome_diretor = 'Pedro Paulo Mato');

DELETE FROM tbFilme
WHERE codigo_diretor  IN (SELECT tbDiretor.codigo_diretor 
                           FROM tbDiretor 
                            WHERE tbDiretor.nome_diretor = 'Pedro Paulo Matos');
DELETE FROM tbDiretor
WHERE nome_diretor = 'Pedro Paulo Matos';
                            
   SELECT *
   FROM tbFilme
   WHERE codigo_diretor IN (SELECT tbDiretor.codigo_diretor
							FROM tbDiretor
                            WHERE tbDiretor.nome_diretor = 'Roberto Nascimento');



