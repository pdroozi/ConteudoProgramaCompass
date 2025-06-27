import sys
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.dynamicframe import DynamicFrame
from pyspark.sql import functions as F

args = getResolvedOptions(sys.argv, ['JOB_NAME', 'S3_INPUT_PATH', 'S3_TARGET_PATH'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

###Passo1
df_glue_dynamic = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={"paths": [args['S3_INPUT_PATH']]},
    format="csv",
    format_options={"withHeader": True, "separator": ","}
)

###Passo2
print("Schema:")
df_glue_dynamic.printSchema()

###Passo3
df_spark = df_glue_dynamic.toDF()
df_spark = df_spark.withColumn("nome", F.upper(F.col("nome")))

df_spark.createOrReplaceTempView("nomes")

###Passo4
print("Linhas:")
spark.sql("SELECT COUNT(*) AS total_linhas FROM nomes").show()

###Passo5
print("Contagem nomes por ano e sexo:")
spark.sql("""
    SELECT ano, sexo, COUNT(*) AS total_nomes
    FROM nomes
    GROUP BY ano, sexo
    ORDER BY ano DESC
""").show()

###Passo6
print("Nome feminino mais registrado no dataframe:")
spark.sql("""
    SELECT nome, ano, COUNT(*) AS total_ocorrencias
    FROM nomes
    WHERE sexo = 'F'
    GROUP BY nome, ano
    ORDER BY total_ocorrencias DESC
    LIMIT 1
""").show()

###Passo7
print("Nome masculino mais registrado no dataframe:")
spark.sql("""
    SELECT nome, ano, COUNT(*) AS total_ocorrencias
    FROM nomes
    WHERE sexo = 'M'
    GROUP BY nome, ano
    ORDER BY total_ocorrencias DESC
    LIMIT 1
""").show()

###Passo8
print("Total de nomes masculinos e femininos por ano:")
spark.sql("""
    SELECT ano, sexo, COUNT(*) AS total_nomes
    FROM nomes
    GROUP BY ano, sexo
    ORDER BY ano ASC
    LIMIT 10
""").show()

###Passo9
df_glue_dynamic_particionado = DynamicFrame.fromDF(df_spark, glueContext, "df_glue_dynamic_particionado")

glueContext.write_dynamic_frame.from_options(
    frame=df_glue_dynamic_particionado,
    connection_type="s3",
    connection_options={
        "path": args['S3_TARGET_PATH'],
        "partitionKeys": ["sexo", "ano"]
    },
    format="json"
)

job.commit()
