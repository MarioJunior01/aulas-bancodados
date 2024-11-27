
CREATE DATABASE bdEmpregadoMarioJunior;
USE bdEmpregadoMarioJunior;
 -- DROP DATABASE bdempregadomariojunior;

-- QUESTÃO 1 E 2
CREATE TABLE tbProjeto(
nome_projeto VARCHAR (100) NOT NULL,
numero_projeto INT ,
localizacao_projeto VARCHAR (100),
CONSTRAINT pk_tbProjeto PRIMARY KEY (numero_projeto)
);

CREATE TABLE tbEmpregado (
nome_emp VARCHAR (100) NOT NULL ,
RG_emp BIGINT,
CPF_emp BIGINT NOT NULL,
salario_emp DOUBLE ,
CONSTRAINT pk_tbEmpregado PRIMARY KEY tbEmpreagdo (RG_emp)
);

CREATE TABLE tbDepartamento (
nome_depto VARCHAR (200) , 
numero_depto INT ,
rgGerente_depto BIGINT,
CONSTRAINT pk_tbDepartamento PRIMARY KEY (numero_depto),
CONSTRAINT fk_tbDepartamento_tbEmpregado FOREIGN KEY tbDepartamento (rgGerente_depto) REFERENCES tbEmpregado(RG_emp) 
 ); 
 ALTER TABLE tbEmpregado 
ADD num_depto_emp INT;
  
 ALTER TABLE tbEmpregado 
ADD CONSTRAINT fk_tbEmpregado_tbDepartamento 
FOREIGN KEY (num_depto_emp) REFERENCES tbDepartamento (numero_depto);

  CREATE TABLE tbDependentes (
  rgResponsavel_dep  BIGINT ,
  nome_dep VARCHAR (100),
  dataNascimento_dep DATE NOT NULL,
  genero_dep VARCHAR (60) NOT NULL,
  
  CONSTRAINT pk_tbDependetes PRIMARY KEY (rgResponsavel_dep,nome_dep),
  CONSTRAINT fk_tbEmpregado_tbDependetes FOREIGN KEY tbDepentes(rgResponsavel_dep) REFERENCES tbEmpregado(RG_emp)
  );
  
  CREATE TABLE tbDepartamentoProjeto(
  numero_depto INT ,
  numero_projeto INT ,
  
  CONSTRAINT pk_tbDepartamentoProjeto PRIMARY KEY (numero_depto,numero_projeto),
  CONSTRAINT fk_tbDepartamento_tbProjeto FOREIGN KEY tbDeparatamentoProjeto(numero_projeto) REFERENCES tbProjeto(numero_projeto),
  CONSTRAINT fk_tbDepartamento_tbDepartamento FOREIGN KEY tbDepartamentoProjeto (numero_depto) REFERENCES tbDepartamento (numero_depto)
  );
  
  CREATE TABLE tbEmpregadoProjeto (
  rg_emp  BIGINT ,
  numero_projeto INT,
  horas_proj INT,
  
  CONSTRAINT pk_tbEmpregadoProjeto PRIMARY KEY (rg_emp,numero_projeto),
  CONSTRAINT fk_tbEmpregadoProjeto_tbEmpregado FOREIGN KEY tbEmpregadoProjeto (rg_emp)REFERENCES tbEmpregado(RG_emp),
  CONSTRAINT fk_tbEmpregadoProjeto_tbProjeto FOREIGN KEY tbProjeto(numero_projeto) REFERENCES tbProjeto (numero_projeto) 
  );

-- QUESTÃO 3 
INSERT INTO tbProjeto(nome_projeto,numero_projeto,localizacao_projeto)
VALUES('Romero brito',1,'CURITIBA-PR');

INSERT INTO tbProjeto(nome_projeto,numero_projeto,localizacao_projeto)
VALUES('Romário',2,'RIO DE JANEIRO-RJ');

INSERT INTO tbProjeto(nome_projeto,numero_projeto,localizacao_projeto)
VALUES('Paulo Vargas',3,'CURITIBA-PR');

INSERT INTO tbProjeto(nome_projeto,numero_projeto,localizacao_projeto)
VALUES('Joel Pereira',4,'PONTA GROSSA-PR');

INSERT INTO tbProjeto(nome_projeto,numero_projeto,localizacao_projeto)
VALUES('Julio Hugo',5,'SÃO PAULO-SP');

INSERT INTO tbDepartamento (nome_depto,numero_depto,rgGerente_depto)
VALUES ('Limpeza',10,null);

INSERT INTO tbDepartamento (nome_depto,numero_depto,rgGerente_depto)
VALUES ('Projeto',11,null);

INSERT INTO tbDepartamento (nome_depto,numero_depto,rgGerente_depto)
VALUES ('Desenvolvimento',12,null);

INSERT INTO tbDepartamento (nome_depto,numero_depto,rgGerente_depto)
VALUES ('Designer',13,null);

INSERT INTO tbDepartamento (nome_depto,numero_depto,rgGerente_depto)
VALUES ('RH',14,null);

INSERT INTO tbEmpregado (nome_emp,RG_emp,CPF_emp,num_depto_emp,salario_emp )
VALUES('Cristiano Lima',12456,73124312,12,1800);

INSERT INTO tbEmpregado (nome_emp,RG_emp,CPF_emp,num_depto_emp,salario_emp )
VALUES('Rivaldo Carvalho',12457,7213456,11,1900);

INSERT INTO tbEmpregado (nome_emp,RG_emp,CPF_emp,num_depto_emp,salario_emp )
VALUES('Ronaldo Silva',12458,7312431321,10,2500);

INSERT INTO tbEmpregado (nome_emp,RG_emp,CPF_emp,num_depto_emp,salario_emp )
VALUES('Rogerio Pereira',12459,7313213,14,1500);

INSERT INTO tbEmpregado (nome_emp,RG_emp,CPF_emp,num_depto_emp,salario_emp )
VALUES('Joel Ferreira',12510,7312312,12,2340);

UPDATE tbDepartamento 
SET rgGerente_depto = 12457 
WHERE  numero_depto = 10;

UPDATE tbDepartamento 
SET rgGerente_depto = 12458 
WHERE  numero_depto = 11;

UPDATE tbDepartamento 
SET rgGerente_depto = 12459
WHERE  numero_depto = 14;

UPDATE tbDepartamento 
SET rgGerente_depto = 12456
WHERE  numero_depto = 12;

UPDATE tbDepartamento 
SET rgGerente_depto = 12510 
WHERE  numero_depto = 13;

INSERT INTO tbDepartamentoProjeto (numero_depto,numero_projeto) 
VALUES (13,2);

INSERT INTO tbDepartamentoProjeto (numero_depto,numero_projeto) 
VALUES (12,4);

INSERT INTO tbDepartamentoProjeto (numero_depto,numero_projeto) 
VALUES (11,5);

INSERT INTO tbDepartamentoProjeto (numero_depto,numero_projeto) 
VALUES (10,1);

INSERT INTO tbDepartamentoProjeto (numero_depto,numero_projeto) 
VALUES (14,3);

INSERT INTO tbEmpregadoProjeto(rg_emp ,numero_projeto,horas_proj )
VALUES(12510,3,120);

INSERT INTO tbEmpregadoProjeto(rg_emp ,numero_projeto,horas_proj )
VALUES(12456,2,240);

INSERT INTO tbEmpregadoProjeto(rg_emp ,numero_projeto,horas_proj )
VALUES(12458,4,180);

INSERT INTO tbEmpregadoProjeto(rg_emp ,numero_projeto,horas_proj )
VALUES(12457,5,190);

INSERT INTO tbEmpregadoProjeto(rg_emp ,numero_projeto,horas_proj )
VALUES(12459,1,100);

INSERT  INTO tbDependentes (rgResponsavel_dep,nome_dep,dataNascimento_dep,genero_dep)
VALUES (12458,'Luiz Juck', '2000-10-2','MASCULINO');

INSERT  INTO tbDependentes (rgResponsavel_dep,nome_dep,dataNascimento_dep,genero_dep)
VALUES (12456,'Nancy Oliveira', '1940-11-21','FEMININO');

INSERT  INTO tbDependentes (rgResponsavel_dep,nome_dep,dataNascimento_dep,genero_dep)
VALUES (12510,'Thiago Braga', '2008-03-29','MASCULINO');

INSERT  INTO tbDependentes (rgResponsavel_dep,nome_dep,dataNascimento_dep,genero_dep)
VALUES (12459,'Jorge Hugo', '1900-11-11','MASCULINO');

INSERT  INTO tbDependentes (rgResponsavel_dep,nome_dep,dataNascimento_dep,genero_dep)
VALUES (12457,'Julio Tico', '2002-10-12','MASCULINO');

INSERT  INTO tbDependentes (rgResponsavel_dep,nome_dep,dataNascimento_dep,genero_dep)
VALUES (12458,'Mario Sérgio', '2009-10-2','MASCULINO');

-- QUESTÃO 4 
SELECT * FROM tbEmpregado;

-- QUESTÃO 5 
SELECT nome_projeto
FROM tbProjeto
WHERE localizacao_projeto = 'CURITIBA-PR';

-- QUESTÃO 6
ALTER TABLE tbEmpregado 
ADD cidade_emp VARCHAR (100);

UPDATE tbEmpregado 
SET cidade_emp = 'SÃO JOSE DOS PINHAIS'
WHERE  RG_emp= 12456;

UPDATE tbEmpregado 
SET cidade_emp = 'CURITIBA'
WHERE  RG_emp= 12457;

UPDATE tbEmpregado 
SET cidade_emp = 'PINHAIS'
WHERE  RG_emp= 12458;

UPDATE tbEmpregado 
SET cidade_emp = 'CURITIBA'
WHERE  RG_emp= 12459;

UPDATE tbEmpregado 
SET cidade_emp = 'SÃO JOSE DOS PINHAIS'
WHERE  RG_emp= 12510;

SELECT nome_emp
FROM tbEmpregado
WHERE cidade_emp = 'SÃO JOSE DOS PINHAIS';

-- QUESTÃO 7 
SELECT salario_emp
FROM tbEmpregado 
WHERE  cidade_emp = 'CURITIBA';

-- QUESTÃO 8
SELECT nome_dep
FROM tbDependentes
WHERE dataNascimento_dep BETWEEN '2009-01-01' AND '2009-12-31';

-- QUESTÃO 9 
SELECT nome_emp,cidade_emp
FROM tbEmpregado
WHERE salario_emp>1900;

-- QUESTÃO 10 
SELECT tbDepartamento.nome_depto , tbEmpregado.nome_emp
FROM  tbDepartamento INNER JOIN  tbEmpregado
ON tbDepartamento.rgGerente_depto = tbEmpregado.RG_emp;

-- QUESTÃO 11
SELECT tbDepartamento.nome_depto
FROM tbDepartamento INNER JOIN tbDepartamentoProjeto
ON tbDepartamento.numero_depto = tbDepartamentoProjeto.numero_depto
WHERE tbDepartamentoProjeto.numero_projeto =2;

-- QUESTÃO 12
SELECT tbEmpregado.nome_emp
FROM tbEmpregado INNER JOIN tbDepartamento
ON tbEmpregado.num_depto_emp = tbDepartamento.numero_depto
WHERE tbDepartamento.nome_depto = 'Desenvolvimento';

-- QUESTAO 13 
SELECT tbEmpregado.nome_emp
FROM tbEmpregado INNER JOIN tbEmpregadoProjeto
ON tbEmpregado.RG_emp = tbEmpregadoProjeto.rg_emp
WHERE tbEmpregadoProjeto.numero_projeto = 3;

-- QUESTÃO 14 
UPDATE tbEmpregado 
SET cidade_emp = 'Brasília'
WHERE  nome_emp= 'Cristiano Lima';

-- QUESTÃO 15	
UPDATE tbEmpregado
SET salario_emp = salario_emp * 1.07
WHERE salario_emp > 1900;

-- QUESTÃO 16
INSERT INTO tbProjeto(nome_projeto,numero_projeto,localizacao_projeto)
VALUES ('Romero Brito',23,'CURITIBA-PR');

UPDATE tbDepartamentoProjeto
SET numero_projeto = 23
WHERE numero_projeto = 1; 

UPDATE tbEmpregadoProjeto
SET numero_projeto = 23
WHERE numero_projeto = 1;

DELETE FROM tbProjeto
WHERE numero_projeto =1;

-- QUESTÃO 17
DELETE tbDependentes 
FROM tbDependentes INNER JOIN tbEmpregado
ON tbDependentes.rgResponsavel_dep = tbEmpregado.RG_emp
WHERE tbEmpregado.nome_emp = 'Ronaldo Silva';

-- QUESTÃO 18
 DELETE FROM  tbDepartamentoProjeto WHERE 
 tbDepartamentoProjeto.numero_projeto IN ( SELECT  tbProjeto.numero_projeto
 FROM tbProjeto
 WHERE tbProjeto.nome_projeto = 'Romero Brito');

DELETE  FROM tbEmpregadoProjeto WHERE tbEmpregadoProjeto.numero_projeto IN (SELECT tbProjeto.numero_projeto
FROM tbProjeto
WHERE tbProjeto.nome_projeto = 'Romero Brito');

DELETE FROM tbProjeto
WHERE nome_projeto = 'Romero Brito';

-- QUESTÃO 19
-- Pergunta se está errado
SELECT tbEmpregado.*
FROM tbEmpregado
ORDER BY RG_emp DESC;

-- QUESTÃO 20
SELECT tbEmpregado.*
FROM tbEmpregado
ORDER BY nome_emp DESC;

-- QUESTÃO 21 
SELECT tbEmpregado.nome_emp,tbDependentes.nome_dep,
tbDependentes.dataNascimento_dep
FROM tbEmpregado INNER JOIN tbDependentes
ON tbEmpregado.RG_emp = tbDependentes.rgResponsavel_dep
ORDER BY nome_dep;

-- QUESTÃO 22
SELECT tbDepartamento.nome_depto, COUNT(RG_emp)
FROM tbEmpregado INNER JOIN tbDepartamento
ON tbEmpregado.num_depto_emp = tbDepartamento.numero_depto
GROUP BY tbDepartamento.numero_depto;

-- QUESTÃO 23 
SELECT nome_projeto,COUNT(RG_emp)
FROM tbProjeto INNER JOIN tbEmpregadoProjeto
ON tbProjeto.numero_projeto = tbEmpregadoProjeto.numero_projeto
GROUP BY tbProjeto.nome_projeto;

-- QUESTÃO 24
SELECT nome_depto,COUNT(numero_projeto)
FROM tbDepartamento INNER JOIN tbDepartamentoProjeto
ON tbDepartamento.numero_depto = tbDepartamentoProjeto.numero_depto
GROUP BY tbDepartamento.nome_depto;

-- QUESTÃO 25
SELECT COUNT(nome_dep)
FROM tbDependentes;

-- QUESTÃO 26
SELECT COUNT(numero_depto)
FROM tbDepartamento;

-- QUESTÃO 27
SELECT nome_dep
FROM tbDependentes INNER JOIN tbEmpregado
ON tbDependentes.rgResponsavel_dep= tbEmpregado.RG_emp
WHERE tbEmpregado.nome_emp= 'Joel Ferreira';

-- QUESTÃO 28
SELECT COUNT(nome_dep)
FROM tbDependentes
WHERE genero_dep = 'MASCULINO';

-- QUESTÃO 29
SELECT COUNT(nome_dep)
FROM tbDependentes
WHERE genero_dep = 'FEMININO';

-- QUESTÃO 30
SELECT COUNT(nome_dep)
FROM tbDependentes
WHERE dataNascimento_dep<'2008-01-01';

-- QUESTÃO 31
SELECT COUNT(nome_dep)
FROM tbDependentes
WHERE dataNascimento_dep>'2005-01-01';

-- QUESTÃO 32
SELECT tbEmpregado.nome_emp
FROM  tbEmpregado INNER JOIN tbDependentes 
ON tbEmpregado.RG_emp = tbDependentes.rgResponsavel_dep
WHERE tbDependentes.nome_dep= 'Thiago Braga';

-- QUESTÃO 33
SELECT tbEmpregado.nome_emp
FROM tbEmpregado
INNER JOIN tbEmpregadoProjeto ON tbEmpregadoProjeto.rg_emp = tbEmpregado.RG_emp
INNER JOIN tbProjeto ON tbEmpregadoProjeto.numero_projeto = tbProjeto.numero_projeto
WHERE tbProjeto.nome_projeto = 'Romário';

-- QUESTÃO 34
SELECT nome_dep
FROM tbDependentes
WHERE genero_dep='FEMINNO' AND dataNascimento_dep>'1990-01-01';

-- QUESTÃO 35
SELECT MAX(salario_emp)
FROM tbEmpregado;

-- QUESTÃO 36
SELECT MIN(salario_emp)
FROM tbEmpregado;

-- QUESTÃO 37
SELECT AVG(salario_emp)
FROM tbEmpregado;

-- QUESTÃO 38
SELECT AVG(salario_emp)
FROM tbEmpregado INNER JOIN tbDepartamento
ON tbEmpregado.num_depto_emp= tbDepartamento.numero_depto
WHERE tbDepartamento.nome_depto= 'Desenvolvimento';

-- QUESTÃO 39
SELECT tbProjeto.nome_projeto,SUM(tbEmpregadoProjeto.horas_proj)
FROM tbProjeto INNER JOIN tbEmpregadoProjeto
ON tbProjeto.numero_projeto = tbEmpregadoProjeto.numero_projeto
GROUP BY tbProjeto.nome_projeto
HAVING SUM(tbEmpregadoProjeto.horas_proj)>= ALL (
SELECT SUM(tbEmpregadoProjeto.horas_proj)
FROM tbEmpregadoProjeto
GROUP BY tbEmpregadoProjeto.numero_projeto);

-- QUESTÃO 40 
SELECT tbProjeto.nome_projeto,SUM(tbEmpregadoProjeto.horas_proj)
FROM tbProjeto INNER JOIN tbEmpregadoProjeto
ON tbProjeto.numero_projeto = tbEmpregadoProjeto.numero_projeto
GROUP BY tbProjeto.nome_projeto
HAVING SUM(tbEmpregadoProjeto.horas_proj)<= ALL (
SELECT SUM(tbEmpregadoProjeto.horas_proj)
FROM tbEmpregadoProjeto
GROUP BY tbEmpregadoProjeto.numero_projeto);

-- QUESTÃO 41
SELECT nome_projeto
FROM tbProjeto
WHERE localizacao_projeto = 'CURITIBA-PR';

-- QUESTÃO 42
SELECT tbEmpregado.nome_emp
FROM tbEmpregado INNER JOIN tbEmpregadoProjeto
ON tbEmpregado.RG_emp= tbEmpregadoProjeto.rg_emp
INNER JOIN tbProjeto 
ON tbEmpregadoProjeto.numero_projeto = tbProjeto.numero_projeto
WHERE tbProjeto.localizacao_projeto = 'SÃO PAULO-SP';

-- QUESTÃO 43 
SELECT tbDepartamento.nome_depto,tbEmpregado.nome_emp
FROM tbDepartamento INNER JOIN tbEmpregado
ON tbDepartamento.rgGerente_depto= tbEmpregado.RG_emp
ORDER BY tbDepartamento.nome_depto;

-- QUESTÃO 44
UPDATE  tbEmpregado
SET salario_emp = salario_emp*1.10

































