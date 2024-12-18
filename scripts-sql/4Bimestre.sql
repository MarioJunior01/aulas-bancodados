CREATE DATABASE db_4bi;
USE db_4bi;
	-- DROP DATABASE db_4bi;
CREATE TABLE tbCliente(
id_cliente INT AUTO_INCREMENT,
nome_cliente VARCHAR(100) NOT NULL,
cidade_cliente VARCHAR (100) NOT NULL,
uf_cliente VARCHAR (2) NOT NULL,
dataCadastro_cliente DATE NOT NULL,

CONSTRAINT pk_tbCliente PRIMARY KEY (id_cliente)
);

CREATE TABLE tbFilme(
id_filme INT AUTO_INCREMENT,
nome_filme VARCHAR (100) NOT NULL,
anoLancamento_filme INT NOT NULL,
categoria_filme VARCHAR(100) NOT NULL,
preco_filme DOUBLE,
CONSTRAINT pk_tbFilme PRIMARY KEY (id_filme) 
);
CREATE TABLE tbFornecedor(
cnpj_fornecedor INT ,
nome_fornecedor VARCHAR (100) NOT NULL,
telefone_fornecedor VARCHAR(100) NOT NULL,
cidade_fornecedor VARCHAR (100) NOT NULL,
uf_fornecedor VARCHAR(2)NOT NULL,
CONSTRAINT pk_tbFornecedor PRIMARY KEY(cnpj_fornecedor)
);
CREATE TABLE tbFilmeFornecedor(
id_filme INT ,
cnpj_fornecedor INT,
CONSTRAINT pk_tbFilmeFornecedor PRIMARY KEY (id_filme,cnpj_fornecedor),
CONSTRAINT fk_tbFilmeFornecedor_tbFilme FOREIGN KEY tbFilmeFornecedor (id_filme) REFERENCES tbFilme(id_filme),
CONSTRAINT fk_tbFilmeFornecedor_tbFornecedor FOREIGN KEY tbFilmeFornecedor (cnpj_fornecedor) REFERENCES tbFornecedor(cnpj_fornecedor)
);

CREATE TABLE tbEmprestimo(
id_emprestimo INT AUTO_INCREMENT,
id_filme INT,
id_cliente INT ,
dataEmprestimo_locacao DATE NOT NULL,
dataDevolucaoPrevista_emprestimo DATE NOT NULL,
dataDevolucaoEfetiva_emprestimo DATE NOT NULL,
multa_emprestimo DOUBLE,
CONSTRAINT pk_tbEmprestimo PRIMARY KEY (id_emprestimo),
CONSTRAINT fk_tbEmprestimo_tbFilme FOREIGN KEY tbEmprestimo(id_filme) REFERENCES tbFilme(id_filme),
CONSTRAINT fk_tbEmprestimo_tbCliente FOREIGN KEY tbEmprestimo(id_cliente) REFERENCES tbCliente(id_cliente)
);



INSERT INTO tbCliente(nome_cliente,cidade_cliente,uf_cliente,dataCadastro_cliente)
VALUES("Thiago Braga","Curitiba","PR",'2024-12-17');

INSERT INTO tbCliente(nome_cliente,cidade_cliente,uf_cliente,dataCadastro_cliente)
VALUES("Gabriel","Porto Alegre ","RS",'2021-11-11');

INSERT INTO tbCliente(nome_cliente,cidade_cliente,uf_cliente,dataCadastro_cliente)
VALUES(" Braga Silva","Umarama","PR",'2011-10-19');

INSERT INTO tbCliente(nome_cliente,cidade_cliente,uf_cliente,dataCadastro_cliente)
VALUES("Julio Pereira","Colombo","PR",'2010-09-19');

INSERT INTO tbCliente(nome_cliente,cidade_cliente,uf_cliente,dataCadastro_cliente)
VALUES("Silvano Ribeiro","Boa Vista","RR",'2000-01-01');

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("As Branquelas",2005,"Comedia",100.90);

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("Os Ruivos",2000,"Dark",1.90);

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("Sorria",1940,"Drama",45.90);

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("Os Barbaros",1980,"Romance",100.00);

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("Cavalo de Troia",2009,"Fatos Reais",90.00);

INSERT INTO tbFornecedor(cnpj_fornecedor,nome_fornecedor,telefone_fornecedor,cidade_fornecedor,uf_fornecedor )
VALUES (0001,"Gravadora Clovis","4199732112","Curitiba","PR");

INSERT INTO tbFornecedor(cnpj_fornecedor,nome_fornecedor,telefone_fornecedor,cidade_fornecedor,uf_fornecedor )
VALUES (0002,"Riumar Filmes","80000000","Porto Velho","RO");

INSERT INTO tbFornecedor(cnpj_fornecedor,nome_fornecedor,telefone_fornecedor,cidade_fornecedor,uf_fornecedor )
VALUES (0003,"Baroes Vilmar","431132","Sao Paulo","SP");

INSERT INTO tbFornecedor(cnpj_fornecedor,nome_fornecedor,telefone_fornecedor,cidade_fornecedor,uf_fornecedor )
VALUES (0004,"Home Filmes","41997321112","Campinas","SP");

INSERT INTO tbFornecedor(cnpj_fornecedor,nome_fornecedor,telefone_fornecedor,cidade_fornecedor,uf_fornecedor )
VALUES (0005,"Life Filmes","883833","Boa Vista","RR");
INSERT INTO tbFornecedor(cnpj_fornecedor,nome_fornecedor,telefone_fornecedor,cidade_fornecedor,uf_fornecedor )
VALUES (0006,"Filmes zEIRA","88383123","Boa Vista","RR");

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("Silvio Santos",2024,"Documentario",80.00);

INSERT INTO tbFilme(nome_filme,anoLancamento_filme,categoria_filme,preco_filme)
VALUES("Mama Mia",2000,"Musical",50.00);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(1,0004);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(3,0001);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(2,0005);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(4,0002);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(5,0003);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(6,0003);

INSERT INTO tbFilmeFornecedor(id_filme,cnpj_fornecedor)
VALUES(7,0002);
INSERT INTO tbEmprestimo (id_filme,id_cliente,dataEmprestimo_locacao,dataDevolucaoPrevista_emprestimo,dataDevolucaoEfetiva_emprestimo,multa_emprestimo )
VALUES (4,4,'2010-10-11','2010-10-18','2010-10-20',3.75);

INSERT INTO tbEmprestimo (id_filme,id_cliente,dataEmprestimo_locacao,dataDevolucaoPrevista_emprestimo,dataDevolucaoEfetiva_emprestimo,multa_emprestimo )
VALUES (5,5,'2011-11-12','2011-11-19','2010-11-24',10.90);

INSERT INTO tbEmprestimo (id_filme,id_cliente,dataEmprestimo_locacao,dataDevolucaoPrevista_emprestimo,dataDevolucaoEfetiva_emprestimo,multa_emprestimo )
VALUES (3,2,'2020-09-12','2020-09-01','2020-09-09',0);

INSERT INTO tbEmprestimo (id_filme,id_cliente,dataEmprestimo_locacao,dataDevolucaoPrevista_emprestimo,dataDevolucaoEfetiva_emprestimo,multa_emprestimo )
VALUES (3,1,'2020-09-12','2020-09-01','2020-09-09',0);
INSERT INTO tbEmprestimo (id_filme,id_cliente,dataEmprestimo_locacao,dataDevolucaoPrevista_emprestimo,dataDevolucaoEfetiva_emprestimo,multa_emprestimo )
VALUES (1,3,'2020-08-19','2020-12-12','2020-12-12',0);

INSERT INTO tbEmprestimo (id_filme,id_cliente,dataEmprestimo_locacao,dataDevolucaoPrevista_emprestimo,dataDevolucaoEfetiva_emprestimo,multa_emprestimo )
VALUES (6,1,'2024-10-11','2024-11-12','2024-11-22',null);


-- QUESTÃO E
SELECT nome_cliente
FROM tbCliente
WHERE uf_cliente ="PR";

-- QUESTÃO F 
SELECT tbCliente.nome_cliente, tbFilme.nome_filme
FROM tbCliente INNER JOIN tbEmprestimo ON tbCliente.id_cliente = tbEmprestimo.id_cliente
				INNER JOIN tbFilme ON tbFilme.id_filme=tbEmprestimo.id_filme
                WHERE MONTH(tbEmprestimo.dataEmprestimo_locacao)='10';

-- QUESTÃO G 
SELECT tbFilme.*
FROM tbFilme
WHERE tbFilme.nome_filme LIKE 'A%'|| tbFilme.nome_filme LIKE 'O%';

-- QUESTÃO H
SELECT tbFilme.nome_filme
FROM tbFilme INNER JOIN tbEmprestimo
ON tbFilme.id_filme=tbEmprestimo.id_filme
WHERE tbEmprestimo.multa_emprestimo IS NULL;

-- QUESTÃO I 
SELECT tbFilme.nome_filme
FROM tbFilme 
ORDER BY  tbFilme.nome_filme ASC;

SELECT tbFilme.preco_filme
FROM tbFilme
ORDER BY tbFilme.preco_filme DESC;

-- QUESTAO j terminar de fazer
SELECT DISTINCT cidade_cliente AS cidade, nome_cliente AS nome
FROM tbCliente
UNION
SELECT DISTINCT cidade_fornecedor , nome_fornecedor
FROM tbFornecedor;



-- QUESTÃO K 
SELECT tbCliente.cidade_cliente AS cidade,tbCliente.nome_cliente,tbFornecedor.nome_fornecedor
FROM tbCliente INNER  JOIN tbFornecedor
ON tbCliente.cidade_cliente = tbFornecedor.cidade_fornecedor;
-- QUESTÃO L
SELECT tbCliente.nome_cliente
FROM tbCliente
LEFT JOIN tbFornecedor
ON tbCliente.cidade_cliente = tbFornecedor.cidade_fornecedor
WHERE tbFornecedor.cidade_fornecedor IS NULL;

-- QUESTÃO M
SELECT COUNT(tbFornecedor.cnpj_fornecedor),tbFornecedor.cidade_fornecedor
FROM tbFornecedor 
GROUP BY tbFornecedor.cidade_fornecedor;

-- QUESTÃO N 
SELECT tbFilmeFornecedor.cnpj_fornecedor, COUNT(tbFilmeFornecedor.id_filme)
FROM tbFilmeFornecedor
GROUP BY tbFilmeFornecedor.cnpj_fornecedor;

-- QUESTÃO O
SELECT AVG(tbFilme.preco_filme),tbFilmeFornecedor.cnpj_fornecedor
FROM tbFilme INNER JOIN tbFilmeFornecedor
ON tbFilme.id_filme = tbFilmeFornecedor.id_filme
GROUP BY (tbFilmeFornecedor.cnpj_fornecedor);

-- QUESTÃO P 
SELECT AVG(tbFilme.preco_filme),tbFilmeFornecedor.cnpj_fornecedor
FROM tbFilme INNER JOIN tbFilmeFornecedor
ON tbFilme.id_filme = tbFilmeFornecedor.id_filme
WHERE tbFilme.preco_filme >5
GROUP BY (tbFilmeFornecedor.cnpj_fornecedor);

-- QUESTÃO Q
SELECT 
    cnpj_fornecedor, 
    preco_medio
FROM (
    SELECT 
        cnpj_fornecedor, 
        AVG(tbFilme.preco_filme) AS preco_medio
    FROM tbFilmeFornecedor
    INNER JOIN tbFilme
    ON tbFilmeFornecedor.id_filme = tbFilme.id_filme
    GROUP BY cnpj_fornecedor
) AS subconsulta
ORDER BY preco_medio DESC
LIMIT 1;

-- QUESTÃO R 
SELECT tbCliente.nome_cliente
FROM tbCliente INNER JOIN tbEmprestimo ON tbCliente.id_cliente = tbEmprestimo.id_cliente
				INNER JOIN tbFilmeFornecedor ON tbEmprestimo.id_filme = tbFilmeFornecedor.id_filme 
				INNER JOIN tbFornecedor ON tbFilmeFornecedor.cnpj_fornecedor = tbFornecedor.cnpj_fornecedor
                WHERE tbFornecedor.nome_fornecedor = 'Baroes Vilmar' AND  YEAR (tbEmprestimo.dataEmprestimo_locacao) =2011;
                
 -- QUESTÃO S 
 
 DELETE tbEmprestimo
 FROM tbEmprestimo WHERE tbEmprestimo.id_cliente IN (SELECT tbCliente.id_cliente
													FROM tbCliente
                                                    WHERE YEAR(tbCliente.dataCadastro_cliente)<2011);
  DELETE FROM tbCliente
  WHERE YEAR(tbCliente.dataCadastro_cliente)<2011;
  
  -- QUESTÃO T
  UPDATE tbFilme
  SET preco_filme = (preco_filme*0.02)+preco_filme
  WHERE categoria_filme = 'romance';
  
  -- QUESTÃO U
  DELETE tbFilmeFornecedor
  FROM tbFilmeFornecedor WHERE tbFilmeFornecedor.cnpj_fornecedor IN (SELECT tbFornecedor.cnpj_fornecedor
																	 FROM tbFornecedor
																	 WHERE tbFornecedor.nome_fornecedor = "Life Filmes");
   DELETE FROM tbFornecedor 
   WHERE nome_fornecedor="Life Filmes";
  
  
