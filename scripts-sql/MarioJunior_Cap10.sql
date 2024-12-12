CREATE DATABASE db_cap10MarioJunior;
USE db_cap10MarioJunior;

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

INSERT INTO tbAtor(nome_ator,idade,cidade_ator,salario_ator,sexo_ator)
VALUES ('Shauane Eliza',17,'Umarama',3000.3,'F');


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
INSERT INTO tbNovelaPersonagem (codigo_novela, codigo_personagem)
VALUES(3, 2);


INSERT INTO tbCapitulos ( nome_capitulo, data_exibicao_capitulo, codigo_novela)
VALUES('Capítulo 1', '2012-04-02', 1);

INSERT INTO tbCapitulos ( nome_capitulo, data_exibicao_capitulo, codigo_novela)
VALUES('Capítulo 50', '2018-03-01', 1);

INSERT INTO tbCapitulos ( nome_capitulo, data_exibicao_capitulo, codigo_novela)
VALUES( 'Capítulo Final', '2023-12-31', 1);

-- QUESTÃO 3
SELECT tbAtor.nome_ator
FROM tbAtor
WHERE tbAtor.codigo_ator NOT IN (SELECT tbAtor.codigo_ator
FROM tbAtor INNER JOIN tbPersonagem ON tbAtor.codigo_ator = tbPersonagem.codigo_ator
			INNER JOIN tbNovelaPersonagem ON tbPersonagem.codigo_personagem = tbNovelaPersonagem.codigo_personagem);
            
        
    -- QUESTÃO 4
    SELECT tbAtor.nome_ator,tbAtor.idade
    FROM tbAtor
    WHERE tbAtor.codigo_ator IN (SELECT tbPersonagem.codigo_ator
								 FROM tbPersonagem INNER JOIN tbNovelaPersonagem ON tbPersonagem.codigo_personagem = tbNovelaPersonagem.codigo_personagem
												   INNER JOIN tbNovela ON tbNovelaPersonagem.codigo_novela = tbNovela.codigo_novela
								 WHERE tbNovela.nome_novela = 'Como amar uma mulher');
    
    -- Mais rapido   
SELECT tbAtor.nome_ator,tbAtor.idade
FROM tbAtor INNER JOIN tbPersonagem ON tbAtor.codigo_ator = tbPersonagem.codigo_ator
			INNER JOIN tbNovelaPersonagem ON tbPersonagem.codigo_personagem = tbNovelaPersonagem.codigo_personagem
            INNER JOIN tbNovela ON tbNovelaPersonagem.codigo_novela = tbNovela.codigo_novela
            WHERE tbNovela.nome_novela = 'Como amar uma mulher';


-- QUESTÃO 5 
SELECT tbAtor.nome_ator
FROM tbAtor INNER JOIN tbPersonagem 
ON tbAtor.codigo_ator = tbPersonagem.codigo_ator
WHERE tbPersonagem.nome_personagem= 'Frida';


-- QUESTÃO 6 

 SELECT tbAtor.nome_ator
 FROM tbAtor INNER JOIN tbPersonagem
 ON tbAtor.codigo_ator= tbPersonagem.codigo_ator
 INNER JOIN tbNovelaPersonagem
 ON tbNovelaPersonagem.codigo_personagem= tbPersonagem.codigo_personagem
 WHERE tbNovelaPersonagem.codigo_novela IN (SELECT tbNovelaPersonagem.codigo_novela
							FROM tbPersonagem INNER JOIN tbNovelaPersonagem
							ON tbPersonagem.codigo_personagem = tbNovelaPersonagem.codigo_novela
                            INNER JOIN tbAtor ON tbAtor.codigo_ator = tbPersonagem.codigo_ator
                            WHERE tbAtor.nome_ator = 'Frida'
                            
 );
 
 
 -- QUESTÃO 7
SELECT tbAtor.nome_ator
 FROM tbAtor INNER JOIN tbPersonagem
 ON tbAtor.codigo_ator= tbPersonagem.codigo_ator
 INNER JOIN tbNovelaPersonagem
 ON tbNovelaPersonagem.codigo_personagem= tbPersonagem.codigo_personagem
 WHERE tbNovelaPersonagem.codigo_novela NOT IN (SELECT tbNovelaPersonagem.codigo_novela
							FROM tbPersonagem INNER JOIN tbNovelaPersonagem
							ON tbPersonagem.codigo_personagem = tbNovelaPersonagem.codigo_novela
                            INNER JOIN tbAtor ON tbAtor.codigo_ator = tbPersonagem.codigo_ator
                            WHERE tbAtor.nome_ator = 'Frida');
                            
                            
                            
                            
  -- QUESTÃO 8 
  SELECT MIN(tbPersonagem.idade_personagem)
  FROM tbPersonagem;
  
  -- QUESTÃO 9

  SELECT MAX(tbPersonagem.idade_personagem)
  FROM tbPersonagem;
  
  -- QUESTÃO 10 
  SELECT tbAtor.nome_ator
  FROM tbAtor INNER JOIN tbPersonagem
  ON tbAtor.codigo_ator = tbPersonagem.codigo_ator
  WHERE tbPersonagem.situacao_financeira_personagem!='Pobre';
  
  
  -- QUESTÃO 11
  SELECT tbAtor.nome_ator
  FROM tbAtor INNER JOIN tbPersonagem
  ON tbAtor.codigo_ator = tbPersonagem.codigo_personagem
  INNER JOIN tbNovelaPersonagem 
  ON tbNovelaPersonagem.codigo_personagem= tbPersonagem.codigo_personagem
  GROUP BY tbAtor.codigo_ator HAVING tbAtor.codigo_ator = SOME (SELECT tbNovela.codigo_novela
																FROM tbNovela 
													            WHERE tbNovela.horario_exibicao= '20:00');
  
 
 