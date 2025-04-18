select 
	tbvendedor.nmvdd as vendedor,
	sum(qtd * vrunt) as valor_total_vendas,
	round(sum((qtd * vrunt) * (perccomissao / 100.0)), 2) as comissao
from tbvendas
left join tbvendedor on tbvendas.cdvdd = tbvendedor.cdvdd
where status = "Concluído"
group by tbvendas.cdvdd
order by comissao desc 