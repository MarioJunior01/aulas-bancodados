CREATE DATABASE  db_bliblioteca;
  USE db_bliblioteca;
  -- QUESTAO A
  CREATE TABLE tbUsuario(
  codigo_usuario INT,
  nome_usuario VARCHAR (50) NOT NULL,
  fone_usuario NUMERIC (11),
  genero_usuario CHAR (1),
  data_nascimento_usuario DATE ,
  CONSTRAINT pk_tbUsuario PRIMARY KEY tbUsuario (codigo_usuario)
  );
  
  CREATE TABLE tbEditora(
  codigo_editora INT ,
  nome_editora VARCHAR (50) NOT NULL,
  fone_editora NUMERIC(11),
  CONSTRAINT pk_tbEditora PRIMARY KEY (codigo_editora)
  );
  
  CREATE TABLE tbAutor(
  codigo_autor INT ,
  nome_autor VARCHAR (50),
  CONSTRAINT pk_tbAutor PRIMARY KEY (codigo_autor)
  );
  CREATE TABLE tbLivro (
  codigo_livro INT ,
  codigo_editora INT,
  nome_livro VARCHAR (50) NOT NULL,
  ano_publicacao_livro INT NOT NULL,
 
 CONSTRAINT pk_tbLivro PRIMARY KEY tbLivro (codigo_livro),
CONSTRAINT fk_tbLivro_tbEditora FOREIGN KEY tbLivro (codigo_editora)
                                  REFERENCES tbEditora (codigo_editora)  
  );
  
  CREATE TABLE tbLivroAutor(
  codigo_livro INT ,
  codigo_autor INT,
  
  CONSTRAINT pk_tbLivroAutor PRIMARY KEY tbLivroAutor (codigo_livro,codigo_autor),
  CONSTRAINT fk_tbLivroAutor_tbAutor FOREIGN KEY tbLivroAutor (codigo_livro)
									  REFERENCES tbLivro (codigo_livro),
    CONSTRAINT fk_tbLivroAutor_tbLivro FOREIGN KEY tbLivroAutor (codigo_autor)
									  REFERENCES tbAutor (codigo_autor)
  );
  
  CREATE TABLE tbEmpDev (
  codigo_usuario INT ,
  codigo_livro INT ,
  data_emprestimo DATE,
  data_devolucao_prevista DATE,
  data_dev_efet DATE ,
  CONSTRAINT pk_tbEmpDev PRIMARY KEY tbEmpDev (codigo_usuario,codigo_livro,data_emprestimo),
  CONSTRAINT fk_tbEmpDev_tbLivro FOREIGN KEY tbEmpDev (codigo_livro)
								REFERENCES tbLivro (codigo_livro),
CONSTRAINT fk_tbEmpDev_tbUsuario FOREIGN KEY tbEmpDev (codigo_usuario)
								REFERENCES tbUsuario(codigo_usuario)
                                
  );
 
  --  QUESTAO B
  INSERT INTO tbUsuario(codigo_usuario,nome_usuario,fone_usuario,genero_usuario,data_nascimento_usuario)
  VALUES (1,'Claudio',41975632,'M','2000-10-9');
  
  INSERT INTO tbUsuario(codigo_usuario,nome_usuario,fone_usuario,genero_usuario,data_nascimento_usuario)
  VALUES (3,'Roberto',41991028,'M','2001-11-3');
  
  INSERT INTO tbUsuario(codigo_usuario,nome_usuario,fone_usuario,genero_usuario,data_nascimento_usuario)
  VALUES (2,'Silva melo',411232,'F','2005-12-9');
  
  INSERT INTO tbUsuario(codigo_usuario,nome_usuario,fone_usuario,genero_usuario,data_nascimento_usuario)
  VALUES (4,'Clovis Melo  ',4197221632,'M','2001-12-10');
  
  INSERT INTO tbUsuario(codigo_usuario,nome_usuario,fone_usuario,genero_usuario,data_nascimento_usuario)
  VALUES (5,'Paulo matos',411125632,'M','1980-11-3');
  
  
  INSERT INTO tbEditora(codigo_editora,nome_editora,fone_editora)
  VALUES( 10,'INEPO',0800010);
  
   INSERT INTO tbEditora(codigo_editora,nome_editora,fone_editora)
   VALUES( 11,'SOLO',90012);
  
   INSERT INTO tbEditora(codigo_editora,nome_editora,fone_editora)
   VALUES( 12,'CAPS',100221);
   
   INSERT INTO tbEditora(codigo_editora,nome_editora,fone_editora)
   VALUES( 13,'POLAR',91000);
  
   INSERT INTO tbEditora(codigo_editora,nome_editora,fone_editora)
   VALUES( 14,'POPO',1002911);
   
    INSERT INTO tbEditora(codigo_editora,nome_editora,fone_editora)
   VALUES( 15,'IPOAQ',102911);
    
    INSERT INTO tbAutor(codigo_autor,nome_autor)
    VALUES (20,'Maria ');
    
     INSERT INTO tbAutor(codigo_autor,nome_autor)
     VALUES (21,'Julia  ');
     
     INSERT INTO tbAutor(codigo_autor,nome_autor)
     VALUES (22,'Samuel ');
     
      INSERT INTO tbAutor(codigo_autor,nome_autor)
      VALUES (23,'Kayo ');
      
       INSERT INTO tbAutor(codigo_autor,nome_autor)
       VALUES (24,'Mario ');
      
      INSERT INTO tbAutor(codigo_autor,nome_autor)
	  VALUES (25,'Rafael ');
      
      INSERT INTO tbLivro(codigo_livro,codigo_editora,nome_livro,ano_publicacao_livro)
      VALUES (30,10,'Coraline',1980);
      
       INSERT INTO tbLivro(codigo_livro,codigo_editora,nome_livro,ano_publicacao_livro)
       VALUES (31,15,'Como sonhar',2020);
       
	   INSERT INTO tbLivro(codigo_livro,codigo_editora,nome_livro,ano_publicacao_livro)
	   VALUES (32,14,'Eu quero ir embora',2001);
        
		INSERT INTO tbLivro(codigo_livro,codigo_editora,nome_livro,ano_publicacao_livro)
		VALUES (33,11,'Aviação',2008);
         
		INSERT INTO tbLivro(codigo_livro,codigo_editora,nome_livro,ano_publicacao_livro)
		VALUES (34,10,'De volta pra londres',1900);
          
		INSERT INTO tbLivro(codigo_livro,codigo_editora,nome_livro,ano_publicacao_livro)
		VALUES (35,14,'Romero ',1800);
            
		INSERT INTO  tbLivroAutor(codigo_livro,codigo_autor)
        VALUES (31,20);  
        
        INSERT INTO  tbLivroAutor(codigo_livro,codigo_autor)
        VALUES (35,20);  
        
        INSERT INTO  tbLivroAutor(codigo_livro,codigo_autor)
        VALUES (34,23);
        
        INSERT INTO  tbLivroAutor(codigo_livro,codigo_autor)
        VALUES (32,22);
        
        INSERT INTO  tbLivroAutor(codigo_livro,codigo_autor)
        VALUES (33,21);   
            
         INSERT INTO tbEmpDev( codigo_usuario,codigo_livro ,data_emprestimo,data_devolucao_prevista , data_dev_efet )
        VALUE (4,31,'2021-10-22','2015-10-22','2021-09-11');
        
        INSERT INTO tbEmpDev( codigo_usuario,codigo_livro ,data_emprestimo,data_devolucao_prevista , data_dev_efet )
        VALUE (5,34,'2022-11-12','2011-09-15','2022-10-10');
        
        INSERT INTO tbEmpDev( codigo_usuario,codigo_livro ,data_emprestimo,data_devolucao_prevista , data_dev_efet )
        VALUE (3,32,'2026-12-10','2020-11-25','2021-09-19');
        
        INSERT INTO tbEmpDev( codigo_usuario,codigo_livro ,data_emprestimo,data_devolucao_prevista , data_dev_efet )
        VALUE (4,32,'2026-11-22','2016-08-22','2002-01-11');
        
        INSERT INTO tbEmpDev( codigo_usuario,codigo_livro ,data_emprestimo,data_devolucao_prevista , data_dev_efet )
        VALUE (5,33,'2023-12-31','2010-11-11','2021-11-11');
        
        INSERT INTO tbEmpDev( codigo_usuario,codigo_livro ,data_emprestimo,data_devolucao_prevista , data_dev_efet )
        VALUE (5,33,'2024-12-31','2011-11-11','2005-11-11');
        
        
        -- QUESTÃO C
        SELECT DISTINCT tbLivro.nome_livro
        FROM tbLivro INNER JOIN tbEmpDev
        ON tbLivro.codigo_livro = tbEmpDev.codigo_livro;
        
      -- QUESTÃO D 
         SELECT DISTINCT tbEditora.nome_editora
         FROM tbEditora INNER JOIN tbLivro
         ON tbEditora.codigo_editora = tbLivro.codigo_editora
         WHERE tbLivro.ano_publicacao_livro='2005' OR tbLivro.ano_publicacao_livro = '2015';
         
         -- QUESTÃO E 
         
         DELETE  FROM tbEmpDev
	     WHERE codigo_usuario IN (SELECT codigo_usuario
								  FROM  tbUsuario 
                                  WHERE tbUsuario.data_nascimento_usuario <'1980-12-31');
                                  
			DELETE FROM tbUsuario
            WHERE tbUsuario.data_nascimento_usuario < '1980-12-31';