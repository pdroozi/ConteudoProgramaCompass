select 
	tbdependente.cddep,
	tbdependente.nmdep,
	tbdependente.dtnasc,
	sum(qtd * vrunt) as valor_total_vendas
from tbdependente
left join tbvendedor on tbdependente.cdvdd = tbvendedor.cdvdd
left join tbvendas on tbvendedor.cdvdd = tbvendas.cdvdd
where status = "Concluído"
group by tbdependente.cddep, tbdependente.nmdep, tbdependente.dtnasc
order by valor_total_vendas 
limit 1