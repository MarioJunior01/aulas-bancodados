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
  DROP TABLE tbDevedor;

  