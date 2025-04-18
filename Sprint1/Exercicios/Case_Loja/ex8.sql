select
	tbvendedor.cdvdd,
	tbvendedor.nmvdd
from tbvendedor
left join tbvendas on tbvendedor.cdvdd = tbvendas.cdvdd
where status = "Concluído"
group by tbvendedor.cdvdd, tbvendedor.nmvdd
order by count(tbvendas.cdven) desc 
limit 1