select 
	tbvendas.cdpro,
	tbvendas.nmpro
from tbvendas
where status = "Concluído" and tbvendas.dtven BETWEEN "2014-02-03" and "2018-02-02"
group by tbvendas.cdpro, tbvendas.nmpro
order by count(tbvendas.cdven) desc 
limit 1