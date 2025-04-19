-- Queries criação de tabelas para o banco relacional em 2FN e 3FN (já que não há dependencias transitivas)

create table tb_Cliente (
	id_Cliente int primary key,
	nome_Cliente varchar (100),
	cidade_Cliente varchar (50),
	estado_Cliente varchar (50),
	pais_Cliente varchar (50)
);

create table tb_Vendedor (
	id_Vendedor int primary key,
	nome_Vendedor varchar (100),
	sexo_Vendedor smallint,
	estado_Vendedor varchar (50)
);

create table tb_Carro (
	id_Carro int primary key,
	chassi_Carro varchar(17),
	marca_Carro varchar (25),
	modelo_Carro varchar (50),
	ano_Carro int,
	id_Combustivel int,
	foreign key (id_Combustivel) references tb_Combustivel (id_Combustivel)
);

create table tb_Combustivel (
	id_Combustivel int primary key,
	tipo_Combustivel varchar (50)
);

create table tb_Locacao (
	id_Locacao int primary key,
	id_Cliente int,
	foreign key (id_Cliente) references tb_Cliente (id_Cliente),
	id_Carro int,
	foreign key (id_Carro) references tb_Carro (id_Carro),
	kmCarro int,
	data_Locacao date,
	hora_Locacao time,
	qtd_Diaria int,
	vlr_Diaria decimal,
	data_Entrega date,
	hora_Entrega time,
	id_Vendedor int,
	foreign key (id_Vendedor) references tb_Vendedor (id_Vendedor)
);