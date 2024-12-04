CREATE DATABASE db_cap9MarioJunior;
USE db_cap9MarioJunior;

CREATE TABLE tbNovela (
    codigo_novela INT AUTO_INCREMENT,  
    nome_novela VARCHAR(30) NOT NULL,
    data_primeiro_capitulo DATE NOT NULL,
    data_ultimo_capitulo DATE NOT NULL,
    horario_exibicao TIME ,
    CONSTRAINT pk_tbNovela PRIMARY KEY(codigo_novela)
);

CREATE TABLE tbAtor (
    codigo_ator INT AUTO_INCREMENT, 
    nome_ator VARCHAR(20) NOT NULL ,
    idade INT NOT NULL,
    cidade_ator VARCHAR(20),
    salario_ator REAL,
    sexo_ator VARCHAR(1),
    CONSTRAINT pk_tbAtor PRIMARY KEY(codigo_ator)
);

CREATE TABLE tbPersonagem (
    codigo_personagem INT AUTO_INCREMENT, 
    nome_personagem VARCHAR(50) NOT NULL,
    idade_personagem INT NOT NULL,
    situacao_financeira_personagem VARCHAR(20),
    codigo_ator INT,
    CONSTRAINT pk_tbPersonagem PRIMARY KEY(codigo_personagem),
    CONSTRAINT fk_tbPersonagemtbAtor FOREIGN KEY (codigo_ator) REFERENCES tbAtor (codigo_ator)
);

CREATE TABLE tbNovelaPersonagem (
    codigo_novela INT, 
    codigo_personagem INT,  
    CONSTRAINT pk_tbNovelaPersonagem PRIMARY KEY (codigo_novela, codigo_personagem), 
    CONSTRAINT fk_tbNovelaPersonagemtbNovela FOREIGN KEY (codigo_novela) REFERENCES tbNovela (codigo_novela),
    CONSTRAINT fk_tbNovelaPersonagemtbPersonagem FOREIGN KEY (codigo_personagem) REFERENCES tbPersonagem (codigo_personagem)
);

CREATE TABLE tbCapitulos (
    codigo_capitulo INT AUTO_INCREMENT,
    codigo_novela INT, 
    nome_capitulo VARCHAR(50) NOT NULL,
    data_exibicao_capitulo DATE NOT NULL,
    CONSTRAINT pk_tbCapitulos PRIMARY KEY (codigo_capitulo), 
    CONSTRAINT fk_capitulotbNovela FOREIGN KEY (codigo_novela) REFERENCES tbNovela (codigo_novela)
);

CREATE TABLE tbPersonagemAtor (
    codigo_personagem INT,  
    codigo_ator INT,  
    CONSTRAINT pk_tbPersonagemAtor PRIMARY KEY (codigo_personagem, codigo_ator), 
    CONSTRAINT fk_tbPersonagemAtortbPersonagem FOREIGN KEY (codigo_personagem) REFERENCES tbPersonagem (codigo_personagem),
    CONSTRAINT fk_tbPersonagemAtortbAtor FOREIGN KEY (codigo_ator) REFERENCES tbAtor (codigo_ator)
);

--  QUESTÃO 2
INSERT INTO tbNovela ( nome_novela, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ( 'Como amar uma mulher', '2000-04-10', '2010-06-06', '20:00');

INSERT INTO tbNovela ( nome_novela, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Mistérios de uma Vida', '2015-10-21', '2019-10-22','21:30');

INSERT INTO tbNovela ( nome_novela, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Como me sinto sem voce', '1980-03-04', '1990-11-30', '22:00');


INSERT INTO tbAtor ( nome_ator, idade, cidade_ator, salario_ator, sexo_ator)
VALUES ( 'Ronaldo Romero', 40, 'Recife', 100000.00, 'M');

INSERT INTO tbAtor ( nome_ator, idade, cidade_ator, salario_ator, sexo_ator)
VALUES ( 'Julia Santos', 32, 'São Paulo', 12000.00, 'F');

INSERT INTO tbAtor ( nome_ator, idade, cidade_ator, salario_ator, sexo_ator)
VALUES ( 'Leonardo Di Capril', 78, 'Belém', 9000.00, 'M');


INSERT INTO tbPersonagem ( nome_personagem, idade_personagem, situacao_financeira_personagem, codigo_ator)
VALUES ('Frida', 62, 'Pobre', 2);

INSERT INTO tbPersonagem ( nome_personagem, idade_personagem, situacao_financeira_personagem, codigo_ator)
VALUES ('Clovis', 50, 'Média', 1);

INSERT INTO tbPersonagem ( nome_personagem, idade_personagem, situacao_financeira_personagem, codigo_ator)
VALUES( 'Silvano Pereira', 90, 'Pobre', 3);


INSERT INTO tbNovelaPersonagem (codigo_novela, codigo_personagem)
VALUES (1, 1);
INSERT INTO tbNovelaPersonagem (codigo_novela, codigo_personagem)
VALUES(1, 2);
INSERT INTO tbNovelaPersonagem (codigo_novela, codigo_personagem)
VALUES(2, 3);


INSERT INTO tbCapitulos ( nome_capitulo, data_exibicao_capitulo, codigo_novela)
VALUES('Capítulo 1', '2012-04-02', 1);

INSERT INTO tbCapitulos ( nome_capitulo, data_exibicao_capitulo, codigo_novela)
VALUES('Capítulo 50', '2018-03-01', 1);

INSERT INTO tbCapitulos ( nome_capitulo, data_exibicao_capitulo, codigo_novela)
VALUES( 'Capítulo Final', '2023-12-31', 1);

-- QUESTAO 3
SELECT tbNovela.data_ultimo_capitulo
FROM tbNovela
WHERE nome_novela = 'Mistérios de uma Vida';

--  QUESTÃO 4
SELECT tbNovela.nome_novela
FROM tbNovela
WHERE horario_exibicao IS NULL;

-- QUESTÃO 5
SELECT tbAtor.nome_ator
FROM tbAtor
WHERE cidade_ator LIKE 'M%';

-- QUESTÃO 6
SELECT COUNT(*) AS quantidade_novelas
FROM tbNovela
WHERE nome_novela LIKE '%vida%';

-- QUESTÃO  7
SELECT COUNT(N.codigo_novela) AS quantidade_novelas
FROM tbNovelaPersonagem N
INNER JOIN tbPersonagem AS P ON N.codigo_personagem = P.codigo_personagem
INNER JOIN tbAtor AS A ON P.codigo_ator = A.codigo_ator
WHERE A.nome_ator = 'Fernando Souza';

-- QUESTÃO  8
SELECT tbPersonagem.*
FROM tbPersonagem
ORDER BY nome_personagem ASC;

-- QUESTAO 9
SELECT tbPersonagem.*
FROM tbPersonagem
ORDER BY idade_personagem DESC;

-- QUESTÃO 10
SELECT COUNT(*) AS quantidade_atores
FROM tbAtor;

-- QUESTÃO  11
SELECT COUNT(*) AS quantidade_novelas
FROM tbNovela;

-- QUESTÃO 12
SELECT n.nome_novela, COUNT(c.codigo_capitulo) AS quantidade_capitulos
FROM tbNovela n
INNER JOIN tbCapitulos c ON n.codigo_novela = c.codigo_novela
GROUP BY n.codigo_novela, n.nome_novela;

-- QUESTÃO 13
SELECT COUNT(*) AS quantidade_atores_femininos
FROM tbAtor
WHERE sexo_ator = 'F';

-- QUESTÃO 14
SELECT AVG(idade_personagem) AS idade_media
FROM tbPersonagem;

-- QUESTÃO 15
SELECT COUNT(*) AS quantidade_personagens
FROM tbPersonagem
WHERE idade_personagem < 15;

-- QUESTÃO 16
SELECT DISTINCT a.nome_ator
FROM tbAtor a
INNER JOIN tbPersonagem p ON a.codigo_ator = p.codigo_ator
WHERE a.idade = p.idade_personagem;

-- QUESTÃO 17
SELECT MAX(salario_ator) AS maior_salario
FROM tbAtor;

-- QUESTÃO 18
SELECT MIN(salario_ator) AS menor_salario
FROM tbAtor;

-- QUESTÃO 19
SELECT SUM(salario_ator) AS total_salarios
FROM tbAtor;

-- QUESTÃO 20
SELECT a.nome_ator, COUNT(p.codigo_personagem) AS quantidade_personagens
FROM tbAtor a
INNER JOIN tbPersonagem p ON a.codigo_ator = p.codigo_ator
GROUP BY a.codigo_ator, a.nome_ator;

-- QUESTÃO 21
SELECT n.nome_novela
FROM tbNovela n
INNER JOIN tbCapitulos c ON n.codigo_novela = c.codigo_novela
GROUP BY n.codigo_novela, n.nome_novela
HAVING COUNT(c.codigo_capitulo) > 40;

-- QUESTÃO 22
SELECT a.nome_ator
FROM tbAtor a
INNER JOIN tbPersonagem p ON a.codigo_ator = p.codigo_ator
INNER JOIN tbNovelaPersonagem np ON p.codigo_personagem = np.codigo_personagem
WHERE p.situacao_financeira_personagem = 'Rica'
GROUP BY a.codigo_ator, a.nome_ator
HAVING COUNT(DISTINCT np.codigo_novela) > 15;
