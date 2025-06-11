
# Desafio

---

## Questionamentos que buscamos responder

## Etapa1

- Acesse por aqui, os arquivos Python e Dockerfile entregáveis da Etapa1

[DockerFileEtapa1](../Desafio/Etapa1/Dockerfile)

[ArquivoPythonEtapa1](../Desafio/Etapa1/appCSV/uploadCSVs.py)

- A Etapa1 do Desafio tem por objetivo realizar a implementação de um arquivo python que leia dois arquivos CSVs baixados, de forma inteira, e os insira em um Bucket S3 utilizando Boto3, na camada RAW Zone, seguinto o padrão estabelecido:

(<nome do bucket>\<camada de armazenamento>\<origem do dado>\<formato do dado>\<especificação do dado>\<data de processamento separada por ano\mes\dia>\<arquivo>)

![CodigoPyEtapa1](../Evidencias/Desafio/Etapa1/code_uploadCSVs.PNG)

- O código se inicia com a importação da biblioteca boto3, e a definiçãde algumas variáveis, são elas:

  - session: sessão do boto3 que armazena as chaves de acesso da conta AWS, gravadas no perfil pdroozi criado na Sprint passada
  - s3_client: cliente criado utilizando a variável sessão que cria uma linha de conexão do perfil com o serviço escolhido, no caso, o S3
  - bucket-name: nome do bucket que será criado na AWS
  - file_name (1 e 2): nome dos arquivos que serão upados para dentro do bucket, no caso, os dois arquivos CSV ("movies" e "series")

- É usada a função create_bucket, que utiliza o bucket-name como parâmetro, e retorna, em caso de sucesso, uma mensagem de confirmação sobre a crição do bucket na AWS

- É usada duas funções upload_file, uma para cada arquivo CSV, que utiliza como parâmetro o caminho para acessar os arquivos na máquina local, o nome do bucket para onde serão armazenados, e o caminho onde eles serão armazenados dentro do bucket, no caso, iremos seguir o padrão estabelecido acima

- Com a criação do arquivo Python, temos agora que criar um arquivo Dockerfile, que irá criar uma imagem desse nosso arquivo Python, e gerar um container, onde iremos rodá-lo, executando assim, o upload dos arquivos, o arquivo Dockerfile, pode ser acesso pelo link já fornecido acima

- Com o Dockerfile criado, temos que iniciar a crição da nossa imagem, utilizando o comando docker build, e confirmar via terminal e DockerDesktop se foi criada corretamente

``
docker build image_app_csv
``

![dockerBuildImage](../Evidencias/Desafio/Etapa1/dockerBuildImage.PNG)

![confirmDockerBuildImage](../Evidencias/Desafio/Etapa1/confirm_dockerBuildImage_viaDockerDesktop.PNG)

- Com a imagem criada, podemos executá-la, porém, é necessário algumas preparações antes, primeiro temos que criar dois volumes, um deles para armazenar os arquivos CSV que iremos utilizar para realizar o upload, e o segundo, para armazenar o arquivo .aws com as chaves de acesso da AWS que iremos utilizar, já que sem elas, dentro do container, não é possível acessar as chaves pelo aws profile

- Com os volumes estabelecidos, podemos executar nossa imagem, confirmar a execução dela via terminal (esperado o aparecimento das mensagens de confirmação já citadas), via DockerDesktop

![dockerRun](../Evidencias/Desafio/Etapa1/dockerRunImage.PNG)

![confirmdockerRun](../Evidencias/Desafio/Etapa1/DockerImageRunning.PNG)

- Podemos então, ir até nosso serviço S3, e confirmar a criação de um novo bucket, e o upload dos dois arquivos CSV

![BucketVazio](../Evidencias/Desafio/Etapa1/bucketVazio.PNG)

![ConfirmDockerRunViaAWS](../Evidencias/Desafio/Etapa1/confirm_dockerRunImage_viaAWS_S3.PNG)

![ConfirmUploadMovies](../Evidencias/Desafio/Etapa1/upload_movies.PNG)

![ConfirmUploadSeries](../Evidencias/Desafio/Etapa1/upload_series.PNG)

## Etapa2
