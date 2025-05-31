
# Resumo

---

## AWS PARTNER: SALES ACCREDITATION

- Curso com duração de 3h onde pude obter conhecimentos sobre a base necessária para os profissionais de venda entenderem o valor comercial da AWS, o curso abrangiu:

  - Módulos com ensinamentos sobre os conceitos iniciais e básicos da computação em nuvem.
  - Módulos com ensinamentos sobre os benefícios da articulação para os sistemas cloud da AWS.
  - Módulos com ensinamentos sobre técnicas para lidar com questionamentos, dúvidas e objeções dos clientes aos quais venderemos o produto.
  - Módulos com ensinamentos sobre estratégicas de venda conjunta com outras equipes parceiras da AWS, usando modelos e ferramentas tendo sempre como objetivo, o cliente.

## AWS PARTNER: CLOUD ECONOMICS

- Curso com duração de 2h30m com foco em valor econômico e financeiro onde pude obter aprendizados sobre os benefícios econômicos de se usar a AWS, o curso abrangiu:

  - Módulos sobre **AWS CAF** (Cloud Adoption Framework), seus pilares (redução de custo, inovação e agilidade) ensinando a ajudar organizações a começar a usar as ferramentas AWS, com melhores práticas, ferramentas e orientações, agrupando seus recursos em seis diferentes grupos:

    - Pessoas
    - Negócios
    - Segurança
    - Operações
    - Plataforma
    - Governança

## AWS Cloud Quest: Cloud Practitioner

- Jogo interativo com 12 exercícios práticos, onde pude aprender através de vídeos, quizzes e diagramas os fundamentos básicos da AWS, o curso abrangiu:

  - Conceitos de Nuvem, Rede, Armazenamento, Segurança e IOT.
  - Tarefas práticas com diferentes ferramentas da AWS (EC2, S3, Lambda, Athena, IAM), com foco em preparação para a certificação **AWS Cloud Practitioner**.

# Exercícios

---

## LabLambda

[DockerfileLambda](../Sprint4/Exercicios/AWSLabs/LabLambda/camadaLambda/Dockerfile)

[ZipLambda](../Sprint4/Exercicios/AWSLabs/LabLambda/camadaLambda/minha-camada-pandas.zip)

## Lab S3

[indexS3](../Sprint4/Exercicios/AWSLabs/LabS3/data/index.html)

[error404](../Sprint4/Exercicios/AWSLabs/LabS3/data/404.html)

[csvNomes](../Sprint4/Exercicios/AWSLabs/LabS3/data/nomes.csv)

# Evidências

---

## Lab S3

### Etapa 1

- Selecionar a ferramenta S3 na aba de pesquisa

![EscolherS3](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa1/SelectS3.JPG)

- Clicar em **Criar Bucket**

![CreateBucket](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa1/CreateNameBucket.JPG)

- Confirmar se o Bucket foi devidamente criado

![ConfirmCreateBucket](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa1/ConfirmCreateNameBucket.JPG)

### Etapa 2

- Com o bucket criado, clicar em Property

![Property](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa2/Property.JPG)

- Clicar em Hospedagem de Site Estático

![Static](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa2/StaticWebsite_IndexHTML.JPG)

- Habilidar a Hospedagem de Site Estático e preencher o Documento de Texto com o arquivo index.html baixado e confirmar

![Static Enable](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa2/ConfirmStaticWebsite_CopyEndpoint.JPG)

- Copiar o endpoint do site no fim da página e colar em uma guia de internet

![TestEndpoint](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa2/ConfirmStaticWebsite_CopyEndpoint.JPG)

### Etapa 3

- Ir em Permissões

![Permissoes](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa3/Permissions.JPG)

- Em "Bloquear Acesso Publico", clique em editar

![Dismarck](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa3/DesmarkBlock.JPG)

- Desmarque a opção geral e escreva Confirmar para a autenticação

![TestBlock](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa3/confirmTest.JPG)

- Volte em Permissões e Confirme que o "Bloquear Acesso Publico" esteja dessa vez Desativado

![ConfirmDismarck](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa3/ConfirmDesmarkBlock.JPG)

### Etapa 4

- Volte para Permissões e desça até a aba Políticas do Bucket

![PolitcsBucket](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa4/PolitcsBucket.JPG)

- Insira as políticas JSON

![JSON](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa4/PoliticsJSON_CODE-SaveChanges.JPG)

- Clique em Salvar e confirme que as políticas foram inseridas corretamente e com sucesso

![ConfirmPolitcsJSON](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa4/ConfirmPolitcsBucket.JPG)

### Etapa 5

- Volte para Objetos e faça o Upload do arquivo index.html

![UploadIndex](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa5/UplodIndex.JPG)

- Cria uma pasta chamada Dados

![CreateDados](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa5/createFolder.JPG)

- Faça o Upload do arquivo nomes.csv dentro da pasta Dados

![UploadCSV](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa5/uploadCSV_in_dados.JPG)

- Confirme que os dois arquivos e a pasta foram criados e salvos corretamente

![ConfirmCreateArchivesFolder](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa5/confirmInsertArchives.JPG)

### Etapa 6

- Crie um arquivo chamado 404.html

![ErrorArchive](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa6/create'404.html'.jpg)

- Faça o Upload dele no Bucket e clique em Salvar

![ConfirmInsertError](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa6/ConfirmERRORINSERT.JPG)

### Etapa 7

- Vá para Property e em "Hospedagem de Site Estático" clique em Editar e insira no campo "Arquivo de Erro" o arquivo 404.html criado anteriormente e Salve as alterações

![InsertError](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa7/insert404error_and_savechanges.JPG)

- Copie o endpoint de novo e insira em uma nova guia e teste

![TestFinalEndpoint](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa7/testEndPoint_again.JPG)

- Clique no botão de Download e cheque se ele foi realizado sem mais problemas encerrando assim o laboratório com a ferramenta S3

![ClickDownloadCSV](../Sprint4/Evidencias/AWS%20Labs/Lab%20S3/Etapa7/testButtonDownloadCSV.JPG)

## Lab Athena

### Etapa 1

- Selecionar a ferramenta Athena na aba de pesquisa

![SelectAthena](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/selectAthena.JPG)

- Baixe o arquivo CSV do exercício anterior se ainda não foi baixado e o abra para analisar os dados e os tipos deles

![TiposDados](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/DadosNomesCSV.JPG)

- Crie dentro do Bucket do exercício anterior uma pasta chamada "queries", clique em salvar e confirme que ela foi criada de forma adequada

![CreateQueriesFolder](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/createQueriesFolder.JPG)

![ConfirmCreateQueriesFolder](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/confirm_createQueriesFolder.JPG)

- Acessa o Athena e clique em Explorar o Editor de Consultas

![AthenaWindow](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/mainpageAthena.JPG)

- Clique em Settings e depois em Manage

![Manage](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/manage.JPG)

- Clique em Gerenciar, e dentro de Localização dos Resultados de Pesquisa, selecione a pasta "queries" criada anteriormente (use o Browse S3 se quiser), clique em Salvar e cheque se o caminho foi indicado corretamente

![QueryLocate](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/chooseQueriesFolder.JPG)

![ConfirmQueryLocate](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa1/confirm_chooseQueriesFolder.JPG)

### Etapa 2

- Volte para Editor, e crie um banco de dados "meubanco", usando o comando "create database", e após criado, selecione o banco no campo "Databases" à esquerda

![CreateDatabase](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa2/createANDchoose_database.JPG)

### Etapa 3

- Cria uma tabela com os nomes e os tipos dos dados mais adequados baseados no arquivo csv baixado no início da atividade

![CreateTable](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa3/createTables.JPG)

- Utilize a query a seguir no banco para teste dos dados "select nome from nomedobanco.nomedatabela where ano = 1999 order by total limit 15;"

![TestData](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa3/query4..JPG)
![CSVTestData](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa3/csv_query4..JPG)

- Crie uma query que colete os três nomes que mais aparecem por década, terminando assim nosso laboratório com a ferramenta Athena

![QueryNome](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa3/query5..JPG)
![CSVQueryNome](../Sprint4/Evidencias/AWS%20Labs/Lab%20Athena/Etapa3/csv_query5..JPG)

## Lab Lambda

### Etapa 1

- Selecione a ferramenta Lambda na aba de pesquisa

![SelectLambda](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa1/selectLambda.JPG)

- Em "Criar do Zero", crie uma função, selecione Python 3.9 em RunTime e depois clique em Salvar, e garanta que foi criado corretamente

![CreateFunction](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa1/createFunction.JPG)
![ConfirmCreateFunction](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa1/confirm_createFunction.JPG)

### Etapa 2

- Clique na função e substitua na tela da IDE a parte de "TODO Implement" pelo código informado

![ReplaceTODO](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa2/replaceTODO.JPG)

- Com o código alterado, clique em Deploy para salvar as alterações

![Deploy](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa2/deployCode.JPG)

- Clique em Test, o esperado é que dê erro

![ErrorTest](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa2/errorMessage.JPG)

### Etapa 3

- Com o objetivo de criar uma Layer, temos que criar um arquivo Dockerfile localmente

![DockerfileCreate](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/createDockerfile.JPG)

- Construa uma imagem desse arquivo dockerfile e confirme a criação dela via DockerDesktop

![CreateImage](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/buildImage.JPG)

![ConfirmCreateImage](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/confirm_buildImage.JPG)

- Rode o Dockerfile e dentro do bash dele, crie um arquivo layer_dir

![Layer](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/layers_dir.JPG)

- Dentro do arquivo layer_dir, compacte todos os arquivos em formato zip

![Zip](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/zipLayer_Dir.JPG)

- Copia o arquivo zip para o Dockerfile local usando o id do container criado

![ID](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/copyID.JPG)

- Suba o arquivo zip para o bucket S3

![SubirZip](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/subirParaBucket.JPG)

- Volte para o Lambda, crie em Camadas e depois em Criar uma Camada, crie uma camada chamada PandasLayer e clique em Salvar, garanta que a camada foi criada de forma adequada

![PandasLayer](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/createLayer.JPG)

![ConfirmPandasLayer](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa3/confirm_createLayer.JPG)

### Etapa 4

- Selecione Função no menu, localize a função criada, e dentro dela, vá em Layers, e clique em "Adicionar uma Camada", escolha CustomLayers, localize a camada criada, e adicione

![CreateLayerCamada](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa4/addLayer.JPG)

![ConfirmLayerCamada](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa4/confirm_addLayer.JPG)

- Volte à tela de código na IDE, e clique novamente em Teste, dessa vez, dará certo, encerrando assim, nosso laboratório com a ferramenta Lambda

![TestSucess](../Sprint4/Evidencias/AWS%20Labs/Lab%20Lambda/Etapa4/testANDSuccess.JPG)

## Lab Limpeza

- Propósito é apagar todo e qualquer arquivo ou ferramenta criada durante os exercícios com o objetivo de evitar custos não programados, encerrando assim nossos laboratórios com as ferramentas AWS

![DropLambda](../Sprint4/Evidencias/AWS%20Labs/Lab%20Limpeza/dropLambdaANDLayers.JPG)

![DropDatabaseAthena](../Sprint4/Evidencias/AWS%20Labs/Lab%20Limpeza/dropDatabase.JPG)

![DropObjecsS3](../Sprint4/Evidencias/AWS%20Labs/Lab%20Limpeza/dropObjectsS3.JPG)

![DropBucketS3](../Sprint4/Evidencias/AWS%20Labs/Lab%20Limpeza/dropBucketS3.JPG)

# Certificados

---

![AWS Cloud Economics](../Sprint4/Certificados/Cloud%20Economics/AWS%20Partner%20Cloud%20Economics_page-0001.jpg)

![AWS Cloud Sales](../Sprint4/Certificados/Sales%20Accreditation/AWS%20Partner%20Sales%20Accreditation_page-0001.jpg)
