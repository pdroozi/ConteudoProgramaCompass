select 
	autor.nome	
from autor
left join livro on autor.codautor = livro.autor
where livro.cod is NULL
order by autor.nome