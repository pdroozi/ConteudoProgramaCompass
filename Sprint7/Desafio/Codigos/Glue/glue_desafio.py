import sys
from awsglue.context import GlueContext
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from pyspark.sql.functions import *
from pyspark.sql.window import Window
from awsglue.dynamicframe import DynamicFrame

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

args = getResolvedOptions(sys.argv, [
    
    'S3_INPUT_PATH_ATORES_PARQUET',
    'S3_INPUT_PATH_DIRETORES_PARQUET',
    'S3_INPUT_PATH_FILMES_PARQUET',
    'S3_INPUT_PATH_PRODUTORAS_PARQUET',
    
    'S3_OUTPUT_PATH_REFINED'
    
])

def save_df(df, especificacao, tipo_dado):
    if tipo_dado == "dimensao":
        dyf = DynamicFrame.fromDF(df, glueContext, "dyf")
        glueContext.write_dynamic_frame.from_options(
            frame=dyf,
            connection_type="s3",
            connection_options={"path": f"{args['S3_OUTPUT_PATH_REFINED']}/{tipo_dado}/{especificacao}"},
            format="parquet"
        )
    elif tipo_dado == "fato":
        dyf = DynamicFrame.fromDF(df, glueContext, "dyf")
        glueContext.write_dynamic_frame.from_options(
            frame=dyf,
            connection_type="s3",
            connection_options={"path": f"{args['S3_OUTPUT_PATH_REFINED']}/{tipo_dado}/{especificacao}"},
            format="parquet"
        )
    elif tipo_dado == "ponte":
        dyf = DynamicFrame.fromDF(df, glueContext, "dyf")
        glueContext.write_dynamic_frame.from_options(
            frame=dyf,
            connection_type="s3",
            connection_options={"path": f"{args['S3_OUTPUT_PATH_REFINED']}/{tipo_dado}/{especificacao}"},
            format="parquet"
        )

filmes     = glueContext.create_dynamic_frame.from_options("s3", {"paths": [args['S3_INPUT_PATH_FILMES_PARQUET']]}, format="parquet").toDF()
atores     = glueContext.create_dynamic_frame.from_options("s3", {"paths": [args['S3_INPUT_PATH_ATORES_PARQUET']]}, format="parquet").toDF()
diretores  = glueContext.create_dynamic_frame.from_options("s3", {"paths": [args['S3_INPUT_PATH_DIRETORES_PARQUET']]}, format="parquet").toDF()
produtoras = glueContext.create_dynamic_frame.from_options("s3", {"paths": [args['S3_INPUT_PATH_PRODUTORAS_PARQUET']]}, format="parquet").toDF()

filmes = filmes.withColumn("vote_imdb", regexp_replace("vote_imdb", ",", "").cast("int")).withColumn("release_date", to_date("release_date"))

generos_exploded = filmes.select(
    col("id").alias("id_filme"),
    explode(split(col("genres"), ",")).alias("nome_genero")
).withColumn("nome_genero", trim(col("nome_genero"))).filter(col("nome_genero").isNotNull())


# Fato principal
fato_filme = filmes.selectExpr(
    
    "id as id_filme", 
    "release_date as id_data", 
    "budget", 
    "revenue",
    "boxoffice", 
    "vote_average", 
    "vote_count", 
    "vote_imdb",
    "rating_imdb", 
    "rating_rottentomatoes",
    "rating_metacritic", 
    "oscars", 
    "wins", 
    "nominations"
    
    ).dropDuplicates()

# Dimensões
dim_filme = filmes.selectExpr(
    
    "id as id_filme",
    "imdb_id",
    "title",
    "runtime",
    "language",
    "country", 
    "release_date" 
    
    ).dropDuplicates()

dim_produtora = produtoras.selectExpr(
    
    "id_produtora", 
    "name", 
    "origin_country", 
    "headquarters"
    
    ).dropDuplicates()

dim_ator = atores.selectExpr(
    
    "id_ator", 
    "name", 
    "gender", 
    "popularity",
    "character", 
    "known_for_department",
    "order"
    
    ).dropDuplicates()

dim_diretor = diretores.selectExpr(
    
    "id_diretor", 
    "name", 
    "gender", 
    "popularity",
    "job",
    "known_for_department"
    
    ).dropDuplicates()

dim_genero = generos_exploded.select("nome_genero").distinct().withColumn("id_genero", dense_rank().over(Window.orderBy("nome_genero")))

dim_tempo = fato_filme.select("id_data").dropDuplicates()
dim_tempo = dim_tempo.withColumn("ano", year("id_data")).withColumn("mes", month("id_data"))
dim_tempo = dim_tempo.withColumn("dia", dayofmonth("id_data"))
dim_tempo = dim_tempo.withColumn("trimestre", quarter("id_data"))
dim_tempo = dim_tempo.withColumn("dia_semana", date_format("id_data", "EEEE"))

# Tabelas ponte
fato_filme_produtora = produtoras.select("id_filme", "id_produtora").dropDuplicates()
fato_filme_ator = atores.select("id_filme", "id_ator").dropDuplicates()
fato_filme_diretor = diretores.select("id_filme", "id_diretor").dropDuplicates()
fato_filme_genero = generos_exploded.join(dim_genero, on="nome_genero", how="left").select("id_filme", "id_genero")

# Salvar no S3

save_df(fato_filme, "fato_filme", "fato")

save_df(dim_filme, "dim_filme", "dimensao")
save_df(dim_produtora, "dim_produtora", "dimensao")
save_df(dim_ator, "dim_ator", "dimensao")
save_df(dim_diretor, "dim_diretor", "dimensao")
save_df(dim_genero, "dim_genero", "dimensao")
save_df(dim_tempo, "dim_tempo", "dimensao")

save_df(fato_filme_produtora, "fato_filme_produtora", "ponte")
save_df(fato_filme_ator, "fato_filme_ator", "ponte")
save_df(fato_filme_diretor, "fato_filme_diretor", "ponte")
save_df(fato_filme_genero, "fato_filme_genero", "ponte")
