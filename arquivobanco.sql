CREATE DATABASE db_SistemaBancarioMarioJunior;
 USE db_SistemaBancarioMarioJunior;
  CREATE TABLE tb_Agencia( 
  cod_Agencia INT, 
  nome_Agencia VARCHAR(25) NOT NULL,
  cidade_Agencia VARCHAR (25) NOT NULL,
  fundo_Agencia DOUBLE,
   CONSTRAINT pk_tbAgencia PRIMARY KEY (cod_Agencia)
  );
  
  CREATE TABLE tb_Cliente (
  cod_Cliente INT,
  nome_Cliente VARCHAR(25) NOT NULL,
  cidade_Cliente VARCHAR(25)NOT NULL,
  rua_Cliente VARCHAR(25)NOT NULL,
  CONSTRAINT pk_tbCliente PRIMARY KEY (cod_Cliente)
  );
  CREATE TABLE tb_Conta (
  numero_Conta INT,
   codigo_Agencia INT,
	saldo DOUBLE,
    CONSTRAINT pk_tbConta PRIMARY KEY (numero_Conta),
    CONSTRAINT fk_tbContatbAgencia FOREIGN KEY (codigo_Agencia) REFERENCES tb_Agencia(cod_Agencia)
  );
  CREATE TABLE tb_Emprestimo(
  numero_Emprestimo INT,
  codigo_Agencia INT ,
  total DOUBLE,
  CONSTRAINT pk_tbEmprestimo PRIMARY KEY (numero_Emprestimo),
CONSTRAINT fk_tbEmprestimotbAgencia FOREIGN KEY (codigo_Agencia) REFERENCES tb_Agencia(cod_Agencia)


  );
  
  CREATE TABLE tb_Depositante (
  numero_Conta INT,
  codigo_Cliente INT,
  CONSTRAINT pk_tbDepositante PRIMARY KEY (numero_Conta,codigo_Cliente),
  CONSTRAINT fk_tbDepositantetbCliente FOREIGN KEY (codigo_Cliente) REFERENCES tb_Cliente(cod_Cliente)
  );
  
   
  CREATE TABLE tb_Devedor(
  codigo_Cliente INT,
  numero_Emprestimo INT,
  CONSTRAINT pk_tbDevedor PRIMARY KEY (codigo_Cliente,numero_Emprestimo),
  CONSTRAINT fk_tbDevedortbEmprestimo FOREIGN KEY (numero_Emprestimo) REFERENCES tb_Emprestimo(numero_Emprestimo),
  CONSTRAINT fk_tbDevedortbCliente FOREIGN KEY (codigo_Cliente) REFERENCES tb_Cliente(cod_Cliente)
  );

INSERT tb_Agencia( cod_Agencia , nome_Agencia ,cidade_Agencia ,fundo_Agencia )
VALUES(1,'Banco do Brasil Rebouças ','Curitiba ',100000.10);

INSERT tb_Agencia( cod_Agencia , nome_Agencia ,cidade_Agencia ,fundo_Agencia )
VALUES(2,'Banco do Brasil Agua Verde ','Curitiba ',200000.10);

INSERT tb_Agencia( cod_Agencia , nome_Agencia ,cidade_Agencia ,fundo_Agencia )
VALUES(3,'Banco do Brasil Xamxim ','Curitiba ',300000.10);

INSERT tb_Agencia( cod_Agencia , nome_Agencia ,cidade_Agencia ,fundo_Agencia )
VALUES(4,'Banco do Brasil Portão ','Curitiba ',400000.10);

INSERT tb_Agencia( cod_Agencia , nome_Agencia ,cidade_Agencia ,fundo_Agencia )
VALUES(5,'Banco do Brasil Batel ','Curitiba ',500000.10);



INSERT tb_Cliente( cod_Cliente ,nome_Cliente,cidade_Cliente,rua_Cliente )
VALUES(1,'Clovis Silva Pereira','Curitiba','Rua flor de liz ');

INSERT tb_Cliente( cod_Cliente ,nome_Cliente,cidade_Cliente,rua_Cliente )
VALUES(2,'Lucas Andrade Silva','Curitiba','Rua Mario Quintana  ');

INSERT tb_Cliente( cod_Cliente ,nome_Cliente,cidade_Cliente,rua_Cliente )
VALUES(3,'Thiago Braga de Santos','Curitiba','Rua João Negrão');

INSERT tb_Cliente( cod_Cliente ,nome_Cliente,cidade_Cliente,rua_Cliente )
VALUES(4,'Shauane Eliza da Cunha Santos ','Fazenda Rio Grande','Rua  Freud pereira  ');

INSERT tb_Cliente( cod_Cliente ,nome_Cliente,cidade_Cliente,rua_Cliente )
VALUES(5,' Samuel Guerreiro Silva','Curitiba','Rua Vitor do Amaral');

INSERT tb_Conta(numero_Conta,codigo_Agencia ,saldo )
VALUES(1,1,200.50);

INSERT tb_Conta(numero_Conta,codigo_Agencia ,saldo )
VALUES(2,2,1000.40);

INSERT tb_Conta(numero_Conta,codigo_Agencia ,saldo )
VALUES(3,3,2000.00);

INSERT tb_Conta(numero_Conta,codigo_Agencia ,saldo )
VALUES(4,4,500.08);

INSERT tb_Conta(numero_Conta,codigo_Agencia ,saldo )
VALUES(5,5,20.00);


INSERT tb_Emprestimo( numero_Emprestimo,codigo_Agencia,total)
VALUES(1,1,100);

INSERT tb_Emprestimo( numero_Emprestimo,codigo_Agencia,total)
VALUES(2,2,1000);

INSERT tb_Emprestimo( numero_Emprestimo,codigo_Agencia,total)
VALUES(3,3,20);

INSERT tb_Emprestimo( numero_Emprestimo,codigo_Agencia,total)
VALUES(4,4,10000);

INSERT tb_Emprestimo( numero_Emprestimo,codigo_Agencia,total)
VALUES(5,5,100000);

INSERT tb_Depositante(numero_Conta ,codigo_Cliente )
VALUES(1,1);

INSERT tb_Depositante(numero_Conta ,codigo_Cliente )
VALUES(2,2);

INSERT tb_Depositante(numero_Conta ,codigo_Cliente )
VALUES(3,3);

INSERT tb_Depositante(numero_Conta ,codigo_Cliente )
VALUES(4,4);

INSERT tb_Depositante(numero_Conta ,codigo_Cliente )
VALUES(5,5);


INSERT tb_Devedor(codigo_Cliente,numero_Emprestimo )
VALUES(1,1);

INSERT tb_Devedor(codigo_Cliente,numero_Emprestimo )
VALUES(2,2);

INSERT tb_Devedor(codigo_Cliente,numero_Emprestimo )
VALUES(3,3);

INSERT tb_Devedor(codigo_Cliente,numero_Emprestimo )
VALUES(4,4);

INSERT tb_Devedor(codigo_Cliente,numero_Emprestimo )
VALUES(5,5);

SELECT tb_Agencia.*
FROM tb_Agencia;

SELECT tb_Cliente.*
FROM tb_Cliente;

SELECT tb_Conta.*
FROM tb_Conta;

SELECT tb_Emprestimo.*
FROM tb_Emprestimo;

SELECT tb_Depositante.*
FROM tb_Depositante;

SELECT tb_Devedor.*
FROM tb_Devedor;
