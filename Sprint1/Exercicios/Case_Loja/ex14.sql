select 
	tbvendas.estado,
	round(avg(tbvendas.qtd * tbvendas.vrunt), 2) as gastomedio
from tbvendas
where status = "Concluído"
group by tbvendas.estado
order by gastomedio desc 
