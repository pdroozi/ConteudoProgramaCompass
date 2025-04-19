select 
	editora.codeditora as CodEditora,
	editora.nome as NomeEditora,
	count(livro.cod) as QuantidadeLivros
from livro
left join editora on livro.editora = editora.codeditora 
group by editora.codeditora, editora.nome
order by count(livro.cod) desc
limit 5