import sys
import re
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Parâmetros esperados
args = getResolvedOptions(sys.argv, [
    
    'JOB_NAME',
    
    'S3_INPUT_PATH_ATORES',
    'S3_INPUT_PATH_DIRETORES',
    'S3_INPUT_PATH_FILMES',
    
    'S3_OUTPUT_PATH_BASE'
])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)


def extrair_data(path):
    pares = r'/(\d{4})/(\d{2})/(\d{2})/'
    encontro = re.search(pares, path)
    if encontro:
        return encontro.group(1), encontro.group(2), encontro.group(3)


def conversor_parquet(caminho_entrada, caminho_saida, especificacao):
    
    df = glueContext.create_dynamic_frame.from_options(
        connection_type="s3",
        connection_options={"paths": [caminho_entrada]},
        format="json"
    )

    ano, mes, dia = extrair_data(caminho_entrada)

    glueContext.write_dynamic_frame.from_options(
        frame=df,
        connection_type="s3",
        connection_options={"path": f"{caminho_saida}/{especificacao}/data_de_ingestao={ano}/{mes}/{dia}/"},
        format="parquet"
    )

# Execução para cada tipo de dado
conversor_parquet(args["S3_INPUT_PATH_ATORES"], args["S3_OUTPUT_PATH_BASE"], "Atores")
conversor_parquet(args["S3_INPUT_PATH_DIRETORES"], args["S3_OUTPUT_PATH_BASE"], "Diretores")
conversor_parquet(args["S3_INPUT_PATH_FILMES"], args["S3_OUTPUT_PATH_BASE"], "Filmes")

job.commit()
