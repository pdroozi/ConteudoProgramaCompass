select 
	tbvendas.estado,
	tbvendas.nmpro,
	round(avg(tbvendas.qtd), 4) as quantidade_media
from tbvendas
where status = "Concluído"
group by tbvendas.estado, tbvendas.nmpro