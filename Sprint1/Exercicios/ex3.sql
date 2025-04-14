SELECT 
	count (liv.cod) as quantidade,
	edi.nome,
	ende.estado,
	ende.cidade
from livro liv 
left join editora edi
on liv.editora = edi.codeditora
left join endereco ende
on edi.endereco = ende.codendereco

group by edi.nome, ende.estado, ende.cidade
order by quantidade DESC
limit 5
