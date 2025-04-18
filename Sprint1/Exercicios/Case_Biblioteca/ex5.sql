select distinct
    autor.nome
    
    
from autor

left join livro on autor.codautor = livro.autor
left join editora on livro.editora = editora.codeditora
left join endereco on editora.endereco = endereco.codendereco

where estado not in ('PARANÁ', 'SANTA CATARINA', 'RIO GRANDE DO SUL')

order by autor.nome 