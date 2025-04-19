-- Queries de criação de Views

create view dim_Cliente as
select 
	id_Cliente,
	nome_Cliente,
	cidade_Cliente,
	estado_Cliente,
	pais_Cliente
from tb_Cliente;

create view dim_Vendedor as
select 
	id_Vendedor,
	nome_Vendedor,
	sexo_Vendedor,
	estado_Vendedor
from tb_Vendedor;

create view dim_Carro as
select 
	id_Carro,
	chassi_Carro,
	marca_Carro,
	modelo_Carro,
	ano_Carro,
	tipo_Combustivel
from tb_Carro
left join tb_Combustivel on tb_Carro.id_Combustivel = tb_Combustivel.id_Combustivel;

create view dim_tempo as
select 
	id_Locacao,
	concat(data_Locacao, ' ', hora_Locacao) as data_locacao_resultante,
	concat(data_Entrega, ' ', hora_Entrega) as data_entrega_resultante,
	concat(data_Locacao, ' ', hora_Locacao) - concat(data_Entrega, ' ', hora_Entrega) as tempo_restante_para_entrega,
	sum(qtd_Diaria * vlr_Diaria) as valor_total_locacao
from tb_Locacao;

create view fato_Locacao as
select 
	tb_Locacao.id_Locacao,
	id_Cliente,
	id_Carro,
	id_Vendedor,
	data_locacao_resultante,
	data_entrega_resultante,
	tempo_restante_para_entrega,
	valor_total_locacao
from tb_Locacao
left join dim_tempo on tb_Locacao.id_Locacao = dim_tempo.id_Locacao;
