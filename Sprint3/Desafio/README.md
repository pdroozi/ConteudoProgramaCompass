
# Desafio

O presente desafio da sprint será explicado de forma dividida de acordo com as etapas, que foram distribuídas em subseções abaixo.

## Etapa 1 Limpeza CSV

O objetivo da etapa 1 é realizar o download de um arquivo csv e realizar a limpeza de seus dados, para posterior processamento.

- O código se inicia com o uso da biblioteca pandas para leitura do arquivo csv original, que será armazenado em uma variável chamada dataframOriginal, como podemos ver na imagem abaixo:

![importEdataframe.](../Evidencias/Desafio/Etapa1/Import%20e%20leitura.JPG)

- As primeiras colunas a serem limpadas serão as colunas Actual Gross, Adjusted Gross e Average Gross por todas serem colunas monetárias, para limpar, utilizarmos a funções replace para substituir o sinal monetário por um valor vazio, deixando as string apenas com numeros, após isso, utilizamos a função toNumeric para transformar a string em um valor numérico, esse que será usado para etapas futuras. Veja o código abaixo:

![ColunasMonetarias.](../Evidencias/Desafio/Etapa1/ColunasMonetarias.JPG)

- As próximas colunas são as colunas Artists e Tour Title, colunas de texto que aconteceram erros de escrita devido ao processo de webscraping, iremos utilizar várias funções replace para substituir os textos errados por valores vazios, deixando assim o texto da coluna limpa. Veja o código abaixo:

![ColunasTexto.](../Evidencias/Desafio/Etapa1/TextosComErros.JPG)

- A última coluna é a coluna Year, que dela iremos extrair duas datas, uma do início da turnê, e uma do fim da mesma. Para isso usamos a função extract para extrair essas datas e dividir elas em duas colunas diferentes (Start Year e End Year) e após isso utilizamos a função astype(int) para transformar as datas que antes eram uma string, em um número inteiro. Veja o código abaixo:

![ColunaData.](../Evidencias/Desafio/Etapa1/DatasInicioeFim.JPG)

- Por fim, realizamos a seleção de todas essas colunas, agrupamos ela uma variável que seja agora o nosso dataframeLimpo, e exportamos esse csv resultante para a devida pasta. Veja o código abaixo:

![ExporteDataLimpo.](../Evidencias/Desafio/Etapa1/Import%20e%20leitura.JPG)

Veja abaixo o antes e o depois do dataframe:

![DataframeOriginal.](../Evidencias/Desafio/Etapa1/DataframeOriginal.JPG)
![DataframeLimpo.](../Evidencias/Desafio/Etapa1/DataframeLimpo.JPG)

Com isso terminamos a Etapa 1 com a limpeza do nosso dataframe.

## Etapa 2 Processamento dos Dados

O objetivo da etapa 2 é utilizar o dataframeLimpo para processar e analisar os dados com o objetivo de gerar insights que respondam as perguntas abaixo:

![Perguntas.](../Evidencias/Desafio/Etapa2/Perguntas.JPG)

- A primeira pergunta
