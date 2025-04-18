select 
	tbvendas.cdcli,
	tbvendas.nmcli,
	sum(qtd * vrunt) as gasto
from tbvendas
where status = "Concluído"
group by tbvendas.cdcli, tbvendas.nmcli
order by gasto desc
limit 1