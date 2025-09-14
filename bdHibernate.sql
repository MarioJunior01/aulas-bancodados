CREATE DATABASE  bd_sistemaHibernate;

USE  bd_sistemaHibernate;

CREATE TABLE mpj_tbFornecedor (
mpj_cnpjFornecedor INT NOT NULL,
mpj_nomeFantasiaFornecedor VARCHAR (100) NOT NULL,
mpj_razaoSocialFornecedor VARCHAR (100) NOT NULL,
mpj_dataCriacaoFornecedor  DATE ,
mpj_capitalFornecedor DOUBLE,
mpj_quantidadeFuncionariosFornecedor  LONG,
mpj_segmentoFornecedor VARCHAR (100),
mpj_telefoneFornecedor  VARCHAR (100) NOT NULL,
mpj_emailFornecedor VARCHAR (100) NOT NULL,
mpj_cepFornecedor VARCHAR (100) NOT NULL,
mpj_ruaFornecedor VARCHAR (200) NOT NULL,
mpj_estadoFornecedor VARCHAR (20),
mpj_paisFornecedor VARCHAR (20),
mpj_servicoPrestadoFornecedor VARCHAR (300) NOT NULL,
mpj_nomeResponsavelFornecedor VARCHAR (200) NOT NULL,

CONSTRAINT pk_tbFornecedor PRIMARY KEY (mpj_cnpjFornecedor, mpj_razaoSocialFornecedor)
);


CREATE TABLE mpj_tbProduto(
mpj_idProduto INT AUTO_INCREMENT,
mpj_nomeProduto VARCHAR (100) NOT NULL,
mpj_dataFabricaoProduto DATE NOT NULL,
mpj_nomeFabricante VARCHAR (100) NOT NULL,
mpj_segmentoProduto VARCHAR (20),
mpj_validadeProduto DATE NOT NULL,
mpj_descricaoProduto TEXT,

CONSTRAINT pk_tbProduto PRIMARY KEY (mpj_idProduto)
);

CREATE TABLE mpj_tbFuncionario (
mpj_nomeCompletoFuncionario VARCHAR (300) NOT NULL,
mpj_cpfFuncionario INT NOT NULL,
mpj_telefoneFuncionario VARCHAR (100),
mpj_emailFuncionario VARCHAR (100),
mpj_cargoFuncionario VARCHAR (100),
mpj_setorFuncionario VARCHAR (100) NOT NULL,

CONSTRAINT pk_tbFuncionario PRIMARY KEY (mpj_cpfFuncionario,mpj_nomeCompletoFuncionario)
 );
 
 