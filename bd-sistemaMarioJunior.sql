CREATE DATABASE  bd_sistemaMarioJunior;
USE  bd_sistemaMarioJunior;
DROP DATABASE bd_sistemaMarioJunior;

CREATE TABLE mpj_tbFornecedor (
mpj_cnpjFornecedor INT NOT NULL,
mpj_nomeFantasiaFornecedor VARCHAR (60) NOT NULL,
mpj_razaoSocialFornecedor VARCHAR (60) NOT NULL,
mpj_dataCriacaoFornecedor  DATE ,
mpj_capitalFornecedor DOUBLE,
mpj_quantidadeFuncionariosFornecedor  LONG,
mpj_segmentoFornecedor VARCHAR (40),
mpj_telefoneFornecedor  VARCHAR (30) NOT NULL,
mpj_emailFornecedor VARCHAR (40) NOT NULL,
mpj_cepFornecedor VARCHAR (20) NOT NULL,
mpj_ruaFornecedor VARCHAR (200) NOT NULL,
mpj_estadoFornecedor VARCHAR (20),
mpj_paisFornecedor VARCHAR (20),
mpj_servicoPrestadoFornecedor VARCHAR (300) NOT NULL,
mpj_nomeResponsavelFornecedor VARCHAR (60) NOT NULL,

CONSTRAINT pk_tbFornecedor PRIMARY KEY (mpj_cnpjFornecedor)
);


CREATE TABLE mpj_tbProduto(
mpj_idProduto INT AUTO_INCREMENT,
mpj_nomeProduto VARCHAR (60) NOT NULL,
mpj_dataFabricaoProduto DATE NOT NULL,
mpj_nomeFabricante VARCHAR (60) NOT NULL,
mpj_segmentoProduto VARCHAR (20),
mpj_validadeProduto DATE NOT NULL,
mpj_descricaoProduto VARCHAR (300),

CONSTRAINT pk_tbProduto PRIMARY KEY (mpj_idProduto)
);

CREATE TABLE mpj_tbFuncionario (
mpj_nomeCompletoFuncionario VARCHAR (200) NOT NULL,
mpj_cpfFuncionario INT NOT NULL,
mpj_telefoneFuncionario VARCHAR (60),
mpj_emailFuncionario VARCHAR (60),
mpj_cargoFuncionario VARCHAR (60),
mpj_setorFuncionario VARCHAR (40) NOT NULL,
mpj_sexoFuncionario VARCHAR (20) NOT NULL,

CONSTRAINT pk_tbFuncionario PRIMARY KEY (mpj_cpfFuncionario)
 );
 
 
 CREATE TABLE mpj_tbUsuario (
 mpj_idUsuario  INT AUTO_INCREMENT,
 mpj_nomeUsuario VARCHAR (60) NOT NULL,
 mpj_apelidoUsuario VARCHAR (40) NOT NULL,
 mpj_cpfUsuario INT NOT NULL,
 mpj_dataNascimentoUsuario DATE NOT NULL,
 mpj_ativoUsuario BOOLEAN ,
 mpj_nivelUsuario VARCHAR (40),
 mpj_senhaFuncionario VARCHAR (70),
 
 CONSTRAINT pk_tbUsuario PRIMARY KEY (mpj_idUsuario)
 );
 
 CREATE TABLE mpj_tbCompra(
 mpj_idCompra INT AUTO_INCREMENT,
 mpj_dataCompra DATE NOT NULL,
 mpj_valorCompra DOUBLE NOT NULL,
 mpj_cpfFuncionarioCompra INT,
 mpj_cnpjFornecedorCompra INT,
 
CONSTRAINT pk_tbCompra PRIMARY KEY (mpj_idCompra),
 
CONSTRAINT fk_tbCompraFucionario FOREIGN KEY (mpj_cpfFuncionarioCompra) REFERENCES mpj_tbFuncionario (mpj_cpfFuncionario),
CONSTRAINT fk_tbCompraFornecedor FOREIGN KEY (mpj_cnpjFornecedorCompra) REFERENCES mpj_tbFornecedor (mpj_cnpjFornecedor)
 );
 
 
 CREATE TABLE mpj_tbCompraProduto(
  mpj_quantidadeProduto INT NOT NULL,
  mpj_idProduto INT,
  mpj_idCompraProduto INT,
  
  CONSTRAINT pk_tbCompraProduto PRIMARY KEY (mpj_idCompraProduto),
  
  CONSTRAINT fk_tbCompraProduto_tbCompra FOREIGN KEY  tbCompra (mpj_idCompraProduto	) REFERENCES mpj_tbCompra (mpj_idCompra),
  CONSTRAINT fk_tbCompraProdut_tbProduto FOREIGN KEY tbProduto (mpj_idProduto) REFERENCES mpj_tbProduto(mpj_idProduto)
 );
 