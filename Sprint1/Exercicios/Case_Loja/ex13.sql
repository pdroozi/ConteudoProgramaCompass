select 
	tbvendas.cdpro,
	tbvendas.nmcanalvendas,
	tbvendas.nmpro,
	sum(qtd) as quantidade_vendas
from tbvendas
where status = "Concluído"
group by tbvendas.cdpro, tbvendas.nmcanalvendas, tbvendas.nmpro
order by quantidade_vendas 
limit 10