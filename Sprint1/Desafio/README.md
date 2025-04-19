
# Etapas

---

1- [Etapa I](../Desafio/etapa-1/)

Nessa etapa o objetivo é realizar a normalização do banco de dados **concessionaria.zip**, partindo pros conceitos de normalização utilizando as formas normais, nos deparamos com a primeira forma normal (1FN), que tem como objetivo retirar os atributos ou grupos repetitivos, que são representações de informações que se repetem para uma mesma unidades, gerando ocorrências a uma mesma entidade.

Analisando os dados do banco utilizando uma simples comando de consulta

```
Select * from tb_locacao 
```

Obtive o seguinte retorno

![Banco de Dados Concessionaria](../Evidencias/Desafio/Dados_Não_Normalizados.JPG)

Analisando as colunas, é perceptível que a tabela está em 1FN, não existem campos multivalores, e os dados estão atômico, apesar do cliente vinte e dois aparecer várias vezes, cada ocorrência está em uma linha, o que é permitido pela 1FN

Porém ela infringe a 2FN, forma normal essa que explicitamente tem o objetivo de separar as dependências parciais, sendo elas identificadas e individualizadas, é necessária a criação de novas tabelas, existe dependência parcial nas seguintes colunas:

![Dependencia Parcial Cliente](../Evidencias/Desafio/1FN_Redundância_Cliente.JPG)

Na imagem acima podemos ver que as colunas **nomeCliente, cidadeCliente, estadoCliente e paisCliente** dependem não só da chave da entidade (id_locacao) mas tambem da idCliente, logo é considerada dependência parcial, e deve-se criar uma nova entidade para abrigar esses atributos parcialmente dependentes, com a idCliente se tornando chave estrangeira da entidade principal (tblocacao)

![Dependencia Parcial Carro](../Evidencias/Desafio/1FN_Redundância_Carro.JPG)

Na imagem acima, as colunas **chassiCarro, marcaCarro, modeloCarro, anoCarro** dependetem parcialmente tanto da idCarro, quanto do atributo chave da entidade (idLocacao), seguindo o exemplo da situação anterior, temos que criar uma nova entidade para abrigar esses atributos parcialmente dependentes, com a idCarro se tornando chave estrangeira da entidade principal (tbLocacao)

![Dependencia Parcial Combustivel](../Evidencias/Desafio/1FN_Redundância_Combustivel.JPG)

Na imagem acima a coluna **tipoCombustivel** depende parcialmente da coluna idCombustivel e do atributo chave, logo é necessário criar uma nova entidade para abrigar esse atributo, com a idCombustivel se tornando chave estrangeira da entidade principal (tbLocacao)

![Dependencia Parcial Vendedor](../Evidencias/Desafio/2FN_Redundância_Vendedor.JPG)

Por último, na imagem acima as colunas **nomeVendedor, sexoVendedor, estadoVendedor** dependem da idVendedor, assim como dependem do atributo chave da entidade, portanto, é se criada uma nova tabela abrigando essas colunas, com a idVendedor se tornando chave estrangeira da entidade principal (tbLocacao)

Fazendo a criação das novas tabelas, com inserção dos dados e verificação de funcionamento utilizando simples consultas

Obtive o retorno do seguinte diagrama

![Diagrama 2FN](../Evidencias/Desafio/DER_Concessionaria_2FN.JPG)

Logo, podemos concluir que a nosso banco está normalizado pelas regras da 2FN

Partindo pra 3FN, que tem como objetivo eliminar dependências transitivas, ou seja, atributos não-chave que são, atributos que não são dependentes diretamente da chave, mas sim por transitividade, ou seja, por outros atributos não-chave, é o caso que vemos a seguir

![Dependencia Carro Combustivel](../Evidencias/Desafio/3FN_DependenciaParcial_Carro-Combustivel.JPG)

Como vemos na imagem acima, o atributo chave estrangeira idCombustivel, depende diretamente de outro atributo estrangeiro idCarro, pra resolver esse problema, apenas incluí o idCombustivel como um atributo do idCarro, assim o relacionamento entre as duas entidades ficou assim

![Relacionamento Carro Combustivel](../Evidencias/Desafio/RelacionamentoCarroCombustivel.JPG)

Agora podemos considerar de vez nosso banco de dados normalizado com as três formas normais, os atributos kmCarro, data/hora locação/entrega, valorDiaria e qtdDiaria, são totalmente dependentes da chave primária da entidade e devem continuar sendo atributos não-chave dela

Olhando o resultado final do nosso banco de dados, o diagrama é formado após a normalização é esse

![Diagrama 3FN](../Evidencias/Desafio/DER_Concessionaria_3FN.JPG)

Para replicar a construção dos bancos de dados em 2FN e 3FN o arquivo .sql com as queries necessárias estão disponívels aqui

[QueryEtapa1_2FN](../Desafio/etapa-1/concessionaria_2FN.sql) para 2FN

[QueryEtapa1_3FN](../Desafio/etapa-1/concessionaria_3FN.sql) para 3FN


Finalizado a Etapa 1, com o nosso banco normalizado, partiremos agora para a Etapa 2 onde iremos realizar a construção de um Diagrama Dimensional oriundo desse nosso Diagrama Relacional

2- [Etapa 2](../Desafio/etapa-2/)
