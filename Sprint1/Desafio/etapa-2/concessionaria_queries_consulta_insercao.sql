-- Queries de insercao de dados
	

insert into tb_Cliente (id_Cliente, nome_Cliente, cidade_Cliente, estado_Cliente, pais_Cliente) values
(2, 'Cliente dois', 'São Paulo', 'São Paulo', 'Brasil'),
(3, 'Cliente tres', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
(4, 'Cliente quatro', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
(5, 'Cliente cinco', 'Manaus', 'Amazonas', 'Brasil'),
(6, 'Cliente seis', 'Belo Horizonte', 'Minas Gerais', 'Brasil'),
(10, 'Cliente dez', 'Rio Branco', 'Acre', 'Brasil'),
(20, 'Cliente vinte', 'Macapá', 'Amapá', 'Brasil'),
(22, 'Cliente vinte e dois', 'Porto Alegre', 'Rio Grande do Sul', 'Brasil'),
(23, 'Cliente vinte e tres', 'Eusébio', 'Ceará', 'Brasil'),
(26, 'Cliente vinte e seis', 'Campo Grande', 'Mato Grosso do Sul', 'Brasil');

insert into tb_Combustivel (id_Combustivel, tipo_Combustivel) values
(1, 'Gasolina'),
(2, 'Etanol'),
(3, 'Flex'),
(4, 'Diesel');

insert into tb_Carro (id_Carro, chassi_Carro, marca_Carro, modelo_Carro, ano_Carro, id_Combustivel) values
(1, 'AAAKNS8JS76S39', 'Toyota', 'Corolla XEI', 2023, 3),
(2, 'AKIUNS1JS76S39', 'Nissan', 'Versa', 2019, 2),
(3, 'DKSHKNS8JS76S39', 'VW', 'Fusca 78', 1978, 1),
(4, 'LLLUNS1JS76S39', 'Nissan', 'Versa', 2020, 2),
(5, 'MSLUNS1JS76S39', 'Nissan', 'Frontier', 2022, 4),
(6, 'SKIUNS8JS76S39', 'Nissan', 'Versa', 2019, 1),
(7, 'SSIUNS8JS76S39', 'Fiat', 'Fiat 147', 1996, 1),
(10, 'LKIUNS8JS76S39', 'Fiat', 'Fiat 147', 1996, 1),
(98, 'AKJHKN98JY76539', 'Fiat', 'Fiat Uno', 2000, 1),
(99, 'IKJHKN98JY76539', 'Fiat', 'Fiat Palio', 2010, 1);

insert into tb_Vendedor (id_Vendedor, nome_Vendedor, sexo_Vendedor, estado_Vendedor) values
(5, 'Vendedor cinco', 0, 'São Paulo'),
(6, 'Vendedora seis', 1, 'São Paulo'),
(7, 'Vendedora sete', 1, 'Rio de Janeiro'),
(8, 'Vendedora oito', 1, 'Minas Gerais'),
(16, 'Vendedor dezesseis', 0, 'Amazonas'),
(30, 'Vendedor trinta', 0, 'Rio Grande do Sul'),
(31, 'Vendedor trinta e um', 0, 'Ceará'),
(32, 'Vendedora trinta e dois', 1, 'Mato Grosso do Sul');

insert into tb_Locacao (id_Locacao, id_Cliente, id_Carro, kmCarro, data_Locacao, hora_Locacao, qtd_Diaria, vlr_Diaria, data_Entrega, hora_Entrega, id_Vendedor) values
(1, 2, 98, 25412, '2015-01-10', '10:00', 2, 100, '2015-01-12', '10:00', 5),
(2, 2, 98, 29450, '2015-02-10', '12:00', 2, 100, '2015-02-12', '12:00', 5),
(3, 3, 99, 20000, '2015-02-13', '12:00', 2, 150, '2015-02-15', '12:00', 6),
(4, 4, 99, 21000, '2015-02-15', '13:00', 5, 150, '2015-02-20', '13:00', 6),
(5, 4, 99, 21700, '2015-03-02', '14:00', 5, 150, '2015-03-07', '14:00', 7),
(6, 6, 3, 121700, '2016-03-02', '14:00', 10, 250, '2016-03-12', '14:00', 8),
(7, 6, 3, 131800, '2016-08-02', '14:00', 10, 250, '2016-08-12', '14:00', 8),
(8, 4, 3, 151800, '2017-01-02', '18:00', 10, 250, '2017-01-12', '18:00', 6),
(9, 4, 3, 152800, '2018-01-02', '18:00', 10, 280, '2018-01-12', '18:00', 6),
(10, 10, 10, 211800, '2018-03-02', '18:00', 10, 50, '2018-03-12', '18:00', 16),
(11, 20, 7, 212800, '2018-04-01', '11:00', 10, 50, '2018-04-11', '11:00', 16),
(12, 20, 6, 21800, '2020-04-01', '11:00', 10, 150, '2020-04-11', '11:00', 16),
(13, 22, 2, 10000, '2022-05-01', '08:00', 20, 150, '2022-05-21', '18:00', 30),
(14, 22, 2, 20000, '2022-06-01', '08:00', 20, 150, '2022-06-21', '18:00', 30),
(15, 22, 2, 30000, '2022-07-01', '08:00', 20, 150, '2022-07-21', '18:00', 30),
(16, 22, 2, 40000, '2022-08-01', '08:00', 20, 150, '2022-08-21', '18:00', 30),
(17, 23, 4, 55000, '2022-09-01', '08:00', 20, 150, '2022-09-21', '18:00', 31),
(18, 23, 4, 56000, '2022-10-01', '08:00', 20, 150, '2022-10-21', '18:00', 31),
(19, 23, 4, 58000, '2022-11-01', '08:00', 20, 150, '2022-11-21', '18:00', 31),
(20, 5, 1, 1800, '2023-01-02', '18:00', 10, 880, '2023-01-12', '18:00', 16),
(21, 5, 1, 8500, '2023-01-15', '18:00', 10, 880, '2023-01-25', '18:00', 16),
(22, 26, 5, 28000, '2023-01-25', '08:00', 5, 600, '2023-01-30', '18:00', 32),
(23, 26, 5, 38000, '2023-01-31', '08:00', 5, 600, '2023-02-05', '18:00', 32),
(24, 26, 5, 48000, '2023-02-06', '08:00', 5, 600, '2023-02-11', '18:00', 32),
(25, 26, 5, 68000, '2023-02-12', '08:00', 5, 600, '2023-02-17', '18:00', 32),
(26, 26, 5, 78000, '2023-02-18', '08:00', 1, 600, '2023-02-19', '18:00', 32);


-- Queries para consulta

select * from tb_Locacao

select * from tb_Vendedor

select * from tb_Combustivel

select * from tb_Cliente

select * from tb_Carro
